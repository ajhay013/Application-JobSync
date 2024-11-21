import 'package:flutter/material.dart';
import 'package:capstone/Pages/Sign.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Account',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for each text field
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _suffixController = TextEditingController();
  final _genderController = TextEditingController();
  final _contactController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isCandidate = true;
  bool _isAgreed = false;
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  String? _selectedGender;

  @override
  void dispose() {
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
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    /*appBar: AppBar(
      title: const Text('Create Account'),
    ),*/
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // New logo and text "JobSync"
            const SizedBox(height: 60.0),
              Column(
                
                children: [
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
                ],
              ),
            const SizedBox(height: 20.0),
            Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                const SizedBox(height: 8.0), // Space between JobSync text and Create Account text
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                  ],
                ),
            // Existing row for "Already have an account? Log In"
            Row(
              mainAxisAlignment: MainAxisAlignment.start, // Align this row to the left
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignScreen()), // Navigate to Sign Screen
                    );
                  },
                  child: const Text(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.person, color: _isCandidate ? Colors.white : Colors.black),
                  label: const Text('Candidate'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isCandidate ? Colors.blue[900] : Colors.grey[1000],
                    foregroundColor: _isCandidate ? Colors.white : Colors.black,
                    side: const BorderSide(color: Colors.grey),
                    padding: const EdgeInsets.symmetric(horizontal: 39, vertical: 12),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _isCandidate = true;
                    });
                  },
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.apartment, color: !_isCandidate ? Colors.white : Colors.black),
                  label: const Text('Employers'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: !_isCandidate ? Colors.blue[900] : Colors.grey[1000],
                    foregroundColor: !_isCandidate ? Colors.white : Colors.black,
                    side: const BorderSide(color: Colors.grey),
                    padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 12),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _isCandidate = false;
                    });
                  },
                ),
              ],
            ),
const SizedBox(height: 15.0),
Row(
  crossAxisAlignment: CrossAxisAlignment.start, // Align items at the top
  children: [
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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



          const SizedBox(height: 4.0), // Space between the field and validation message
          /*Text(
            _firstNameController.text.isEmpty ? 'First name is required' : '',
            style: const TextStyle(color: Colors.red, fontSize: 12.0),
          ),*/
        ],
      ),
    ),
    const SizedBox(width: 8.0),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _middleNameController,
            decoration: const InputDecoration(
              labelText: 'Middle Name',
              labelStyle: TextStyle(color: Colors.black), // Set label color to black
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            ),
          ),
          const SizedBox(height: 18.0), // Reserve space equivalent to the validation message
        ],
      ),
    ),
  ],
),

              //const SizedBox(height: 15.0),
                // Repeat similar TextFormField for each required input field with validator
                // Example for Last Name
          Row(
  crossAxisAlignment: CrossAxisAlignment.start, // Align items at the top
  children: [
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              // Check if the value is empty
              if (value == null || value.isEmpty) {
                return 'Last name is required';
              }
              // Check if the value contains only letters
              if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                return 'Please enter only letters';
              }
              return null; // Validation passes if the input is valid
            },
          ),
          const SizedBox(height: 4.0), // Space between the field and validation message
          /*Text(
            _firstNameController.text.isEmpty ? 'First name is required' : '',
            style: const TextStyle(color: Colors.red, fontSize: 12.0),
          ),*/
        ],
      ),
    ),
    const SizedBox(width: 8.0),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _suffixController,
            decoration: const InputDecoration(
              labelText: 'Suffix',
              labelStyle: TextStyle(color: Colors.black), // Set label color to black
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            ),
          ),
          const SizedBox(height: 18.0), // Reserve space equivalent to the validation message
        ],
      ),
    ),
  ],
),
//const SizedBox(height: 15.0),
        DropdownButtonFormField<String>(
          value: _selectedGender,
            onChanged: (String? newValue) {
              setState(() {
                _selectedGender = newValue;
              });
            },
              items: <String>['Male', 'Female', 'Other']
                .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
          child: Text(value),
            );
          }).toList(),
            decoration: InputDecoration(
            label: RichText(
            text: const TextSpan(
            text: 'Gender ',
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
                      ),
      const SizedBox(height: 15.0),
              TextField(
                controller: _contactController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  label: RichText(
                    text: const TextSpan(
                      text: 'Contact ',
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
                onChanged: (value) {
                  // Ensure the number always starts with +63
                  if (!value.startsWith('+63')) {
                    _contactController.text = '+63' + value.replaceAll('+63', '');
                    _contactController.selection = TextSelection.fromPosition(
                      TextPosition(offset: _contactController.text.length),
                    );
                  }

                  // Get the value excluding +63
                  String contactValue = _contactController.text.replaceFirst('+63', '');

                  // Enforce the 10-digit limit (excluding +63)
                  if (contactValue.length > 10) {
                    _contactController.text = '+63' + contactValue.substring(0, 10);
                    _contactController.selection = TextSelection.fromPosition(
                      TextPosition(offset: _contactController.text.length),
                    );
                  }

                  // Check if the contact field has a value (excluding +63)
                  if (contactValue.isEmpty) {
                    print('Contact number cannot be empty');
                  } 
                  // Validate the number length (should be exactly 10 digits excluding +63)
                  else if (contactValue.length != 10) {
                    print('Contact number must be exactly 10 digits');
                  }
                  // Validate the format (must start with +63 and followed by exactly 10 digits)
                  else if (!RegExp(r'^\+63\d{10}$').hasMatch(_contactController.text)) {
                    print('Invalid contact number format');
                  } else {
                    print('Contact number is valid');
                  }
                  
                },
                
              ),




const SizedBox(height: 15.0),
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
          Row(
                children: [
                  Checkbox(
                    value: _isAgreed,
                    onChanged: (value) {
                    setState(() {
                    _isAgreed = value ?? false;
                  });
                },
              ),
                  const Text('I agree to the '),
                  GestureDetector(
                  onTap: () {
                  // Handle terms of service link
                  },
              child: const Text(
              'Terms of Service',
                style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
          const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900], // Set the button's background color to blue
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create Account',
                    style: TextStyle(color: Colors.white), // Set text color to white
                  ),
                  SizedBox(width: 8.0),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white, // Set the icon color to white
                  ),
                ],
              ),
            ),

              const SizedBox(height: 16.0),
              const Text(
                  '- or -',
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 16.0),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Padding(
                  padding: const EdgeInsets.only(right: 10.0), // Optional, to give space between the image and text
                  child: Image.asset(
                    'assets/logo/google_logo.png', // Add your Google logo path here
                    height: 24.0, // Adjust the height to fit your design
                  ),
                ),
                label: const Text("Sign In with Google"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                  side: const BorderSide(color: Colors.grey),
                ),
              ),
            ],
          ),
          
        ),
      ),
    );
}


} 