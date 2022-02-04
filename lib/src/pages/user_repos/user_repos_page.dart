import 'package:flutter/material.dart';

import './user_repos_args.dart';

import '../../controllers/user_repos_controller.dart';

import '../../components/load_screen.dart';

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
          if (controller.repos.value.isEmpty) {
            return const LoadScreen();
          }
          return ListView.builder(
            itemCount: controller.repos.value.length,
            itemBuilder: (context, index) {
              var repo = controller.repos.value[index];
              return ListTile(
                title: Text(repo.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(repo.description),
                    Row(
                      children: repo.topics
                          .map((topic) => Text('#$topic ',
                              style: const TextStyle(color: Colors.blue)))
                          .toList(),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
