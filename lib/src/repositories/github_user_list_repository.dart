import 'package:dio/dio.dart';

import '../models/github_user_models/github_user_result.dart';

class GithubUserListRepository {
  final baseUrl = 'https://api.github.com';

  final Dio client = Dio();

  Future<List<GithubUserResultModel>> getUsers(String sourceRoute) async {
    var url = '$baseUrl/$sourceRoute';
    var data = await client.get(url);
    var parsedData = data.data as List;

    var users =
        parsedData.map((json) => GithubUserResultModel.fromJson(json)).toList();

    return users;
  }
}
