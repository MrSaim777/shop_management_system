import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawerButton extends StatelessWidget {
  const AppDrawerButton({Key? key, required this.zoomDrawerController})
      : super(key: key);
  final ZoomDrawerController zoomDrawerController;

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: toggleDrawer,
      icon: const FaIcon(FontAwesomeIcons.bars),
    );
  }
}
