import 'package:dio/dio.dart';
import 'package:projeto_github/src/models/github_user_models/github_user_model.dart';
import 'package:projeto_github/src/models/github_user_models/github_user_result.dart';

class GithubUserRepository {
  final client = Dio();
  final String baseSearchUrl = 'https://api.github.com/search/users';
  final String baseUserUrl = 'https://api.github.com/users';

  Future<List<GithubUserResultModel>> searchUsers(String search) async {
    var json = await client.get('$baseSearchUrl?q=$search');
    var list = json.data['items'] as List;

    var parsedResults =
        list.map((result) => GithubUserResultModel.fromJson(result)).toList();

    return parsedResults;
  }

  Future<GithubUserModel> getUserByName(String username) async {
    var json = await client.get('$baseUserUrl/$username');
    var user = GithubUserModel.fromJson(json.data);
    return user;
  }
}
