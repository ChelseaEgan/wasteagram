import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/posts_list_streambuilder.dart';

class PostsList extends StatelessWidget {
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return PostsListStreamBuilder();
  }
}
