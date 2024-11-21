import 'package:flutter/material.dart';
import 'package:capstone/main.dart';
import 'package:capstone/Pages/Sign.dart';

class EmployerSignUpScreen extends StatefulWidget {
  @override
  _EmployerSignUpScreenState createState() => _EmployerSignUpScreenState();
}

class _EmployerSignUpScreenState extends State<EmployerSignUpScreen> {
  int stepIndex = 0; // 0 = First screen, 1 = Second screen
  final _firstNameController = TextEditingController();
  @override


  /*void dispose() {
    // Dispose of controllers when not needed
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _suffixController.dispose();
    _genderController.dispose();
    _contactController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _showConfirmPassword = !_showConfirmPassword;
    });
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() == true && _isAgreed) {
      // Perform registration (e.g., API call or save to database)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration successful!')),
      );
    } else if (!_isAgreed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please agree to the Terms of Service')),
      );
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: stepIndex == 0 ? buildFirstScreen() : buildSecondScreen(),
    );
  }

  Widget buildFirstScreen() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60.0),
          Row(
                    mainAxisAlignment: MainAxisAlignment.center,  // Centers the content horizontally
                    children: [
                      Image.asset(
                        'assets/logo/jobsync_logo.png', // Path to your logo
                        height: 50.0, // Adjust the height as needed
                      ),
                      const SizedBox(width: 8.0),  // Add space between the logo and text
                      const Text(
                        'JobSync',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // You can change the color as needed
                        ),
                      ),
                    ],
                  ),
          SizedBox(height: 20),

          Text(
            "Create Account.",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          //SizedBox(height: 10),
       Row(
            children: [
              Text("Already have an account? "),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignScreen()), // Replace with your login screen class name
                  );
                },
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
  const SizedBox(height: 15.0),
                Center(
              child: const Text(
                'CREATE ACCOUNT AS A',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
          SizedBox(height: 10),

          // Tab Buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  icon: Icon(Icons.person, color: Colors.black),
                  label: const Text('Candidate'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[1000],
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()), // Replace with your main widget
                      (route) => false, // Removes all previous routes
                    );
                  },
                ),
              ),

              Expanded(
                child: ElevatedButton.icon(
                  icon: Icon(Icons.apartment, color: Colors.white),
                  label: const Text('Employers'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Already on Employer tab
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Input Fields for Step 1
          TextFormField(
  controller: _firstNameController,
  decoration: InputDecoration(
    label: RichText(
      text: const TextSpan(
        text: 'First Name ',
        style: TextStyle(color: Colors.black, fontSize: 16.0),
        children: [
          TextSpan(
            text: '*',
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    ),
    border: const OutlineInputBorder(),
    contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
  ),
  autovalidateMode: AutovalidateMode.onUserInteraction, // Trigger validation on interaction
  validator: (value) {
    // Check if the value is empty
    if (value == null || value.isEmpty) {
      return 'First name is required';
    }
    // Check if the value contains only letters
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Please enter only letters';
    }
    return null; // Validation passes if the input is valid
  },
),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(labelText: "Middle Name"),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(labelText: "Last Name *"),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(labelText: "Position *"),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(labelText: "Phone Number *"),
          ),
          SizedBox(height: 20),

          // Next Button
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  stepIndex = 1; // Move to the second screen
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Next Page"),
                  SizedBox(width: 5),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSecondScreen() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60,),
          Row(
                    mainAxisAlignment: MainAxisAlignment.center,  // Centers the content horizontally
                    children: [
                      Image.asset(
                        'assets/logo/jobsync_logo.png', // Path to your logo
                        height: 50.0, // Adjust the height as needed
                      ),
                      const SizedBox(width: 8.0),  // Add space between the logo and text
                      const Text(
                        'JobSync',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // You can change the color as needed
                        ),
                      ),
                    ],
                  ),
          SizedBox(height: 20),

          Text(
            "Create Account.",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          //SizedBox(height: 5),
          Row(
            children: [
              Text("Already have an account? "),
              GestureDetector(
                onTap: () {
                  // Navigate to login screen
                },
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Upload ID Section
          Text("Upload valid ID *"),
          Container(
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.photo, size: 50, color: Colors.grey),
                  Text("Browse photo or drop here"),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),

          // Input Fields for Step 2
          TextField(
            decoration: InputDecoration(labelText: "Email Address *"),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(labelText: "Password *"),
            obscureText: true,
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(labelText: "Confirm Password *"),
            obscureText: true,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Checkbox(value: true, onChanged: (value) {}),
              Expanded(
                child: Text(
                  "I’ve read and agree with your Terms of services",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),

          // Back and Next Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      stepIndex = 0; // Go back to the first screen
                    });
                  },
                  child: Text("Back"),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Submit action
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Next Page"),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
