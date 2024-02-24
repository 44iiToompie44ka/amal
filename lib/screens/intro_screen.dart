import 'package:amal/events/actions_screen.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/фон2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/logo.png', // Путь к вашему логотипу
              width: 300, // Ширина логотипа
              height: 300, // Высота логотипа
            ),
          ),
          // Текст внизу
          const Positioned(
            bottom: 5,
            left: 50,
            right: 50,
            child: Text(
              "Мобильное приложение адресной и прозрачной помощи",
              style: TextStyle(
                color: Color.fromARGB(192, 255, 255, 255),
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Positioned(
            top: 60.0,
            left: 20.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Код для изображения app_icon удален
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to \nAmal',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Помощь нуждающимся',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 10.0,
            right: 10.0,
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    // Обработка нажатия на кнопку РУС
                  },
                  child: Text(
                    'РУС',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    // Обработка нажатия на кнопку КАЗ
                  },
                  child: Text(
                    'КАЗ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    // Обработка нажатия на кнопку ENG
                  },
                  child: Text(
                    'ENG',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50.0,
            left: 20.0,
            right: 20.0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ActionsPage()),
                );
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
                child: Center(
                  child: Text(
                    'ПРОДОЛЖИТЬ',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
