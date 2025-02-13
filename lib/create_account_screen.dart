import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_authen/login_screen.dart'; // นำทางไปหน้า login เมื่อสร้างบัญชีสำเร็จ

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordMatching = true;
  bool _isPasswordValid = true;

  void _validatePassword() {
    setState(() {
      _isPasswordMatching =
          _passwordController.text == _confirmPasswordController.text;
      _isPasswordValid = _passwordController.text.length >= 6;
    });
  }

  void _createAccount() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (!_isPasswordMatching) {
      _showErrorDialog("Passwords do not match",
          "Please make sure both passwords are the same.");
      return;
    }

    if (!_isPasswordValid) {
      _showErrorDialog(
          "Weak password", "Password must be at least 6 characters.");
      return;
    }

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        _showSuccessDialog();
      }
    } catch (e) {
      // แสดง Error หากเกิดปัญหาการสร้างบัญชี
      _showErrorDialog("Create account failed", e.toString());
    }
  }

  // ฟังก์ชันแสดง Dialog เมื่อการสร้างบัญชีสำเร็จ
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Successful'),
        content: const Text('Your account has been created successfully.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // ปิด dialog
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  // ฟังก์ชันแสดง Dialog เมื่อเกิดข้อผิดพลาด
  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 69, 241, 17),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 111, 230, 8),
                        width: 2),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 111, 230, 8),
                        width: 2),
                  ),
                  errorText: !_isPasswordValid
                      ? 'Password must be at least 6 characters'
                      : null,
                ),
                obscureText: true,
                onChanged: (value) => _validatePassword(),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 111, 230, 8),
                        width: 2),
                  ),
                  errorText:
                      !_isPasswordMatching ? 'Passwords do not match' : null,
                ),
                obscureText: true,
                onChanged: (value) => _validatePassword(),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _createAccount,
                child: const Text('Create Account'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Color.fromARGB(255, 69, 241, 17),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
