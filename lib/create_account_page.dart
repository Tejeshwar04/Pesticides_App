import 'package:flutter/material.dart';
import 'dart:async';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
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
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9), // Slightly transparent background
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Logo at the top
                      Image.asset(
                        'assets/images/Agriculture.png', // Path to your logo image
                        width: 150,  // Adjust width as needed
                        height: 150, // Adjust height as needed
                      ),
                      SizedBox(height: 20),
                      // Username field
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFED4F1D), width: 2.0), // Orange border
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Create New Password field
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Create New Password',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFF5722), width: 2.0), // Orange border
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Confirm Password field
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFF5722), width: 2.0), // Orange border
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Phone Number field
                      TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFF5722), width: 2.0), // Orange border
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Create Account button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/dashboard');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1A5319), // Green background color
                        ),
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                            color: Colors.white, // White text color
                            fontWeight: FontWeight.bold, // Bold text
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
