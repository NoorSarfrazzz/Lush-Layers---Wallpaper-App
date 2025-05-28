import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/signup_screen.dart';
import 'package:flutter/material.dart';

import 'Bottom_navigation_screen.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isAuthenticated = false;
  String? finalEmail;
  List<String> favorites = [];

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    getValidationData();
    loadFavorites();
  }

  Future<void> checkLoginStatus() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    setState(() {
      isAuthenticated = sharedPreferences.getBool('isAuthenticated') ?? false;
    });
  }

  Future<void> loadFavorites() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    setState(() {
      favorites = sharedPreferences.getStringList('favorites') ?? [];
    });
  }

  Future<void> getValidationData() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                'assets/images/welcome_bg.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // Transparent black overlay
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.8),
              ),
            ),
            // Centered text
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 150,),
                  Container(
                    child: Image.asset(
                      'assets/images/pic1.png',
                      fit: BoxFit.contain,
                      height: 60, // Increased height for the image
                    ),
                  ),
                  SizedBox(height: 30,),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: 'Welcome to ',
                        ),
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
                  Text('Your new favorite wallpaper app.', style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white60,
                    fontSize: 16,),),
                  SizedBox(height: 230,),
                  Text('Terms of use and Privacy Policy', style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.yellow.shade600,
                    fontSize: 15,),),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                    child: Text(
                      'By continuing to use the LushLayer app, you represent that you have read and accept both the Terms of Use and Privacy Policy.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w500,
                        color: Colors.white60,
                        fontSize: 13,),),),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: 250,
                    height: 60,
                    child: ElevatedButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            BottomNavigationScreen()),
                      );
                    },
                      child: Text('Accept and Continue', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 20,),),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.yellow.shade600),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              )
                          )
                      ),
                    ),),
                  SizedBox(height: 10,),
                if (!isAuthenticated) ...[
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 17, vertical: 10),
                        child: Row(
                          children: [
                            TextButton(onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    LoginScreen()),
                              );
                            }, child: Text('LOGIN', style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              decorationThickness: 2.0,),)),
                            Spacer(),
                            TextButton(onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    SignupScreen()),
                              );
                            }, child: Text('New User?', style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              decorationThickness: 2.0,),)),
                          ],
                        )),
                  SizedBox(height: 25),
                ] else ...[
                  SizedBox(height: 90),
                ],
                ],
              ),
            ),
          ],
        ),),
    );
  }
}
