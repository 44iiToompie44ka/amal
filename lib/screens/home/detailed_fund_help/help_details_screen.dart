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
            const CircleAvatar(
              radius: 60.0,
              backgroundImage: const AssetImage('assets/avatar_image.png'), // Replace with actual avatar image
            ),
            const SizedBox(height: 20.0),
            Text(
              helpGetter.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Адрес: ${helpGetter.address}',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Raised: \$${helpGetter.raised} / Needed: \$${helpGetter.needed}',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add your logic here to initiate the help process
                // For example, you can show a dialog or navigate to another screen
                // to provide additional information or confirmation.
              },
              child: const Text('Помочь'),
            ),
          ],
        ),
      ),
    );
  }
}
