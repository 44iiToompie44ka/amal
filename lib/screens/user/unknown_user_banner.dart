import 'package:amal/screens/user/registration/user_registration.dart';
import 'package:flutter/material.dart';

class RegistrationCard extends StatelessWidget {
  const RegistrationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),

      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 0),
            child: CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage('assets/avatar_placeholder.png'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            padding: const EdgeInsets.only(left: 50, top: 0),
            child: Container(
              width: 85,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor:
                      Theme.of(context).colorScheme.primary, // Убираем внутренний отступ
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
      ),
    );
  }
}
