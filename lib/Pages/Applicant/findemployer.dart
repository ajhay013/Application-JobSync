import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';  

class FindEmployer extends StatefulWidget {
  @override
  _FindEmployerState createState() => _FindEmployerState();
}

class _FindEmployerState extends State<FindEmployer> {
  TextEditingController jobSearchController = TextEditingController();
  TextEditingController locationSearchController = TextEditingController();

  // Sample data to avoid fetching from the network
  List companies = [
    {
      'id': 1,
      'logo': 'assets/logo/google_logo.png',
      'company_name': 'Riot Games',
      'city': 'New York',
      'job_post_count': 5
    },
    {
      'id': 2,
      'logo': 'assets/logo/riot.png',
      'company_name': 'Riot Games',
      'city': 'Los Angeles',
      'job_post_count': 3
    },
    {
      'id': 3,
      'logo': 'assets/logo/riot.png',
      'company_name': 'Riot Games',
      'city': 'San Francisco',
      'job_post_count': 2
    },
    {
      'id': 4,
      'logo': 'assets/logo/riot.png',
      'company_name': 'Epic Games',
      'city': 'Austin',
      'job_post_count': 4
    },
    {
      'id': 5,
      'logo': 'assets/logo/riot.png',
      'company_name': 'Activision Blizzard',
      'city': 'Los Angeles',
      'job_post_count': 6
    },
    {
      'id': 6,
      'logo': 'assets/logo/riot.png',
      'company_name': 'Ubisoft',
      'city': 'Montreal',
      'job_post_count': 7
    },
    {
      'id': 7,
      'logo': 'assets/logo/riot.png',
      'company_name': 'Valve',
      'city': 'Bellevue',
      'job_post_count': 5
    },
    {
      'id': 8,
      'logo': 'assets/logo/riot.png',
      'company_name': 'Concentrix',
      'city': 'Santa Monica',
      'job_post_count': 4
    },
    {
      'id': 9,
      'logo': 'assets/logo/riot.png',
      'company_name': 'Square Enix',
      'city': 'Tokyo',
      'job_post_count': 3
    },
    {
      'id': 10,
      'logo': 'assets/logo/riot.png',
      'company_name': 'Bethesda Softworks',
      'city': 'Rockville',
      'job_post_count': 5
    }
  ];

  List<String> industries = ['Technology', 'Gaming', 'Software', 'Finance', 'Design'];
  bool isLoading = false;
  String error = "";
  int currentPage = 1;
  int itemsPerPage = 12;
  ScrollController _scrollController = ScrollController();

  // Store active filters in a list
  List<Map<String, String>> activeFilters = [];

  void handleSearch() {
    print("Searching for jobs: ${jobSearchController.text} in location: ${locationSearchController.text}");
  }

