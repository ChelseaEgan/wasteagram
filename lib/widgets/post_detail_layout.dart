import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:wasteagram/models/post.dart';

class PostDetailLayout extends StatelessWidget {
  final Post post;

  const PostDetailLayout({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return displayPost(context);
  }

  Widget displayPost(BuildContext context) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          textSemantics('Date that waste occurred', post.formattedDate,
              Theme.of(context).textTheme.headline3),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(child: CircularProgressIndicator()),
              postPhoto(post),
            ],
          ),
          textSemantics('Amount of wasted food', post.quantity.toString(),
              Theme.of(context).textTheme.headline3),
          textSemantics('Location of post',
              post.latitude.toString() + ',' + post.longitude.toString())
        ],
      ));

  Widget postPhoto(Post post) => Center(
        child: Semantics(
          image: true,
          label: 'Wasted food',
          child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage, image: post.imageURL),
        ),
      );

  Widget textSemantics(String label, String text, [TextStyle style]) =>
      Semantics(label: label, child: Text(text, style: style));
}
