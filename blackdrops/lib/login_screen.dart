import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:untitled/Forgetpassword_page.dart';
import 'package:untitled/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_auth_implementation/auth_services.dart';
import 'Bottom_navigation_screen.dart';
import 'firebase_auth_implementation/firebase_auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isNavigating = false;
  bool _passwordVisible = false;
  String? _emailError;
  String? _passwordError;
  bool isChecked = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    return null;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void _updateEmailError(String? value) {
    setState(() {
      _emailError = _validateEmail(value);
    });
  }

  void _updatePasswordError(String? value) {
    setState(() {
      _passwordError = _validatePassword(value);
    });
  }


  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Congratulations!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          content: Padding(
            padding: EdgeInsets.all(10),
            child: Text('You are successfully Logged In.'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNavigationScreen()),
                );
              },
              child: Text(
                'OK',
                style: TextStyle(color: Colors.blueAccent.shade700),
              ),
            ),
          ],
        );
      },
    );
  }
  void _showAlertDialog1(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Error!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          content: Padding(
            padding: EdgeInsets.all(8),
            child: Text('You can\'t Logged In. User doesn\'t exist or wrong password'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Close the dialog
              },
              child: Text(
                'OK',
                style: TextStyle(color: Colors.blueAccent.shade700),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'USER LOGIN',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 50),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        child: TextFormField(
                          controller: _emailController,
                          cursorColor: Colors.green.shade700,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.yellow.shade100,
                            hintText: 'Email',
                            icon: Icon(
                              Icons.email,
                              size: 30,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.green.shade700, width: 2.0), // Focused border color
                            ),
                          ),
                          validator: _validateEmail,
                          onChanged: _updateEmailError,
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: !_passwordVisible,
                          cursorColor: Colors.green.shade700,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.yellow.shade100,
                            hintText: 'Password',
                            icon: Icon(
                              Icons.lock,
                              size: 30,
                              color: Colors.black,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.green.shade700, width: 2.0), // Focused border color
                            ),
                          ),
                          validator: _validatePassword,
                          onChanged: _updatePasswordError,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child : TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ForgetpasswordPage()),
                                );
                              },
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.red,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),),
                      SizedBox(height: 20),
                      SizedBox(
                        width: 200,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              await Login();
                            }
                          },
                          child: Text(
                            'LOG IN',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.green.shade900),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: 'Don\'t have an account? ',
                            ),
                            WidgetSpan(
                              child: GestureDetector(
                                onTap: () {
                                  if (!_isNavigating) {
                                    setState(() {
                                      _isNavigating = true;
                                    });
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => SignupScreen()),
                                    ).then((_) {
                                      setState(() {
                                        _isNavigating = false;
                                      });
                                    });
                                  }
                                },
                                child: Text(
                                  'Sign UP',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue.shade700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
        //               SizedBox(height: 30,),
        //               Center(
        //                   child: SizedBox(
        //                   height: 50,
        //                   width: 200,
        //                   child: SignInButton(
        //                     Buttons.google,
        //                     padding: EdgeInsets.symmetric(horizontal: 15),
        //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),side: BorderSide(color: Colors.blue.shade700,width: 2)),
        //                     text: 'SignIn with Google',
        //                     onPressed: () {
        //                       _handleGoogleSignIn();
        //                       },
        //     ),
        //   ),
        // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (_isNavigating) // Show the CircularProgressIndicator if navigating
            Center(
              child: CircularProgressIndicator(color: Colors.red),
            ),
        ],
      ),
    );
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  User? _user;

  Future<void> _handleGoogleSignIn() async {
    try {
      await Firebase.initializeApp();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );
      final UserCredential signInCredential = await auth.signInWithCredential(credential);

      if (signInCredential.user != null) {
        print('User is successfully logged in with Google!!! ');
        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.setBool('isAuthenticated', true);
        await sharedPreferences.setString('email', signInCredential.user?.email ?? '');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNavigationScreen()),
        );
      } else {
        print('Some error occurred during signing in with Google');
        _showAlertDialog1(context);
      }
    } catch (e) {
      print('Error during sign in with Google: ${e.toString()}');
      _showAlertDialog1(context);
    } finally {
      setState(() {
        _isNavigating = false;
      });
    }
  }

  Future<void> Login() async {
    setState(() {
      _isNavigating = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      print('Email or password cannot be empty');
      setState(() {
        _isNavigating = false;
      });
      return;
    }

    print('Attempting to sign in with email: $email and password: $password');

    try {
      User? signInUser = await _auth.signInWithEmailAndPassword(email, password);

      if (signInUser != null) {
        print('User is successfully logged in!!!');
        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.setBool('isAuthenticated', true);
        await sharedPreferences.setString('email', email);
        _showAlertDialog(context);
      } else {
        print('Some error occurred during signing in the user');
        _showAlertDialog1(context);
      }
    } catch (e) {
      print('Error during sign in: ${e.toString()}');
      _showAlertDialog1(context);
    } finally {
      setState(() {
        _isNavigating = false;
      });
    }
  }

}
