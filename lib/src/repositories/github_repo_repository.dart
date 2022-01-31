import 'package:dio/dio.dart';

import '../models/github_repo_model.dart';

class GithubRepoRepository {
  final client = Dio();
  final baseUrl = 'https://api.github.com/users';
  Future<List<GithubRepoModel>> getUserRepos(String username) async {
    var url = '$baseUrl/$username/repos';

    var json = await client.get(url);
    var parsedJson = json.data as List;

    var userRepos =
        parsedJson.map((json) => GithubRepoModel.fromJson(json)).toList();

    return userRepos;
  }
}
