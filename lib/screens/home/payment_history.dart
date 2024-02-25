import 'package:flutter/material.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('История помощи'),
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
          PaymentItem(
            imageUrl: 'https://via.placeholder.com/150', // URL изображения
            helpTitle: 'Название помощи',
            recipientName: 'Имя Получателя',
            amount: 5000, // Сумма денег
            currency: 'KZT', // Валюта
            pointsEarned: 100, // Количество начисленных баллов
          ),
          // Добавьте другие элементы истории платежей здесь
        ],
      ),
    );
  }
}

class PaymentItem extends StatelessWidget {
  final String imageUrl;
  final String helpTitle;
  final String recipientName;
  final int amount;
  final String currency;
  final int pointsEarned; // Новое поле для количества начисленных баллов

  const PaymentItem({
    Key? key,
    required this.imageUrl,
    required this.helpTitle,
    required this.recipientName,
    required this.amount,
    required this.currency,
    required this.pointsEarned, // Добавлено новое поле для количества начисленных баллов
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              helpTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Получатель: $recipientName',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Сумма: $amount $currency',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Начислено: $pointsEarned баллов',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
