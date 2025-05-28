import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Bottom_navigation_screen.dart';
import 'package:untitled/welcome_page.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;
  String? finalEmail;
  List<String> favorites = [];

  @override
  void initState() {
    super.initState();
    getValidationData().whenComplete(() {
      print('Splash screen timer started');
      Timer(Duration(seconds: 3), () {
        if (finalEmail == null) {
          _navigateToNextScreen();
        } else {
          Get.to(BottomNavigationScreen());
        }
      });
    });

    setState(() {
      _visible = true;
    });
    loadFavorites();
  }

  void _navigateToNextScreen() {
    print('Navigating to WelcomeScreen');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
    );
  }

  Future<void> getValidationData() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
    print(obtainedEmail);
  }

  Future<void> loadFavorites() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      favorites = sharedPreferences.getStringList('favorites') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(seconds: 1),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/welcome_bg.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              // Transparent black overlay
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Image.asset('assets/images/pic1.png'),
                  ),
                  SizedBox(height: 20,),
                  RichText(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: 'Lush',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.greenAccent.shade400,
                          ),
                        ),
                        TextSpan(
                          text: 'Layers',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.yellow.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
