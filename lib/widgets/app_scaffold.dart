import 'package:flutter/material.dart';
import '../screens/post_create.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final bool hasFAB;
  final Widget child;
  final bool hasBackButton;

  const AppScaffold(
      {Key key,
      this.title,
      this.child,
      this.hasFAB = false,
      this.hasBackButton = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        automaticallyImplyLeading: hasBackButton,
      ),
      body: child,
      floatingActionButton: hasFAB ? addPostFAB(context) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget addPostFAB(BuildContext context) => Semantics(
        child: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed(PostCreate.route),
          tooltip: 'Add post',
          child: const Icon(Icons.add),
        ),
        button: true,
        enabled: true,
        label: 'Get photo button',
        onTapHint: 'Add a post',
      );
}
