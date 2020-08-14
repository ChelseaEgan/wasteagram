import 'package:flutter/material.dart';
import 'package:wasteagram/firebase/data_storage.dart';
import 'package:wasteagram/models/post.dart';
import 'package:wasteagram/models/posts.dart';
import 'package:wasteagram/screens/post_detail.dart';
import 'app_scaffold.dart';

class PostsListStreamBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getListOfPosts(context);
  }

  StreamBuilder getListOfPosts(BuildContext context) => StreamBuilder(
      stream: DataStorage.getPostSnapshots(),
      builder: (content, snapshot) {
        if (snapshot.hasData &&
            snapshot.data.documents != null &&
            snapshot.data.documents.length > 0) {
          Posts posts = new Posts.fromSnapshot(snapshot.data.documents);
          return AppScaffold(
            title: 'Wasteagram - ${posts.totalWaste}',
            child: listView(context, posts, snapshot),
            hasFAB: true,
            hasBackButton: false,
          );
        } else {
          return AppScaffold(
            title: 'Wasteagram',
            child: Center(child: CircularProgressIndicator()),
            hasFAB: true,
            hasBackButton: false,
          );
        }
      });

  Widget listView(
      BuildContext context, Posts posts, AsyncSnapshot<dynamic> snapshot) {
    List<Post> postsList = posts.posts;
    return ListView.builder(
      itemCount: posts.numberOfPosts,
      itemBuilder: (context, index) {
        Post post = postsList[index];
        return semanticsListTile(context, post);
      },
    );
  }

  Widget semanticsListTile(BuildContext context, Post post) => Semantics(
        button: true,
        enabled: true,
        label: 'Posts list item',
        onTapHint: 'View post',
        child: ListTile(
            title: Text(post.formattedDate),
            trailing: Text(post.quantity.toString()),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PostDetail(),
                settings: RouteSettings(arguments: post)))),
      );
}
