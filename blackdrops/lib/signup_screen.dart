import 'package:untitled/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_auth_implementation/firebase_auth_services.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isNavigating = false;
  bool _passwordVisible = false;
  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
    final passwordRegex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    if (!passwordRegex.hasMatch(value)) {
      return 'Password must be at least 8 characters long and include uppercase, lowercase, number, and special character';
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


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: Stack(
        children: [
          Center(
          child : SingleChildScrollView(
            child: Container(
              child: Form(
                key: _formKey,
                child : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'USER SIGNUP',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 27,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 50),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      child: TextFormField(
                        controller: _emailController,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.green.shade700, width: 2.0), // Focused border color
                          ),
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
                        ),
                        validator: _validateEmail,
                        onChanged: _updateEmailError,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !_passwordVisible,
                            cursorColor: Colors.green,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.green.shade700, width: 2.0), // Focused border color
                              ),
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
                              errorText: _passwordError,
                              errorMaxLines: 3// Show the error message here
                            ),
                            validator: _validatePassword,
                            onChanged: _updatePasswordError,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      width: 200,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            if (!_isNavigating) {
                              setState(() {
                                _isNavigating = true;
                              });
                              Signup();
                            }
                          }
                        },
                        child: Text(
                          'SIGN UP',
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
                    SizedBox(height: 20),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(text: 'Already have an account? '),
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {
                                if (!_isNavigating) {
                                  setState(() {
                                    _isNavigating = true;
                                  });
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginScreen()),
                                  ).then((_) {
                                    setState(() {
                                      _isNavigating = false;
                                    });
                                  });
                                }
                              },
                              child: Text(
                                'Log IN',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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



  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Congratulations!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          content: Padding(
            padding: EdgeInsets.all(10),
            child: Text('You are successfully Registered.'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
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
          title: Text('Error!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          content: Padding(
            padding: EdgeInsets.all(5),
            child: Text('There\'s some error in signing you up. The account with the email already exists.',
                style: TextStyle(fontSize: 16)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
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

  void _showAlertDialog2(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Error during sign up',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          content: Padding(
            padding: EdgeInsets.all(10),
            child: Text(errorMessage),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
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

  void Signup() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      print('Email or password cannot be empty');
      setState(() {
        _isNavigating = false;
      });
      return;
    }

    print('Attempting to sign up with email: $email and password: $password');

    try {
      User? signUpUser = await _auth.signUpWithEmailAndPassword(email, password);

      if (signUpUser != null) {
        print('User is successfully signed up!!!');
        // Ensure the context is valid and use a small delay if necessary
        Future.delayed(Duration.zero, () => _showAlertDialog(context));
      } else {
        print('Some error occurred during signing up the user');
        _showAlertDialog1(context);
        setState(() {
          _isNavigating = false;
        });
      }
    } catch (e) {
      print('Error during sign up: ${e.toString()}');
      String errorMessage = 'An unknown error occurred.';

      // Handle specific Firebase Auth errors
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'email-already-in-use':
            errorMessage = 'The email address is already in use by another account.';
            break;
          case 'weak-password':
            errorMessage = 'The password is too weak.';
            break;
          case 'invalid-email':
            errorMessage = 'The email address is not valid.';
            break;
          default:
            errorMessage = e.message ?? 'An unknown error occurred.';
        }
      }

      // Ensure the context is valid and use a small delay if necessary
      // Future.delayed(Duration.zero, () => _showAlertDialog2(context, errorMessage));
      setState(() {
        _isNavigating = false;
      });
    }
  }

}