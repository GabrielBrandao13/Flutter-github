import 'package:dio/dio.dart';

import '../models/github_user_models/github_user_result.dart';

class GithubFollowingRepository {
  final baseUrl = 'https://api.github.com/users';

  final Dio client = Dio();

  Future<List<GithubUserResultModel>> getFollowing(String username) async {
    var url = '$baseUrl/$username/following';
    var data = await client.get(url);
    var parsedData = data.data as List;

    var following =
        parsedData.map((json) => GithubUserResultModel.fromJson(json)).toList();

    return following;
  }
}
