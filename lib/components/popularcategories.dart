import 'package:flutter/material.dart';

class PopularCategories extends StatelessWidget {
  // Define categories as a list of maps
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
        children: [
          Text(
            'Popular Categories',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two items per row
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2.0, // Adjust aspect ratio to control the card size
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Container(
                width: 150, // Custom width for the card
                height: 120, // Custom height for the card
                child: Card(
                  elevation: 3, // Reduced elevation for a cleaner look
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Smaller radius for a more compact look
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Adjusted padding
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // Minimizes the row's size
                      children: [
                        Icon(
                          category['icon'],
                          size: 30, // Adjusted icon size for better fit
                          color: Color(0xFF3498DB),
                        ),
                        SizedBox(width: 8), // Smaller space between icon and text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min, // Ensure column shrinks to fit content
                          children: [
                            Text(
                              category['title'],
                              style: TextStyle(
                                fontSize: 14, // Adjusted font size for better fit
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${category['positions']} Open positions',
                              style: TextStyle(
                                fontSize: 12, // Adjusted font size
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
