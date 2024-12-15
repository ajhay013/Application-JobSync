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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2.5,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          category['icon'],
                          size: 30,
                          color: Color(0xFF3498DB),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                category['title'],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '${category['positions']} Open positions',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
