import 'package:flutter/material.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showContainer = false;

  @override
  void initState() {
    super.initState();
    // Start a timer to show the container after 1000 milliseconds
    Timer(Duration(milliseconds: 1000), () {
      setState(() {
        _showContainer = true;
      });
    });
  }

  void _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username == 'teja04' && password == '123456') {
      Navigator.pushNamed(context, '/dashboard');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  // Dummy function to simulate Google sign-in
  void _googleSignIn() {
    // Add your Google sign-in logic here
    Navigator.pushNamed(context, '/dashboard');
  }

  // Dummy function to simulate Microsoft sign-in
  void _microsoftSignIn() {
    // Add your Microsoft sign-in logic here
    Navigator.pushNamed(context, '/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/login_bg.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: AnimatedOpacity(
              opacity: _showContainer ? 1.0 : 0.0,
              duration: Duration(seconds: 1), // Duration of the fade-in animation
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9), // Slightly transparent container
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Logo
                      Image.asset(
                        'assets/images/Agriculture.png',
                        height: 100,
                      ),
                      SizedBox(height: 20),
                      // Username field
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange, width: 2.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.black),
                          hintStyle: TextStyle(color: Colors.black54),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 10),
                      // Password field
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange, width: 2.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.black),
                          hintStyle: TextStyle(color: Colors.black54),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 20),
                      // Login button
                      ElevatedButton(
                        onPressed: _login,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1A5319),
                          minimumSize: Size(double.infinity, 40),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Google and Microsoft logos
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: _googleSignIn,
                            child: Image.asset(
                              'assets/images/Google.png',
                              height: 40,
                            ),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            onTap: _microsoftSignIn,
                            child: Image.asset(
                              'assets/images/Microsoft.png',
                              height: 40,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Create Account button
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF1A5319), width: 2.0),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/create-account');
                          },
                          child: Text('Create your account'),
                          style: TextButton.styleFrom(
                            foregroundColor: Color(0xFF1A5319), // Text color
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
