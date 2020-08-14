import 'package:flutter/material.dart';
import 'screens/post_create.dart';
import 'screens/post_detail.dart';
import 'screens/posts_list.dart';

class App extends StatelessWidget {
  final String title;

  const App({Key key, this.title}) : super(key: key);

  static final routes = {
    PostsList.route: (context) => new PostsList(),
    PostCreate.route: (context) => new PostCreate(),
    PostDetail.route: (context) => new PostDetail(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData.dark(),
      routes: App.routes,
    );
  }
}
