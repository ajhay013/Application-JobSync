import 'package:flutter/material.dart';
import 'package:capstone/main.dart';
import 'package:capstone/Pages/Sign.dart';

class EmployerSignUpScreen extends StatefulWidget {
  @override
  _EmployerSignUpScreenState createState() => _EmployerSignUpScreenState();
}

class _EmployerSignUpScreenState extends State<EmployerSignUpScreen> {
  int stepIndex = 0; // 0 = First screen, 1 = Second screen, 2 = Third screen
  final _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isAgreed = false;
  bool _showPassword = false;
  bool _showConfirmPassword = false;


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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: stepIndex == 0
          ? buildFirstScreen()
          : stepIndex == 1
              ? buildSecondScreen()
              : buildThirdScreen(), // Add third screen here
    );
  }

  // First screen remains the same
  Widget buildFirstScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo/jobsync_logo.png',
                height: 50.0,
              ),
              const SizedBox(width: 8.0),
              const Text(
                'JobSync',
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "Create Account.",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text("Already have an account? "),
              GestureDetector(
  onTap: () {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => SignScreen(),
        transitionDuration: Duration.zero, // Instant transition
      ),
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
          const SizedBox(height: 10),
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
                      MaterialPageRoute(builder: (context) => MyApp()),
                      (route) => false,
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
          const SizedBox(height: 20),
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
          TextFormField(
  controller: _middleNameController,
  decoration: InputDecoration(
    label: RichText(
      text: const TextSpan(
        text: 'Middle Name ',
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
      return 'Middle name is required';
    }
    // Check if the value contains only letters
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Please enter only letters';
    }
    return null; // Validation passes if the input is valid
  },
),

         SizedBox(height: 10),
TextFormField(
  controller: _lastNameController,
  decoration: InputDecoration(
    label: RichText(
      text: const TextSpan(
        text: 'Last Name ',
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
  autovalidateMode: AutovalidateMode.onUserInteraction,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Last name is required';
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Please enter only letters';
    }
    return null;
  },
),
SizedBox(height: 10),
TextFormField(
  controller: _positionController,
  decoration: InputDecoration(
    label: RichText(
      text: const TextSpan(
        text: 'Position ',
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
  autovalidateMode: AutovalidateMode.onUserInteraction,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Position is required';
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Please enter a valid position';
    }
    return null;
  },
),
SizedBox(height: 10),
TextFormField(
  controller: _phoneNumberController,
  decoration: InputDecoration(
    label: RichText(
      text: const TextSpan(
        text: 'Phone Number ',
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
  keyboardType: TextInputType.phone,
  autovalidateMode: AutovalidateMode.onUserInteraction,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  },
),
SizedBox(height: 20),
         Center(
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue[900],
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    onPressed: () {
      setState(() {
        stepIndex = 1; // Move to second screen
      });
    },
    child: const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Next Page",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        SizedBox(width: 5),
        Icon(Icons.arrow_forward, color: Colors.white),
      ],
    ),
  ),
)

        ],
      ),
    );
  }

  // Second screen for uploading ID and additional inputs
  Widget buildSecondScreen() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo/jobsync_logo.png',
                height: 50.0,
              ),
              const SizedBox(width: 8.0),
              const Text(
                'JobSync',
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "ID Verification",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          /*Row(
            children: [
              Text("Already have an account? "),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignScreen()),
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
          ),*/
          const SizedBox(height: 20),
        Text("Upload the front side of your Government ID *"),
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
        Text("Browse photo"),
      ],
    ),
  ),
),
SizedBox(height: 10),
Text("Upload the back side of your Government ID *"),
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
        Text("Browse photo"),
      ],
    ),
  ),
),
SizedBox(height: 10),
Row(
  mainAxisAlignment: MainAxisAlignment.center, // Center the row content
  children: [
    Text("Take a Selfie: "),
    SizedBox(width: 10), // Add space between text and button
    ElevatedButton.icon(
      icon: Icon(Icons.camera_alt, color: Colors.white),
      label: Text(
        "Open Camera",
        style: TextStyle(color: Colors.white), // Set text color to white
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[900], // Button background color
        padding: EdgeInsets.symmetric(vertical: 16),
        minimumSize: Size(150, 48), // Set width and height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        // Implement camera opening logic here
      },
    ),
  ],
),




          const SizedBox(height: 20),
           Row(
  children: [
    Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          //side: BorderSide(color: Colors.blue[900]!), // Border color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          setState(() {
            stepIndex = 0; // Go back to the first screen
          });
        },
        child: const Text(
          "Back",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    ),
    const SizedBox(width: 10),
    Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[900],
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
      setState(() {
        stepIndex = 2; // Move to second screen
      });
    },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Next Page",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(width: 5),
            Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    ),
  ],
)

        ],
      ),
    );
  }

  // Third screen for email, password, and terms agreement
  Widget buildThirdScreen() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(  // Wrap Column in SingleChildScrollView
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo/jobsync_logo.png',
                height: 50.0,
              ),
              const SizedBox(width: 8.0),
              const Text(
                'JobSync',
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "Create Account.",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // Email input
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              label: RichText(
                text: const TextSpan(
                  text: 'Email Address ',
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  children: [TextSpan(text: '*', style: TextStyle(color: Colors.red))],
                ),
              ),
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 15.0),
          // Password field
          TextFormField(
            controller: _passwordController,
            obscureText: !_showPassword,
            decoration: InputDecoration(
              label: RichText(
                text: const TextSpan(
                  text: 'Password ',
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  children: [TextSpan(text: '*', style: TextStyle(color: Colors.red))],
                ),
              ),
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              suffixIcon: IconButton(
                icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
                onPressed: _togglePasswordVisibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters long';
              }
              if (!RegExp(r'[A-Z]').hasMatch(value)) {
                return 'Password must include at least one uppercase letter';
              }
              if (!RegExp(r'[a-z]').hasMatch(value)) {
                return 'Password must include at least one lowercase letter';
              }
              if (!RegExp(r'[0-9!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                return 'Password must include at least one number or symbol';
              }
              return null;
            },
          ),
          const SizedBox(height: 15.0),
          // Confirm Password field
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: !_showConfirmPassword,
            decoration: InputDecoration(
              label: RichText(
                text: const TextSpan(
                  text: 'Confirm Password ',
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  children: [TextSpan(text: '*', style: TextStyle(color: Colors.red))],
                ),
              ),
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              suffixIcon: IconButton(
                icon: Icon(_showConfirmPassword ? Icons.visibility : Icons.visibility_off),
                onPressed: _toggleConfirmPasswordVisibility,
              ),
            ),
            validator: (value) {
              if (value == null || value != _passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          // Agreement checkbox
          Row(
            children: [
              Checkbox(
                value: _isAgreed,
                onChanged: (bool? value) {
                  setState(() {
                    _isAgreed = value!;
                  });
                },
              ),
              Expanded(
                child: Text(
                  "I’ve read and agree with your Terms of Services",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      stepIndex = 1; // Go back to the first screen
                    });
                  },
                  child: const Text(
                    "Back",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      stepIndex = 2; // Move to second screen
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Create Account",
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
        ],
      ),
    ),
  );
}

  
}
