import 'package:flutter/cupertino.dart';
import '../models/github_user_models/github_user_result.dart';

import '../repositories/github_user_list_repository.dart';

class UserListController {
  ValueNotifier<List<GithubUserResultModel>> users = ValueNotifier([]);
  var repository = GithubUserListRepository();

  Future setup(String sourceRoute) async {
    users.value = await repository.getUsers(sourceRoute);
  }
}
