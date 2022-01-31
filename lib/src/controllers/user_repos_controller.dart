import 'package:flutter/cupertino.dart';

import '../models/github_repo_model.dart';
import '../repositories/github_repo_repository.dart';

class UserReposController {
  ValueNotifier<List<GithubRepoModel>> repos = ValueNotifier([]);
  final repository = GithubRepoRepository();

  Future setup(String username) async {
    repos.value = await repository.getUserRepos(username);
  }
}
