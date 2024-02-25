// main.dart

import 'package:amal/events/actions_screen.dart';
import 'package:amal/screens/home/home_screen.dart';
import 'package:amal/screens/intro_screen.dart';
import 'package:amal/screens/menu/menu_widget.dart';
import 'package:amal/screens/rewards/rewards_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black,
            secondary: Colors.black,
            background: Colors.white),
      ),
      home: const IntroScreen(), //MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 2;

  final List<Widget> _pages = [
    const Center(child: Text('menu')),
    const Center(child: Text('Page 3')),
    const HelpGettersScreen(),
    const ActionsPage(),
    const Rewards_screenPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Меню',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_rounded),
            label: 'Платежи',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Помощь',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: 'Дело',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Награды',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: (int index) {
          switch (index) {
            case 0:
              _showMenu(context);
              break;
            case 1:
              _onItemTapped(index);
              break;
            case 2:
              _onItemTapped(index);
              break;
            case 3:
              _onItemTapped(index);
              break;
            case 4:
              _onItemTapped(index);
              break;
          }
        },
      ),
    );
  }

  // Function to show the sliding-up menu
  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const MenuWidget();
      },
    );
  }
}
