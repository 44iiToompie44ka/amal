import 'package:flutter/material.dart';
import 'package:amal/main.dart'; // Импортируйте файл main.dart, если он находится в другой директории

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showText = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();

    // Отложенное показ текста через 4 секунды
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showText = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToNextPage() {
    // Переход на страницу MyHomePage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        // Оборачиваем весь контейнер в GestureDetector
        onTap:
            _navigateToNextPage, // Вызываем функцию для перехода на следующую страницу
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/q.jpg', // Путь к вашему фоновому изображению
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Container(
                height: 900,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(186, 226, 32, 194),
                      Color.fromARGB(211, 155, 32, 226),
                      Color.fromARGB(201, 72, 18, 189),
                      Color.fromARGB(226, 27, 86, 126),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 260,
                right: 40,
                child: FadeTransition(
                  opacity: _animation,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/222.png', // Путь к вашему первому изображению
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 430,
                right: 100,
                child: FadeTransition(
                  opacity: _animation,
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/amal.logo.png', // Путь к вашему второму изображению
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              FadeTransition(
                  opacity: _animation,
                  child:               Padding(padding: EdgeInsets.only(left: 85, top: 700), child: Text("Каждый житель важен для нас", style: TextStyle(color: Colors.white, fontSize: 15),),),

                ),
              FadeTransition(
                  opacity: _animation,
                  child:               Padding(padding: EdgeInsets.only(left: 90, top: 800), child: Text("Нажмите, чтобы продолжить", style: TextStyle(color: Colors.white, fontSize: 15),),),

                ),
              
            ],
          ),
        ),
      ),
    );
  }
}
