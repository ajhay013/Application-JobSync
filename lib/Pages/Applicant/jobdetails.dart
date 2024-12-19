import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: JobDetails(
      job: {
        'title': 'Software Developer',
        'company': 'Tech Innovators Inc.',
        'location': 'Manila',
        'type': 'Full-time',
        'salary': '₱45,000/month',
      },
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class JobDetails extends StatefulWidget {
  final Map<String, String> job;

  JobDetails({required this.job});

  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the AnimationController
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    // Create the Slide Animation
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1), // Start from the bottom
      end: Offset.zero,     // End at the normal position
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    // Dispose of the animation controller when done
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          // Close the modal when a downward swipe is detected
          if (details.primaryVelocity! > 0) {
            Navigator.pop(context); // Close the modal on swipe down
          }
        },
        child: SlideTransition(
          position: _slideAnimation,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row for the image and job title
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Section
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/logo/google_logo.png',
                        width: 110,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16),
                    // Job Title, Company, and Location Section
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Job Title
                          Text(
                            '${widget.job['title'] ?? 'Not specified'}',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          // Company Name
                          Text(
                            '${widget.job['company'] ?? 'Not specified'}',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 10),
                          // Location
                          Row(
                            children: [
                              Icon(Icons.location_on, size: 18), // Location Icon
                              SizedBox(width: 8),
                              Text(
                                '${widget.job['location'] ?? 'Not specified'}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Divider between salary and job type
                Divider(),
                SizedBox(height: 10),
                // Job Type Header
                Row(
                  children: [
                    Icon(Icons.work, size: 18), // Job Type Icon
                    SizedBox(width: 8),
                    Text(
                      "Job Type",  // Job Type header text
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                // Job Type Section
                Text(
                  '${widget.job['type'] ?? 'Not specified'}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                // Salary Section with Icon and Header
                Divider(),
                Text(
                  "Salary", // Header for Salary
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.monetization_on, size: 18), // Salary Icon
                    SizedBox(width: 8),
                    Text(
                      '${widget.job['salary'] ?? 'Not specified'}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Divider(),  // Divider after salary
                SizedBox(height: 8),
                Text(
                  "Full Job Description",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                // Updated Job Description for Software Developer
                Text(
                  "As a Software Developer at Google Inc. will design, develop, and maintain software solutions that meet the needs of the company. You'll collaborate with a team of engineers, participate in code reviews, and contribute to the development of innovative software products that are scalable and efficient.",
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
                SizedBox(height: 16),
                Text(
                  "Your Key Responsibilities:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                BulletList([
                  "Develop, test, and deploy high-quality software applications.",
                  "Collaborate with cross-functional teams to define and design new features.",
                  "Write clean, scalable, and maintainable code.",
                  "Troubleshoot, debug, and optimize performance of applications.",
                  "Stay up-to-date with new technologies and software development practices.",
                  "Participate in code reviews to maintain coding standards and best practices.",
                ]),
                SizedBox(height: 16),
                Text(
                  "Your Qualifications:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                BulletList([
                  "Bachelor's degree in Computer Science, Information Technology, or related field.",
                  "Proficiency in programming languages such as Java, Python, C++, or JavaScript.",
                  "Experience with frameworks and libraries like React, Angular, or Node.js.",
                  "Strong problem-solving and debugging skills.",
                  "Familiarity with databases (e.g., MySQL, PostgreSQL, MongoDB).",
                  "Excellent communication skills and ability to work in a collaborative environment.",
                ]),
                Divider(),
                SizedBox(height: 8),
                Text(
                  "Job Benefits",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "- Health insurance and wellness programs\n- Paid time off and sick leave\n- Retirement savings plan\n- Opportunities for career growth and development\n- Performance-based incentives\n- Work-from-home options available\n- Continuous learning and training opportunities",
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
                SizedBox(height: 16),
                Text(
                  "Application Question(s):",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                BulletList([
                  "Are you proficient in any programming languages? If so, which ones?",
                  "Have you worked in a team-based software development environment?",
                  "Can you commit to a full-time position?",
                ]),
                SizedBox(height: 16),
                // Align buttons vertically and center them
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                    crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
                    children: [
                      SizedBox(
                        width: 300, // Set the desired width for all buttons
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Apply Now", style: TextStyle(fontSize: 16)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue[800], // Set background color to gray
                            foregroundColor: Colors.white, // Set text color to black
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 300, // Set the desired width for all buttons
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.save), // Save icon
                          label: Text("Save Job", style: TextStyle(fontSize: 16)),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.grey[400], 
                            foregroundColor: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 300, // Set the desired width for all buttons
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.report), // Report icon
                          label: Text("Report Job", style: TextStyle(fontSize: 16)),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.grey[400], 
                            foregroundColor: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Divider(),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: SizedBox(
                    width: 350, // Increase the width of the "Activate" button
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Activate", style: TextStyle(fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[400], 
                        foregroundColor: Colors.black, // Set text color to black
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                // Expanded Terms and Conditions Text
                Text(
                  "By creating a job alert, you agree to our Terms."
                  "These terms outline the rules and guidelines for the use of our services.",
                  style: TextStyle(
                    fontSize: 14, // Smaller text size
                    color: Colors.grey[600], // Lighter color for the description
                  ),
                  textAlign: TextAlign.center, // Center the text
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BulletList extends StatelessWidget {
  final List<String> items;
  BulletList(this.items);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((item) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("• ", style: TextStyle(fontSize: 18)),
                  Expanded(child: Text(item, style: TextStyle(fontSize: 18, height: 1.5))),
                ],
              ))
          .toList(),
    );
  }
}
