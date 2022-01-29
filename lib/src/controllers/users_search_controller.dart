import 'package:flutter/cupertino.dart';

import '../repositories/github_user_repository.dart';
import '../models/github_user_models/github_user_result.dart';

class UsersSearchController {
  final repository = GithubUserRepository();

  ValueNotifier<List<GithubUserResultModel>> searchResults = ValueNotifier([]);

  Future start(String searchText) async {
    searchResults.value = await repository.searchUsers(searchText);
  }
}
