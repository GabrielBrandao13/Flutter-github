import 'package:flutter/cupertino.dart';

import '../repositories/github_user_repository.dart';
import '../models/github_user_models/github_user_model.dart';

class UserProfileController {
  final repository = GithubUserRepository();
  ValueNotifier<GithubUserModel> userInfo =
      ValueNotifier(GithubUserModel(username: '', avatarUrl: '', id: 0));

  Future start(String username) async {
    var data = await repository.getUserByName(username);
    userInfo.value = data;
  }
}
