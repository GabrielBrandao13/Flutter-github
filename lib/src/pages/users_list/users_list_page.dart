import 'package:flutter/material.dart';

import '../user_profile/user_profile_args.dart';
import './users_list_args.dart';

import '../../controllers/user_list_controller.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  UsersListState createState() => UsersListState();
}

class UsersListState extends State<UserListPage> {
  var controller = UserListController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as UsersListArgs;
    final sourceRoute = args.sourceRoute;

    controller.setup(sourceRoute);

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: AnimatedBuilder(
          animation: controller.users,
          builder: (context, widget) {
            return ListView.builder(
              itemCount: controller.users.value.length,
              itemBuilder: (BuildContext context, int index) {
                var userInfo = controller.users.value[index];

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
                  subtitle: Text('Id: ${userInfo.id}'),
                  onTap: () {
                    Navigator.of(context).pushNamed('/userProfile',
                        arguments:
                            UserProfileArgs(username: userInfo.username));
                  },
                );
              },
            );
          }),
    );
  }
}
