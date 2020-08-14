import 'package:flutter/cupertino.dart';

Widget scrollViewLayout(BuildContext context, Widget child,
        [dynamic childArgs]) =>
    LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: child));
    });
