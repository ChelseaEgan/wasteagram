import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/post_detail_layout.dart';
import 'package:wasteagram/widgets/scroll_view_layout.dart';
import '../services/image_select_service.dart';
import '../widgets/app_scaffold.dart';
import '../models/post.dart';

class PostDetail extends StatelessWidget {
  static const route = 'post-detail';
  final Post post;
  final ImageSelectService imageStorage = ImageSelectService();

  PostDetail({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Post postDetail =
        ModalRoute.of(context).settings.arguments ?? this.post;

    return AppScaffold(
        title: 'Wasteagram',
        child: scrollViewLayout(context, PostDetailLayout(post: postDetail)));
  }
}
