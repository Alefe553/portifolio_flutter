import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../models/repositories.model.dart';

class RepositorieController {
  static Future<List<RepositoriesModel>> getElement() async {
    String uri = 'https://api.github.com/users/Alefe553/repos';
    Uri httpReq = Uri.parse(uri);

    Response response = await http.get(httpReq);

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);

      List<RepositoriesModel> result = body
          .map(
            (dynamic json) => RepositoriesModel.fromJson(json),
          )
          .toList();

      return result;
    } else {
      List<RepositoriesModel> result = [];

      return result;
    }
  }
}
