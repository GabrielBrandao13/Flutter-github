import 'package:flutter/material.dart';
import 'package:projeto_github/src/controllers/user_following_controller.dart';

import '../user_profile/user_profile_args.dart';

import './user_following_args.dart';

class UserFollowingPage extends StatefulWidget {
  const UserFollowingPage({Key? key}) : super(key: key);

  @override
  UserFollowersState createState() => UserFollowersState();
}

class UserFollowersState extends State<UserFollowingPage> {
  final controller = UserFollowingController();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as UserFollowingArgs;
    final username = args.username;

    controller.start(username);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seguindo'),
      ),
      body: AnimatedBuilder(
        animation: controller.followers,
        builder: (BuildContext context, Widget? child) {
          return ListView.builder(
            itemCount: controller.followers.value.length,
            itemBuilder: (BuildContext context, int index) {
              var userInfo = controller.followers.value[index];

              return ListTile(
                title: Column(
                  children: [
                    Image.network(
                      userInfo.avatarUrl,
                      fit: BoxFit.cover,
                    ),
                    Text(userInfo.username),
                  ],
                ),
                subtitle: Text('Id: ${controller.followers.value[index].id}'),
                onTap: () {
                  Navigator.of(context).pushNamed('/userProfile',
                      arguments: UserProfileArgs(username: userInfo.username));
                },
              );
            },
          );
        },
      ),
    );
  }
}