  List get paginatedCompanies {
    final startIndex = (currentPage - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;
    return companies.sublist(startIndex, endIndex < companies.length ? endIndex : companies.length);
  }

  void paginate(int pageNumber) {
    setState(() {
      currentPage = pageNumber;
    });
  }

  // Clear search fields and dismiss keyboard
  void clearSearch(TextEditingController controller) {
    controller.clear();
    FocusScope.of(context).unfocus();  // Dismiss the keyboard
  }

  // Show filter modal with dropdown for industry
  void showIndustryFilter() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Add space before the title
              SizedBox(height: 16), // Space above the "Select Industry" title
              Text(
                'Select Industry',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8), // Space between title and dropdown

              // Dropdown for selecting industry
              DropdownButtonFormField<String>(
                value: null, // To show the placeholder when nothing is selected
                hint: Text('Select an Industry'), // Placeholder text
                onChanged: (newValue) {
                  setState(() {
                    // Add the selected filter to the activeFilters list
                    if (newValue != null) {
                      activeFilters.add({
                        'type': 'Industry',
                        'value': newValue,
                      });
                    }
                  });
                  Navigator.pop(context); // Close modal after selection
                },
                items: industries.map((industry) {
                  return DropdownMenuItem<String>(
                    value: industry,
                    child: Text(industry),
                  );
                }).toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16), // Add some padding at the bottom
            ],
          ),
        );
      },
    );
  }

  // Remove a specific filter
  void removeFilter(Map<String, String> filter) {
    setState(() {
      activeFilters.remove(filter); // Remove the filter from the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Employer"),
        actions: [
          // Filter icon aligned to the top-right of the AppBar
          IconButton(
            icon: Icon(FontAwesomeIcons.filter),
            onPressed: showIndustryFilter, // Show modal when clicked
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Input Fields
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: jobSearchController,
                    decoration: InputDecoration(
                      labelText: 'Job title, keyword, company',
                      prefixIcon: Icon(FontAwesomeIcons.search),  // FontAwesome icon for search
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),  // Rounded corners
                      ),
                    ),
                    onChanged: (text) {
                      setState(() {}); // Trigger filtering when the user types
                    },
                  ),
                ),
                SizedBox(width: 8),
                // Location Search Field
                Expanded(
                  child: TextField(
                    controller: locationSearchController,
                    decoration: InputDecoration(
                      labelText: 'City, state, or zip code',
                      prefixIcon: Icon(FontAwesomeIcons.mapMarkerAlt),  // FontAwesome icon for location
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),  // Rounded corners
                      ),
                    ),
                    onChanged: (text) {
                      setState(() {}); // Trigger filtering when the user types
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Active Filters UI
            if (activeFilters.isNotEmpty)
              Wrap(
                spacing: 8,
                children: activeFilters.map((filter) {
                  return Chip(
                    label: Text('${filter['type']}: ${filter['value']}'),
                    deleteIcon: Icon(Icons.close),
                    onDeleted: () => removeFilter(filter),
                    backgroundColor: Colors.grey[300],
                  );
                }).toList(),
              ),

            // Loading State (removed the fetching part, keeping the UI structure)
            if (isLoading)
              Center(child: CircularProgressIndicator()),

            // Error Message
            if (error.isNotEmpty)
              Center(child: Text(error, style: TextStyle(color: Colors.red))),

            // Companies List
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: paginatedCompanies.length,
                itemBuilder: (context, index) {
                  var company = paginatedCompanies[index];
                  return GestureDetector(
                    onTap: () {
                      print("Employer ID clicked: ${company['id']}");
                    },
                    child: Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Company Logo and Information
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(company['logo']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Company Name and Job Title Row
                                      Row(
                                        children: [
                                          Text(
                                            company['company_name'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          // Featured Badge
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 3,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Text(
                                              'Featured',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          // Bookmark Icon next to the job title
                                          IconButton(
                                            icon: Icon(FontAwesomeIcons.bookmark),
                                            onPressed: () {
                                              print('Bookmark clicked for ${company['company_name']}');
                                            },
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      // City Information moved below the job title
                                      Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.mapMarkerAlt,
                                            size: 14,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            company['city'],
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text('Open Positions: ${company['job_post_count']}'),
                            ElevatedButton(
                              onPressed: () {
                                print("Navigate to employer details");
                              },
                              child: Text("Open Position"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Pagination
            Pagination(
              currentPage: currentPage,
              itemsPerPage: itemsPerPage,
              totalItems: companies.length,
              onPageChanged: paginate,
            ),
          ],
        ),
      ),
    );
  }
}

class Pagination extends StatelessWidget {
  final int currentPage;
  final int itemsPerPage;
  final int totalItems;
  final Function(int) onPageChanged;

  Pagination({
    required this.currentPage,
    required this.itemsPerPage,
    required this.totalItems,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final totalPages = (totalItems / itemsPerPage).ceil();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        int pageNumber = index + 1;
        return IconButton(
          icon: Text('$pageNumber'),
          onPressed: () => onPageChanged(pageNumber),
        );
      }),
    );
  }
}
