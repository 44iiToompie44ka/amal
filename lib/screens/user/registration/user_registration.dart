import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вход'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/logo.png"),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 80), child: Text("Пожалуйста, войдите в аккаунт, по номеру телефона", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),),),

            const TextField(
              decoration: InputDecoration(
                labelText: 'Введите номер телефона',
                prefixText: '+',
              ),
            ),

            const SizedBox(height: 20.0),

            ElevatedButton(
              style: ButtonStyle(    backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
),
              onPressed: () {
              },
              child: const Text('Вход', style: TextStyle(color: Colors.white),),
            ),

            const SizedBox(height: 20.0),

            const SizedBox(height: 20.0),

            const Text(
              'Нажимая на кнопку выше, вы соглашаетесь с Условиями пользования ',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
