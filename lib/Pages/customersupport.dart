import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomerSupport(),
    );
  }
}

class CustomerSupport extends StatefulWidget {
  @override
  _CustomerSupportState createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  String? issueType;
  String subject = '';
  String question = '';
  String? attachment;

  final _formKey = GlobalKey<FormState>();

  void handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      print({
        'issueType': issueType,
        'subject': subject,
        'question': question,
        'attachment': attachment,
      });
      // Show confirmation message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form submitted successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JobSync Support'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Support Header
            Row(
              children: [
                Image.asset(
                  'assets/logo/jobsync_logo.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(width: 10),
                Text(
                  'JobSync Support',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'me.jobsync@gmail.com',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),

            // Form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Issue Type
                  DropdownButtonFormField<String>(
                    value: issueType,
                    hint: Text('Select Issue Type'),
                    decoration: InputDecoration(
                      labelText: 'Issue Type',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    onChanged: (value) {
                      setState(() {
                        issueType = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select an issue type';
                      }
                      return null;
                    },
                    items: [
                      'Account Issue',
                      'Technical Problem',
                      'Billing Inquiry'
                    ].map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),

                  // Subject
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Subject',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    onChanged: (value) {
                      setState(() {
                        subject = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a subject';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // Question
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Your Question',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    onChanged: (value) {
                      setState(() {
                        question = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your question';
                      }
                      return null;
                    },
                    maxLines: 5,
                  ),
                  SizedBox(height: 16),

                  // Attachment
                  GestureDetector(
                    onTap: () {
                      // Simulate selecting an attachment
                      setState(() {
                        attachment = 'example_file.txt'; // Just a placeholder
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.attach_file, color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          'Add an attachment',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  // Submit Button
                  ElevatedButton(
                    onPressed: handleSubmit,
                    child: Text('Submit'),
                  ),
                  SizedBox(height: 16),

                  // Note
                  Text(
                    'In order to answer your question or troubleshoot a problem, a JobSync representative may need to access your account, including, as needed, your messages and settings.',
                    style: TextStyle(color: Colors.grey),
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
