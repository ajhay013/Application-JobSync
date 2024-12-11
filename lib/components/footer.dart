import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      padding: EdgeInsets.zero,
      color: Colors.black,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            color: Colors.black87,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo and Contact Info
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/logo/jobsync_logo.png',
                          width: 50,
                        ),
                        Text(
                          'JobSync',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Call now: (319) 555-0115',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),

                // Quick Links
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quick Link',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        _FooterLink(title: 'About'),
                        _FooterLink(title: 'Contact'),
                        _FooterLink(title: 'Blog'),
                      ],
                    ),
                  ),
                ),

                // Candidate Links
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Candidate',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        _FooterLink(title: 'Browse Jobs'),
                        _FooterLink(title: 'Browse Employers'),
                        _FooterLink(title: 'Candidate Dashboard'),
                        _FooterLink(title: 'Saved Jobs'),
                      ],
                    ),
                  ),
                ),

                // Support Links
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Support',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        _FooterLink(title: 'FAQs'),
                        _FooterLink(title: 'Privacy Policy'),
                        _FooterLink(title: 'Terms & Conditions'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _FooterLink({required String title}) {
    return GestureDetector(
      onTap: () {
        // Handle link tap (You can navigate to another screen or perform any action)
        print('$title clicked');
      },
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 14, decoration: TextDecoration.none),
      ),
    );
  }
}
