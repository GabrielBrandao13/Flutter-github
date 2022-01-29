import 'package:flutter/cupertino.dart';

import '../repositories/github_following_repository.dart';
import '../models/github_user_models/github_user_result.dart';

class UserFollowingController {
  final repository = GithubFollowingRepository();

  ValueNotifier<List<GithubUserResultModel>> followers = ValueNotifier([]);

  Future start(String username) async {
    followers.value = await repository.getFollowing(username);
  }
}
