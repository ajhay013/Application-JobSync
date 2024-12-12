import 'package:flutter/material.dart';
import 'package:capstone/Pages/Sign.dart';
import 'package:capstone/components/jobsyncflow.dart';
import 'package:capstone/components/popularcategories.dart';
import 'package:capstone/pages/Applicant/findjob.dart';
import 'package:capstone/pages/Applicant/findemployer.dart';

class JobSyncApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  // Open the drawer when the menu button is clicked
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo/jobsync_logo.png', height: 40),
              SizedBox(width: 8),
              Text('Jobsync', style: TextStyle(color: Colors.black)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => SignScreen(), // Your login screen class
                    transitionDuration: Duration.zero, // Instant transition
                    reverseTransitionDuration: Duration.zero, // Instant reverse transition
                  ),
                );
              },
              child: Text('Sign In', style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {
                // TODO: Implement Post A Job functionality
              },
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              child: Text('Post A Job', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        // Drawer widget for menu options
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue, // Set the background color to blue
                ),
                accountName: Text('Jobsync User'),
                accountEmail: Text('user@example.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.account_circle, size: 50, color: Colors.blue),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  // TODO: Implement navigation to Home
                },
              ),
              ListTile(
                leading: Icon(Icons.search),
                title: Text('Find Job'),
                onTap: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FindJob()),
                );
                },
              ),
              ListTile(
                leading: Icon(Icons.business),
                title: Text('Employers'),
                onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FindEmployer()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text('Dashboard'),
                onTap: () {
                  // TODO: Implement navigation to Dashboard screen
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Job Alerts'),
                onTap: () {
                  // TODO: Implement navigation to Job Alerts screen
                },
              ),
              ListTile(
                leading: Icon(Icons.support),
                title: Text('Customer Support'),
                onTap: () {
                  // TODO: Implement navigation to Customer Support screen
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
  padding: const EdgeInsets.all(16.0),
  child: Row(
    children: [
      Container(
        height: 55,
        width: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), // Existing border radius
          border: Border.all(
            color: Colors.grey, // Border color
            width: 1, // Border width
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: [
            Image.asset('assets/flags/ph.png', width: 24),
            SizedBox(width: 8),
            Text('PH'),
          ],
        ),
      ),
      SizedBox(width: 16),
      Expanded(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Job title, keyword, company',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    ],
  ),
),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Text(
                      'Find a job that suits your interest & skills.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Image.asset('assets/logo/Illustration.png', height: 270),
                    SizedBox(height: 16),
                    Text(
                      'Suggestion: Designer, Programming, Digital Marketing, Video, Animation',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    ), // Add your illustration image
                    SizedBox(height: 16),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: WrapAlignment.center,
                      children: [
                        buildStatCard('assets/icons/briefcase.png', '1,752,324', 'Live Job'),
                        buildStatCard('assets/icons/buildings.png', '1,752,324', 'Companies'),
                        buildStatCard('assets/icons/users.png', '1,752,324', 'Candidates'),
                      ],
                    ),
                    // Add the JobSyncFlow component here
                    JobSyncFlow(),
                    SizedBox(height: 32),
                    PopularCategories(),
                  ],
                ),
              ),
             
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  // Corrected and unified buildStatCard function
  Widget buildStatCard(String iconPath, String count, String label) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            height: 36, // Adjust the size of the icon
            width: 36,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 8),
          Text(
            count, // Use the count parameter here
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(JobSyncApp());
}
