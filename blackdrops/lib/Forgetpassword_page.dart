import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'firebase_auth_implementation/auth_services.dart';

class ForgetpasswordPage extends StatefulWidget {
  const ForgetpasswordPage({super.key});

  @override
  State<ForgetpasswordPage> createState() => _ForgetpasswordPageState();
}

class _ForgetpasswordPageState extends State<ForgetpasswordPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password reset email sent successfully!', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 16)),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.message}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<bool> isEmailRegistered(String email) async {
    try {
      await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  String? emailValidator(String? value) {
    final emailRegex = RegExp(
      r'^[^@]+@[^@]+\.[^@]+$',
      caseSensitive: false,
    );
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _emailError;
  void _updateEmailError(String? value) {
    setState(() {
      _emailError = emailValidator(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      backgroundColor: Colors.cyan.shade900.withOpacity(0.4),
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Forget ', style: TextStyle(color: Colors.greenAccent.shade400, fontSize: 30, fontWeight: FontWeight.w500)),
                Text('Password?', style: TextStyle(color: Colors.yellow.shade400, fontSize: 30, fontWeight: FontWeight.w500)),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
              child: Text(
                'You\'ll receive an email to reset your password.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              child: Form(
                key: formKey,
                child: TextFormField(
                  onChanged: _updateEmailError,
                  cursorColor: Colors.greenAccent.shade700,
                  controller: emailController,
                  textInputAction: TextInputAction.done,
                  validator: emailValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.yellow.shade100, // Background color
                    hintText: 'Email address',
                    icon: Icon(Icons.email_outlined, size: 35, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.blue, // Border color
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.greenAccent.shade700, // Border color
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 60),
            SizedBox(
              width: 200,
              height: 55,
              child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState?.validate() ?? false) {
                    bool isRegistered = await isEmailRegistered(emailController.text.trim());
                    if (isRegistered) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => Center(child: CircularProgressIndicator(color: Colors.yellow)),
                      );
                      await resetPassword();
                      Navigator.of(context).pop(); // Dismiss the progress dialog
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Email is not registered'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                child: Text('Reset Password', style: TextStyle(fontSize: 16, color: Colors.white)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green.shade900),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
