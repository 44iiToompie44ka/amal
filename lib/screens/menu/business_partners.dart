import 'package:flutter/material.dart';

class PartnersPage extends StatelessWidget {
  const PartnersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Наши партнеры'),
      ),
      body: ListView(
        children: [
          PartnerCard(
            imageUrl: 'https://via.placeholder.com/100',
            name: 'PartyFood',
            description: 'Описание партнера PartyFood',
            contactInfo: 'Номер: +123456789\nEmail: info@partyfood.com',
          ),
          PartnerCard(
            imageUrl: 'https://via.placeholder.com/150',
            name: 'Magnum',
            description: 'Описание партнера Magnum',
            contactInfo: 'Номер: +987654321\nEmail: info@magnum.com',
          ),
          PartnerCard(
            imageUrl: 'https://via.placeholder.com/150',
            name: 'JetisuDigital',
            description: 'Описание партнера JetisuDigital',
            contactInfo: 'Номер: +999999999\nEmail: info@jetisudigital.com',
          ),
          // Добавьте другие партнеры здесь
        ],
      ),
    );
  }
}

class PartnerCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final String contactInfo;

  const PartnerCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.contactInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
          radius: 30, // Радиус изображения
        ),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            const SizedBox(
                height:
                    5), // Промежуток между описанием и контактной информацией
            Text(
              contactInfo,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        onTap: () {
          // Действие при нажатии на партнера
        },
      ),
    );
  }
}