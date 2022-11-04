import 'package:flutter/material.dart';
import '../components/footer.dart';
import '../widgets/avatar.dart';
import '../components/about_me.dart';
import '../components/github_projects.dart';
import '../components/profile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  static final ScrollController controller = ScrollController();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const String src =
      'https://avatars.githubusercontent.com/u/79657620?v=4';

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("MY PORTFOLIO"),
        backgroundColor: Colors.blue[900],
        actions: sizeScreen.width >= 700
            ? [
                const Center(
                  child: Text("DEVELOPER WEB & MOBILE"),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.developer_board_rounded),
                const Avatar(src: src),
              ]
            : const [Avatar(src: src)],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                height: sizeScreen.height / 5,
                width: sizeScreen.width,
                child: Opacity(
                  opacity: 0.25,
                  child: Image.asset(
                    'assets/banner.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    controller: MyHomePage.controller,
                    padding: const EdgeInsets.only(
                      top: 24,
                      left: 8,
                      right: 8,
                    ),
                    children: const [
                      Profile(),
                      Divider(),
                      AboutMe(),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.only(top: 24, left: 8),
                        child: Text(
                          'GITHUB PROJECTS',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GithubProjects(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Footer(),
        ],
      ),
    );
  }
}
