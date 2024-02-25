import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App Name'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // App Logo
            Image.network('your_app_logo_url'),

            SizedBox(height: 20.0),

            // Phone Number Input
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                prefixText: '+',
              ),
            ),

            SizedBox(height: 20.0),

            // Login Button
            ElevatedButton(
              onPressed: () {
                // Add login functionality here
              },
              child: Text('Login'),
            ),

            SizedBox(height: 20.0),

            // Register Button
            TextButton(
              onPressed: () {
                // Add navigation to registration screen
              },
              child: Text('Don\'t have an account? Register'),
            ),

            SizedBox(height: 20.0),

            // Terms and Privacy Policy
            Text(
              'By logging in, you agree to our Terms of Service and Privacy Policy.',
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20.0),

            // Kazakh Text about data collection and terms
            Text(
              'Kazakh Text about data collection and terms',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
