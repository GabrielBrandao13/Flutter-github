import 'package:flutter/material.dart';

import './users_search_args.dart';
import '../../controllers/users_search_controller.dart';

class UsersSearchPage extends StatefulWidget {
  const UsersSearchPage({Key? key}) : super(key: key);

  @override
  UsersSearchPageState createState() => UsersSearchPageState();
}

class UsersSearchPageState extends State<UsersSearchPage> {
  late UsersSearchArgs args;
  late String searchText;

  final controller = UsersSearchController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as UsersSearchArgs;
    searchText = args.search ?? '';

    controller.start(searchText);

    return Scaffold(
      appBar: AppBar(
        title: Text(searchText),
      ),
      body: AnimatedBuilder(
        animation: controller.searchResults,
        builder: (BuildContext context, Widget? child) {
          return ListView.builder(
            itemCount: controller.searchResults.value.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(controller.searchResults.value[index].username),
                subtitle:
                    Text('Id: ${controller.searchResults.value[index].id}'),
              );
            },
          );
        },
      ),
    );
  }
}
