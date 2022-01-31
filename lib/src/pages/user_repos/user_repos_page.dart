import 'package:flutter/material.dart';

import './user_repos_args.dart';

import '../../controllers/user_repos_controller.dart';

class UserReposPage extends StatefulWidget {
  const UserReposPage({Key? key}) : super(key: key);
  @override
  _UserReposPageState createState() => _UserReposPageState();
}

class _UserReposPageState extends State<UserReposPage> {
  final controller = UserReposController();

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as UserReposArgs;
    var username = args.username;

    controller.setup(username);

    return Scaffold(
      appBar: AppBar(
        title: Text('Repositórios de $username'),
      ),
      body: AnimatedBuilder(
        animation: controller.repos,
        builder: (context, child) {
          return ListView.builder(
            itemCount: controller.repos.value.length,
            itemBuilder: (context, index) {
              var repo = controller.repos.value[index];
              return ListTile(
                title: Text(repo.name),
                subtitle: Text(repo.description),
              );
            },
          );
        },
      ),
    );
  }
}
