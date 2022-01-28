import 'package:dio/dio.dart';

import '../models/github_user_models/github_follower_model.dart';

class GithubFollowersRepository {
  final baseUrl = 'https://api.github.com/users';

  final Dio client = Dio();

  Future<List<GithubFollowerModel>> getFollowers(String username) async {
    var url = '$baseUrl/$username/followers';
    var data = await client.get(url);
    var parsedData = data.data as List;

    var followers =
        parsedData.map((json) => GithubFollowerModel.fromJson(json)).toList();

    return followers;
  }
}
