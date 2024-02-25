import 'package:amal/screens/menu/business_partners.dart';
import 'package:amal/screens/user/unknown_user_banner.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Your menu content goes here
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: RegistrationCard(),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(5, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue, width: 2),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/image_$index.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.lightBlue[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Текст ${index + 1}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.attach_money), // Icon added here
              title: const Text('Резервный фонд'),
              onTap: () {
                // Handle item 1 click
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_answer), // Icon added here
              title: const Text('Ответы на вопросы'),
              onTap: () {
                // Handle item 2 click
              },
            ),
            ListTile(
              leading: Icon(Icons.people), // Иконка "людей"
              title: Text('Партнеры'),
              onTap: () {
                // Обработка нажатия на "Партнеры"
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PartnersPage()), // Здесь PartnersPage - это страница с партнерами
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail), // Icon added here
              title: const Text('Контакты'),
              onTap: () {
                // Handle item 5 click
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle click
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Устанавливаем более квадратные углы
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  child: const Center(
                    child: Text(
                      'Помочь проекту',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
