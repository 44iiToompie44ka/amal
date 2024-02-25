import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Контакты'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContactCard(
              email: 'info@example.com',
            ),
            const SizedBox(height: 20),
            ContactCard(
              email: 'support@example.com',
            ),
          ],
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String email;

  const ContactCard({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(20),
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.email,
            color: Colors.white,
          ),
        ),
        title: Text(
          email,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.copy),
          onPressed: () {
            // Действие при нажатии на кнопку копирования
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Email скопирован: $email'),
              ),
            );
          },
        ),
        onTap: () {
          // Действие при нажатии на адрес электронной почты
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Написать письмо по адресу: $email'),
            ),
          );
        },
      ),
    );
  }
}
