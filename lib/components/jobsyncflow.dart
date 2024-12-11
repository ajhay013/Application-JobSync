import 'package:flutter/material.dart';

class JobSyncFlow extends StatefulWidget {
  @override
  _JobSyncFlowState createState() => _JobSyncFlowState();
}

class _JobSyncFlowState extends State<JobSyncFlow> {
  @override
  Widget build(BuildContext context) {
    // Container Style
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // Title
          Padding(
            padding: const EdgeInsets.only(top: 70, bottom: 30),
            child: Text(
              'How JobSync Work?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          // Job Sync Steps
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildStep(context, icon: Icons.account_circle, label: 'Create account'),
              _buildArrow(),
              _buildStep(context, icon: Icons.description, label: 'Upload CV/Resume'),
              _buildArrow(),
              _buildStep(context, icon: Icons.search, label: 'Find suitable job'),
              _buildArrow(),
              _buildStep(context, icon: Icons.assignment, label: 'Apply job'),
              _buildArrow(),
              _buildStep(context, icon: Icons.laptop, label: 'Take Interview through video call'),
            ],
          ),
        ],
      ),
    );
  }

  // Function to build a step with hover effect
  Widget _buildStep(BuildContext context, {required IconData icon, required String label}) {
    return MouseRegion(
      onEnter: (_) => _scaleIn(),
      onExit: (_) => _scaleOut(),
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(10),
        ),
        width: 300,  // Set a fixed width for the cards
        height: 200, // Increased the height of the cards
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,  // Increased the size of the CircleAvatar
              child: Icon(
                icon,
                size: 50,  // Increased icon size
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 15), // Increased space between icon and text
            Text(
              label,
              style: TextStyle(
                fontSize: 18,  // Increased text size
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to create arrow
  Widget _buildArrow() {
    return Icon(
      Icons.arrow_downward, // Changed to downward arrow
      size: 30,
      color: Colors.blue,
    );
  }

  // Scale-in effect
  void _scaleIn() {
    print("Scaling in");
  }

  // Scale-out effect
  void _scaleOut() {
    print("Scaling out");
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('JobSync Flow')),
      body: JobSyncFlow(),
    ),
  ));
}
