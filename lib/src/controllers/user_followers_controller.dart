import 'package:flutter/cupertino.dart';

import '../repositories/github_followers_repository.dart';
import '../models/github_user_models/github_user_result.dart';

class UserFollowersController {
  final repository = GithubFollowersRepository();

  ValueNotifier<List<GithubUserResultModel>> followers = ValueNotifier([]);

  Future start(String username) async {
    followers.value = await repository.getFollowers(username);
  }
}
