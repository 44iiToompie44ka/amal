import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Оповещения'),
        centerTitle: false,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: const [
          NotificationItem(
            title: 'Успешный перевод!',
            message: 'Вы помогли Клара Петровна, переведя 12000〒. Спасибо!',
            imagePath: 'assets/бабуся1.jpg',
          ),
          NotificationItem(
            title: 'Успешный перевод!',
            message: 'Вы помогли Михаил Кириченко, переведя 6000〒. Спасибо!',
            imagePath: 'assets/ded.jpg', // Replace with your image path
          ),
          NotificationItem(
            title: 'Цель выполнена!',
            message: 'Вы помогли Зинаида Фёдоровна, переведя 6000〒, закрыв потребность нуждающегося в Продуктовая Корзина. Спасибо!',
            imagePath: 'assets/babi.jpeg', // Replace with your image path
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String message;
  final String imagePath;

  const NotificationItem({
    Key? key,
    required this.title,
    required this.message,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
        ),
        title: Text(title),
        subtitle: Text(message),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NotificationsPage(),
  ));
}
