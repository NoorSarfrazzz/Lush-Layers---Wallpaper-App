import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:untitled/community_screen.dart';
import 'explore_page.dart';
import 'signout_screen.dart'; // Adjust the import path as necessary
import 'Favourites_screen.dart'; // If this is used somewhere else
import 'firebase_options.dart';
import 'Bottom_navigation_screen.dart';
import 'firebase_auth_implementation/auth_services.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  List<CameraDescription>? cameras;
  cameras = await availableCameras();
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: AndroidProvider.playIntegrity,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => FavoriteProvider()), // Register FavoriteProvider here
      ],
      child: GetMaterialApp( // Use GetMaterialApp for GetX navigation
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: [ // Define routes for GetX
          GetPage(name: '/', page: () => WelcomeScreen()),
          GetPage(name: '/signup', page: () => SignupScreen()),
          GetPage(name: '/bottom_nav', page: () => BottomNavigationScreen()),
          GetPage(name: '/logout', page: () => SignoutLoadingScreen()),
          GetPage(name: '/explore', page: () => ExplorePage()),
          GetPage(name: '/community', page: () => CommunityScreen()),
        ],
      ),
    );
  }
}
