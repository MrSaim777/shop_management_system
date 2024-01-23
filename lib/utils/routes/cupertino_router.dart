import 'package:flutter/cupertino.dart';

cupertinoRouter(BuildContext context, Widget screen) {
  Navigator.push(context, CupertinoPageRoute(builder: (context) => screen));
}

cupertinoRouterRemoveunti(BuildContext context, Widget screen) {
  Navigator.pushAndRemoveUntil(context,
      CupertinoPageRoute(builder: (context) => screen), (route) => false);
}
