import 'package:flutter/material.dart';

class PopularCategories extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.brush, 'title': 'Graphics & Design', 'positions': 357},
    {'icon': Icons.code, 'title': 'Code & Programming', 'positions': 357},
    {'icon': Icons.volume_up, 'title': 'Digital Marketing', 'positions': 357},
    {'icon': Icons.videocam, 'title': 'Video & Animation', 'positions': 357},
    {'icon': Icons.music_note, 'title': 'Music & Audio', 'positions': 357},
    {'icon': Icons.show_chart, 'title': 'Account & Finance', 'positions': 357},
    {'icon': Icons.favorite, 'title': 'Health & Care', 'positions': 357},
    {'icon': Icons.storage, 'title': 'Data Science', 'positions': 357},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Popular Categories',
            style: TextStyle(
              fontSize: 26,  // Increased font size for title
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,  // More prominent color
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          // ListView to scroll vertically through the cards
          Container(
            height: 380,  // Set a fixed height for the scrollable area
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Card(
                  elevation: 12,  // Stronger shadow for emphasis
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),  // More rounded corners
                  ),
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10),  // Margin between cards
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          category['icon'],
                          size: 60,  // Larger icon for prominence
                          color: Color(0xFF3498DB),
                        ),
                        SizedBox(height: 16),
                        Text(
                          category['title'],
                          style: TextStyle(
                            fontSize: 18,  // Larger font size for category titles
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 12),
                        Text(
                          '${category['positions']} Open positions',
                          style: TextStyle(
                            fontSize: 14,  // Increased font size for position text
                            color: Colors.grey[700],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
