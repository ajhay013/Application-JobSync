import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // Import gestures package
import 'package:capstone/main.dart';  
import 'package:capstone/Pages/Sign.dart'; // Import the Sign.dart file

class ForgetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              children: [
                Text("+1-202-555-0178",
                    style: TextStyle(color: Colors.black, fontSize: 14)),
                SizedBox(width: 10),
                SizedBox(width: 20),
                /*TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, // Prevent any underlines
                  ),
                  child: Row(
                    children: [
                      Text("Login", style: TextStyle(color: Colors.black)),
                      Icon(Icons.person, color: Colors.black),
                    ],
                  ),
                ),*/
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align all other content to the left
          children: [
            SizedBox(height: 20),
            // Center the logo and JobSync text only horizontally in a Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
              children: [
                Image.asset(
                  'assets/logo/jobsync_logo.png', // Add your logo to assets
                  height: 80,
                ),
                SizedBox(width: 10), // Space between logo and text
                Text(
                  'JobSync',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Keep the rest of the content left-aligned
            Text(
              'Forget Password',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Only wrap the "Sign In" part in GestureDetector
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(
                    text: 'Go back to ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Sign In',
                    style: TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigate to Sign In screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignScreen()),
                        );
                      },
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            // Apply same logic for "Create an account" button
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Create an account',
                    style: TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigate to Create Account in main.dart
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()), // Replace with MyApp() (or whatever root widget you have)
                          (Route<dynamic> route) => false, // Removes all previous routes
                        );
                      },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Wrap the ElevatedButton in a Container to match width of TextField
            Container(
              width: double.infinity, // Make the button the same width as the container
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Handle Reset Password
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Reset Password',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward, color: Colors.white), // Change color here
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ForgetPasswordScreen(),
  ));
}
