import 'dart:async';
import 'package:untitled/welcome_page.dart';
import 'package:flutter/material.dart';

class SignoutLoadingScreen extends StatefulWidget {
  @override
  _SignoutLoadingScreenState createState() => _SignoutLoadingScreenState();
}

class _SignoutLoadingScreenState extends State<SignoutLoadingScreen> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _startSplashScreenTimer();
  }

  _startSplashScreenTimer() async {
    var duration = Duration(seconds: 0);
    Timer(duration, _showContent);
    Timer(Duration(seconds: 2), _navigateToNextScreen);
  }

  _showContent() {
    setState(() {
      _visible = true;
    });
  }

  _navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade800,
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(seconds: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 70,
                width: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/pic1.png'),
                      fit: BoxFit.contain,
                    )
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'Signing Out',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 38,color: Colors.white),
              ),
              SizedBox(height: 20,),
              Text(
                'Dredging pipes...',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22,color: Colors.yellow.shade700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
