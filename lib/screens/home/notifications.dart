import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
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
        children: [
          NotificationItem(
            title: 'Спасибо за вашу помощь!',
            message: 'Ваша поддержка действительно важна для нас.',
          ),
          NotificationItem(
            title: 'Большое спасибо!',
            message: 'Мы очень благодарны за ваше доброе сердце и помощь.',
          ),
          NotificationItem(
            title: 'Спасибо за ваше внимание!',
            message: 'Ваше участие означает много для нас.',
          ),
          NotificationItem(
            title: 'Благодарим за вашу поддержку!',
            message: 'Ваше доброе дело не останется незамеченным.',
          ),
          NotificationItem(
            title: 'Благодарим за ваше время!',
            message: 'Ваше время, уделенное нам, очень важно.',
          ),
          NotificationItem(
            title: 'Мы ценим вашу помощь!',
            message: 'Спасибо за ваше доброе сердце и щедрость.',
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String message;

  const NotificationItem({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(title),
        subtitle: Text(message),
      ),
    );
  }
}
