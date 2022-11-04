import 'dart:async';

import 'package:flutter/material.dart';
import '../../controllers/repositories.controller.dart';
import '../../models/repositories.model.dart';

class GithubProjects extends StatefulWidget {
  const GithubProjects({super.key});

  @override
  State<GithubProjects> createState() => _GithubProjectsState();
}

class _GithubProjectsState extends State<GithubProjects> {
  TextEditingController controller = TextEditingController();
  List<RepositoriesModel> repositories = [];
  Timer? deboucher;
  static const TextStyle textWhite = TextStyle(color: Colors.white);

  Future init() async {
    final repositories = await RepositorieController.getElement();

    setState(() {
      this.repositories = repositories;
    });
  }

  void _orderAZ() {
    setState(() {
      repositories.sort((RepositoriesModel a, RepositoriesModel b) =>
          a.name!.compareTo(b.name!));
    });
  }

  void _orderZA() {
    setState(() {
      repositories.sort(
        (RepositoriesModel a, RepositoriesModel b) =>
            b.name!.compareTo(a.name!),
      );
    });
  }

  void _orderRecent() {
    setState(() {
      repositories.sort(
        (RepositoriesModel a, RepositoriesModel b) =>
            b.createdAT!.compareTo(a.createdAT!),
      );
    });
  }

  void _orderOlder() {
    setState(() {
      repositories.sort(
        (RepositoriesModel a, RepositoriesModel b) =>
            a.createdAT!.compareTo(b.createdAT!),
      );
    });
  }

  void _filterArchved() {
    debounce(() async {
      List<RepositoriesModel> repositories =
          await RepositorieController.getElement();

      List<RepositoriesModel> filtered = repositories
          .where((RepositoriesModel element) => element.archived == true)
          .toList();

      setState(() {
        this.repositories = filtered;
      });
    });
  }

  void _filterDisable() {
    debounce(() async {
      List<RepositoriesModel> repositories =
          await RepositorieController.getElement();

      List<RepositoriesModel> filtered = repositories
          .where((RepositoriesModel element) => element.archived == true)
          .toList();

      setState(() {
        this.repositories = filtered;
      });
    });
  }

  Future _search(String query) async {
    debounce(
      () async {
        List<RepositoriesModel> repositories =
            await RepositorieController.getElement();

        List<RepositoriesModel> filtered = repositories.where(
          (RepositoriesModel repositorie) {
            final String name = repositorie.name.toString().toLowerCase();
            final String input = query.toLowerCase();

            return name.contains(input);
          },
        ).toList();

        setState(() {
          this.repositories = filtered;
        });
      },
    );
  }

  void debounce(VoidCallback callback,
      {Duration duration = const Duration(microseconds: 50)}) {
    if (deboucher != null) {
      deboucher!.cancel();
    }

    deboucher = Timer(duration, callback);
  }

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  dispose() {
    deboucher?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RepositorieController.getElement(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 24, left: 8),
                    child: Text(
                      'ORDER BY',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: _orderAZ,
                        child: const Text('A-Z'),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: _orderZA,
                        child: const Text('Z-A'),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: _orderRecent,
                        child: const Text('RECENT DATE'),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: _orderOlder,
                        child: const Text('OLDER DATE'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 24,
                      left: 8,
                    ),
                    child: Text(
                      'FILTER BY',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: init,
                        child: const Text('ALL'),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: _filterArchved,
                        child: const Text('ARCHIVED'),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: _filterDisable,
                        child: const Text('DISABLED'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: TextFormField(
                      controller: controller,
                      decoration: const InputDecoration(
                        labelText: "PESQUISA",
                        suffixIcon: Icon(Icons.search),
                      ),
                      onChanged: _search,
                    ),
                  ),
                  const SizedBox(height: 24),
                ] +
                repositories
                    .map(
                      (RepositoriesModel data) => ListTile(
                        leading: const Icon(Icons.archive),
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            data.name ?? '',
                            style: textWhite,
                          ),
                        ),
                        subtitle: Text(
                          "${data.description != null ? '${data.description}  |  ' : ''}${data.createdAT ?? ''}",
                          style: textWhite,
                        ),
                      ),
                    )
                    .toList() +
                [
                  const SizedBox(height: 64),
                ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
