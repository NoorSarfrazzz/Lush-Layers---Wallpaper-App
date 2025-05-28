import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  String? _error;
  bool isAuthenticated1 = false;
  List<String> favoriteUrls = [];
  List<String> favoriteNames = [];

  AuthService() {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  User? get user => _user;
  bool get isAuthenticated => _user != null;
  String? get error => _error;

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _error = null; // Clear previous error if login succeeds
    } catch (e) {
      _error = e.toString(); // Store error message
      print('Login error: $_error');
    }
    notifyListeners();
  }

  Future<void> logout(BuildContext context) async {
    try {
      await _auth.signOut();
      _user = null;
      _error = null;
      Navigator.pushReplacementNamed(context, '/logout'); // Navigate to the SignoutLoadingScreen
    } catch (e) {
      _error = e.toString(); // Store error message
      print('Logout error: $_error');
    }
    notifyListeners();
  }

  void _onAuthStateChanged(User? user) {
    _user = user;
    notifyListeners();
  }

  void addFavorite(String url, String name) {
    if (!favoriteUrls.contains(url)) {
      favoriteUrls.add(url);
      favoriteNames.add(name);
      notifyListeners();
    }
  }

  void removeFavorite(String url) {
    int index = favoriteUrls.indexOf(url);
    if (index != -1) {
      favoriteUrls.removeAt(index);
      favoriteNames.removeAt(index);
      notifyListeners();
    }
  }

  bool isFavorite(String url) {
    return favoriteUrls.contains(url);
  }
}
