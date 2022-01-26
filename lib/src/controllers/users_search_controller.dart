import 'package:flutter/cupertino.dart';

import '../repositories/github_user_repository.dart';
import '../models/github_user_models/github_user_search_result_model.dart';

class UsersSearchController {
  final repository = GithubUserRepository();

  ValueNotifier<List<GithubUserSearchResultModel>> searchResults =
      ValueNotifier([]);

  Future start(String searchText) async {
    searchResults.value = await repository.searchUsers(searchText);
  }
}
