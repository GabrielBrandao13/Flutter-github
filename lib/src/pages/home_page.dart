import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';
import './users_search/users_search_args.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final TextEditingController searchTextController = TextEditingController();
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController(searchController: searchTextController);
  }

  void search() {
    Navigator.of(context).pushNamed('/search',
        arguments: UsersSearchArgs(search: searchTextController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App github'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: controller.searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome de usuário Github',
              ),
              onSubmitted: (String text) => search(),
            ),
            Container(height: 15),
            ElevatedButton.icon(
              onPressed: search,
              icon: Icon(Icons.search),
              label: Text('Pesquisar'),
            ),
          ],
        ),
      ),
    );
  }
}
