import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shop_management/view/widgets/drop_downs.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: context.screenHeight / 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SimpleDropdown(
              hintText: "Select a job",
              list: _list,
              onChanged: (v) {},
            ),
          )
        ],
      ),
    );
  }
}

const List<String> _list = [
  'Developer',
  'Designer',
  'Consultant',
  'Student',
];
