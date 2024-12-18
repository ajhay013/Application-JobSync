import 'package:flutter/material.dart';
import 'package:capstone/components/applicantsidebar.dart'; // Ensure the import is correct

class Overview extends StatefulWidget {
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  bool _isSidebarVisible = false; 
  double _sidebarWidth = 250; 

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add your search action here
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Add more options here
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Main content (This should not be compressed when the sidebar appears)
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            left: _isSidebarVisible ? _sidebarWidth : 0, 
            top: 0,
            bottom: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Info Cards Section with horizontal layout
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                        children: [
                          Expanded(
                            child: _infoCard(
                              color: Color(0xFFb8e2fe),
                              icon: Icons.work,
                              count: 5,
                              title: 'Applied Jobs',
                            ),
                          ),
                          SizedBox(width: 16), 
                          Expanded(
                            child: _infoCard(
                              color: Color(0xFFffd4bb),
                              icon: Icons.bookmark_border,
                              count: 3,
                              title: 'Favorite Jobs',
                            ),
                          ),
                          SizedBox(width: 16), // Spacing between the cards
                          Expanded(
                            child: _infoCard(
                              color: Color(0xFFd7ffd4),
                              icon: Icons.notifications,
                              count: 2,
                              title: 'Job Alerts',
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),

                    // Recently Applied Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recently Applied',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF333333),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Add your navigation or action for "View All"
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          ),
                          child: Row(
                            children: [
                              Text('View All', style: TextStyle(color: Color(0xFF4b4b4b))),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward, size: 18, color: Color(0xFF4b4b4b)),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16),

                    // Applied Jobs Table Placeholder Section
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        color: Colors.grey[100],
                        child: Text('Applied Jobs Table Here'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Dark Overlay when Sidebar is visible
          if (_isSidebarVisible)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isSidebarVisible = false; // Close the sidebar when tapping outside
                  });
                },
                child: Container(
                  color: Colors.black.withOpacity(0.5), // Dark overlay
                ),
              ),
            ),

          // Sidebar
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            left: _isSidebarVisible ? 0 : -_sidebarWidth,
            top: 0,
            bottom: 0,
            width: _sidebarWidth,
            child: ApplicantsSidebar(currentRoute: '/applicants/overview'),
          ),

          // Sidebar toggle button (menu icon for opening, close icon for closing)
          Positioned(
            top: 10, // Adjusted to give space from the top
            left: 10, // Move the button to the left edge of the screen
            child: IconButton(
              icon: Icon(
                _isSidebarVisible
                    ? Icons.close // Show close icon when sidebar is visible
                    : Icons.menu, // Show hamburger menu icon when sidebar is hidden
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  _isSidebarVisible = !_isSidebarVisible; // Toggle sidebar visibility
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for the card layout
  Widget _infoCard({
    required Color color,
    required IconData icon,
    required int count,
    required String title,
  }) {
    double cardHeight = 120.0; // Fixed height for all cards

    return Container(
      margin: EdgeInsets.only(bottom: 16, top: 60), // Added top margin to space out the cards
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 4,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          height: cardHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text Info
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Added left margin to the count text
                    Padding(
                      padding: const EdgeInsets.only(left: 12), // Adjust the left margin as needed
                      child: Text(
                        '$count',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      title,
                      style: TextStyle(fontSize: 14, color: Color(0xFF2d2d2d)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // Icon
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFE7F0FA),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(8),
                child: Icon(
                  icon,
                  size: 32,
                  color: _getIconColor(color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getIconColor(Color cardColor) {
    if (cardColor == Color(0xFFb8e2fe)) {
      return Color(0xFF0A65CC);
    } else if (cardColor == Color(0xFFffd4bb)) {
      return Color(0xFFFF8616);
    } else {
      return Color(0xFF169E5D);
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: Overview(),
    routes: {
      '/applicants/overview': (context) => Overview(),
    },
  ));
}
