import 'package:amal/screens/home/help_getter.dart';
import 'package:flutter/material.dart';

class HelpDetailsScreen extends StatelessWidget {
  final HelpGetter helpGetter;

  HelpDetailsScreen({required this.helpGetter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Помощь для ${helpGetter.name}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage('assets/avatar_image.png'), // Replace with actual avatar image
            ),
            SizedBox(height: 20.0),
            Text(
              helpGetter.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Адрес: ${helpGetter.address}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Raised: \$${helpGetter.raised} / Needed: \$${helpGetter.needed}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add your logic here to initiate the help process
                // For example, you can show a dialog or navigate to another screen
                // to provide additional information or confirmation.
              },
              child: Text('Помочь'),
            ),
          ],
        ),
      ),
    );
  }
}
