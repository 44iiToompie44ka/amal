// menu_widget.dart

import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Your menu content goes here
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Handle item 1 click
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Handle item 2 click
            },
          ),
          // Add more menu items as needed
        ],
      ),
    );
  }
}
