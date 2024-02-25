
import 'package:amal/screens/home/home_screen.dart';
import 'package:amal/screens/login/registration/help_getter_registration.dart';
import 'package:amal/screens/menu/menu_widget.dart';
import 'package:amal/screens/rewards/rewards_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black, secondary: Colors.black, background: Colors.white),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  NavigationBarScreen createState() => NavigationBarScreen();
}

class NavigationBarScreen extends State<MyHomePage> {
  int _selectedIndex = 2;

  final List<Widget> _pages = [
    const MenuWidget(),
    const Center(child: Text('Page 3')),
    HelpGettersScreen(),
    HelpGetterRegistration(),
    RewardsScreen(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
        switch(index) {
          case 0:
          Future.delayed(Duration(milliseconds: 100)).then((value) => _showMenu(context))
        ;
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
