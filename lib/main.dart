import 'package:flutter/material.dart';
import './src/pages/home_page.dart';
import './src/pages/users_search/users_search_page.dart';
import './src/pages/user_profile/user_profile_page.dart';
import './src/pages/users_list/users_list_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App github',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        '/': (BuildContext context) => const HomePage(),
        '/search': (BuildContext context) => const UsersSearchPage(),
        '/userProfile': (BuildContext context) => const UserProfilePage(),
        '/usersList': (BuildContext context) => const UserListPage(),
      },
    );
  }
}
