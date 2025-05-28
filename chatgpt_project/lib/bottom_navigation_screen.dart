import 'package:chatgpt_project/appbar.dart';
import 'package:chatgpt_project/bot_screen.dart';
import 'package:chatgpt_project/chat_screen.dart';
import 'package:chatgpt_project/history_screen.dart';
import 'package:chatgpt_project/tasksforAI_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    ChatScreen(),
    TasksScreen(),
    BotScreen(),
    HistoryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print('Selected Index: $_selectedIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
          height: 80.0,
          color: Color.fromRGBO(36, 46, 73, 1),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.message),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.tasks),
                label: 'Tasks for AI',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.robot),
                label: 'Bots',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.history),
                label: 'History',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white, // Selected item color
            unselectedItemColor: Color(0xFF989EB1), // Unselected item color
            onTap: _onItemTapped,
            backgroundColor:Color(0xFF242E49),
            selectedIconTheme: IconThemeData(
              size: 30,
            ),
            unselectedIconTheme: IconThemeData(
              size: 25,
            ),
          ),
        ),
    );
  }
}
