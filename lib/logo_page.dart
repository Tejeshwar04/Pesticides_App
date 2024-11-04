import 'package:flutter/material.dart';

class LogoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Navigate to the next screen after 15 seconds
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/select-language');
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Minimize the column size to its content
          mainAxisAlignment: MainAxisAlignment.center, // Center items vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center items horizontally
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png', // Path to your logo image
              width: 200,         // Adjust width as needed
              height: 200,        // Adjust height as needed
            ),
            SizedBox(height: 20), // Space between the logo and the text
            Text(
              'Best Crop Best Pesticides',
              style: TextStyle(
                color: Colors.black, // Text color
                fontSize: 16,       // Text size
                fontStyle: FontStyle.italic, // Italic font
                fontWeight: FontWeight.bold, // Make the text bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
