import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; 
import 'package:capstone/main.dart';  
import 'package:capstone/Pages/Sign.dart';// Import gestures package

class ForgetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignScreen())
                         ); // Navigate back to Sign In screen
                      },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
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
                          MaterialPageRoute(
                              builder: (context) => MyApp()), // Replace with the actual create account screen
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
                  // Navigate to the email verification screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Reset Password',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward, color: Colors.white),
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

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // Center the logo and title horizontally
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo/jobsync_logo.png', // Ensure logo is in the assets folder
                  height: 80,
                ),
                SizedBox(width: 10),
                Text(
                  'JobSync',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 30),
            // Title
            Text(
              'Email Verification',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Subtitle
            Text(
              "We’ve sent an email verification to\nchristianbernal@gmail.com",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 30),
            // Verification Code Input
            TextField(
              decoration: InputDecoration(
                labelText: 'Verification Code',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Countdown Timer
            Text(
              'Time remaining: 3:00',
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
            SizedBox(height: 30),
            // Verify Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Handle verification logic
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Verify My Account',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Resend Code
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(
                    text: "Didn't receive any code? ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Resend Code',
                    style: TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle resend code logic
                      },
                  ),
                ],
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
