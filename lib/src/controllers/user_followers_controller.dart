import 'package:flutter/cupertino.dart';

import '../repositories/github_followers_repository.dart';
import '../models/github_user_models/github_follower_model.dart';

class UserFollowersController {
  final repository = GithubFollowersRepository();

  ValueNotifier<List<GithubFollowerModel>> followers = ValueNotifier([]);

  Future start(String username) async {
    followers.value = await repository.getFollowers(username);
  }
}
