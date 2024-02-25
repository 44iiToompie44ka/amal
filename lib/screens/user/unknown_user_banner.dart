import 'package:flutter/material.dart';

class RegistrationCard extends StatelessWidget {
  const RegistrationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 0, top: 20),
          child: CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage('assets/images/circle_image.png'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Гость',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Авторизуйся',
                style: TextStyle(
                    color: Color.fromARGB(219, 0, 0, 0),
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 90, top: 20),
          child: Container(
            width: 85,
            height: 45,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.black, // Убираем внутренний отступ
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(15), // Применяем радиус для обводки
                ), // Цвет фона кнопки
              ),
              child: const Center(
                child: Text(
                  'Войти',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
