import 'package:dio/dio.dart';

import '../models/github_user_models/github_user_result.dart';

class GithubFollowersRepository {
  final baseUrl = 'https://api.github.com/users';

  final Dio client = Dio();

  Future<List<GithubUserResultModel>> getFollowers(String username) async {
    var url = '$baseUrl/$username/followers';
    var data = await client.get(url);
    var parsedData = data.data as List;

    var followers =
        parsedData.map((json) => GithubUserResultModel.fromJson(json)).toList();

    return followers;
  }
}
