import 'package:amal/screens/user/unknown_user_banner.dart';
import 'package:flutter/material.dart';

class Rewards_screenPage extends StatelessWidget {
  const Rewards_screenPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = [
      'assets/images/4.jpg',
      'assets/images/1.jpg',
      'assets/images/3.jpg',
      'assets/images/2.png',
      'assets/images/5.jpg',
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(197, 255, 255, 255),
      appBar: AppBar(
        toolbarHeight: 180,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    bottom: 10,
                    top: 10,
                  ),
                  child: Text(
                    'Награды',
                    style: TextStyle(
                      color: Color.fromARGB(192, 0, 0, 0),
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                RegistrationCard(), // Вставляем виджет регистрации
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
                bottom: 10,
                top: 25,
              ),
              child: Text(
                'Топ 10 наград',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 200, // Высота контейнера для списка изображений
              child: Padding(
                padding: const EdgeInsets.only(left: 15), // Отступ слева
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // Горизонтальная прокрутка
                  itemCount: 5, // Количество элементов в списке
                  itemBuilder: (context, index) {
                    // Создаем элемент списка с изображением и закругленными углами
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          imagePaths[index], // Выбор изображения из списка
                          width: 150,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
