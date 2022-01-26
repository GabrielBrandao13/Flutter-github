import 'package:flutter/material.dart';
import './user_profile_args.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  UserProfilePageState createState() => UserProfilePageState();
}

class UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as UserProfileArgs;
    var username = args.username;

    return Scaffold(
      appBar: AppBar(
        title: Text('Informações de $username'),
      ),
    );
  }
}
