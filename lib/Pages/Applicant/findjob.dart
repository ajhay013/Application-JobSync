import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FindJob extends StatefulWidget {
  @override
  _FindJobState createState() => _FindJobState();
}

class _FindJobState extends State<FindJob> {
  final TextEditingController jobSearchController = TextEditingController();
  final TextEditingController locationSearchController = TextEditingController();

  bool showFilter = false;
  String industry = 'Business';
  String jobType = 'Full Time';
  List<int> salaryRange = [70000, 120000];
  String selectedSalaryRange = '';
  List<Map<String, String>> activeFilters = [];

  final List<Map<String, dynamic>> presetRanges = [
    {'label': '₱10 - ₱100', 'range': [10, 100]},
    {'label': '₱100 - ₱1,000', 'range': [100, 1000]},
    {'label': '₱1,000 - ₱10,000', 'range': [1000, 10000]},
    {'label': '₱10,000 - ₱100,000', 'range': [10000, 100000]},
    {'label': '₱100,000 Up', 'range': [100000, 200000]},
    {'label': 'Custom', 'range': [70000, 120000]},
  ];

  List<Map<String, String>> jobs = []; // This should be fetched from the API

  int currentPage = 1;
  int itemsPerPage = 12;


  @override
  void initState() {
    super.initState();
    fetchJobs();  // Fetch the jobs from API when component is initialized
  }

 void fetchJobs() async {
    // Simulate an API call to fetch jobs.
    setState(() {
      jobs = [
        {'title': 'Software Developer', 'company': 'Google Inc.', 'type': 'Full Time', 'salary': '₱100,000', 'location': 'Metro Manila'},
        {'title': 'Data Scientist', 'company': 'Google Inc.', 'type': 'Part Time', 'salary': '₱40,000', 'location': 'Quezon City'},
        {'title': 'Product Manager', 'company': 'Google Inc.', 'type': 'Internship', 'salary': '₱15,000', 'location': 'Makati'},
        {'title': 'Marketing Specialist', 'company': 'Google Inc.', 'type': 'Full Time', 'salary': '₱50,000', 'location': 'Taguig'},
        {'title': 'UI/UX Designer', 'company': 'Google Inc.', 'type': 'Part Time', 'salary': '₱30,000', 'location': 'Pasig'},
      ];
    });
  }

  void handleFilter() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return FilterModal(
          activeFilters: activeFilters,
          removeFilter: removeFilter,
          handleIndustryChange: handleIndustryChange,
          handleJobTypeChange: handleJobTypeChange,
          handleSalaryRangeChange: handleSalaryRangeChange,
          presetRanges: presetRanges,
          industry: industry,
          jobType: jobType,
          salaryRange: salaryRange,
        );
      },
    );
  }

  void handleJobTypeChange(String type) {
    setState(() {
      jobType = type;
      updateActiveFilters('Job Type', type);
    });
  }

  void handleSalaryRangeChange(List<int> range) {
    setState(() {
      salaryRange = range;
      updateActiveFilters('Salary Range', '₱${range[0]} - ₱${range[1]}');
    });
  }

  void handleIndustryChange(String industryValue) {
    setState(() {
      industry = industryValue;
      updateActiveFilters('Industry', industryValue);
    });
  }

  void updateActiveFilters(String type, String value) {
    final existingFilter = activeFilters.indexWhere((filter) => filter['type'] == type);
    if (existingFilter != -1) {
      activeFilters[existingFilter]['value'] = value;
    } else {
      activeFilters.add({'type': type, 'value': value});
    }
  }

  void removeFilter(Map<String, String> filterToRemove) {
    setState(() {
      activeFilters.removeWhere((filter) =>
          filter['type'] == filterToRemove['type'] &&
          filter['value'] == filterToRemove['value']);
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredJobs = jobs.where((job) {
      final jobTitleMatches = job['title']!.toLowerCase().contains(jobSearchController.text.toLowerCase());
      final locationMatches = job['company']!.toLowerCase().contains(locationSearchController.text.toLowerCase());
      return jobTitleMatches && locationMatches;
    }).toList();

    final currentJobs = filteredJobs.skip((currentPage - 1) * itemsPerPage).take(itemsPerPage).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Find Jobs'),
        actions: [
          // Filter button at the top right
          IconButton(
            icon: Icon(FontAwesomeIcons.filter),
            onPressed: handleFilter,  // Open the filter modal
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Job Search and Location Inputs
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: jobSearchController,
                    decoration: InputDecoration(
                      labelText: 'Job title, keyword, company',
                      prefixIcon: Icon(FontAwesomeIcons.search),
                      border: OutlineInputBorder( borderRadius: BorderRadius.circular(20),
                      ),
                      
                    ),
                    onChanged: (text) {
                      setState(() {}); // Trigger filtering when the user types
                    },
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: locationSearchController,
                    decoration: InputDecoration(
                      labelText: 'City, state, or zip code',
                      prefixIcon: Icon(FontAwesomeIcons.mapMarkerAlt),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
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

            // Job Cards Display
            if (currentJobs.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: currentJobs.length,
                  itemBuilder: (context, index) {
                    final job = currentJobs[index];
                    return JobCard(job: job);
                  },
                ),
              )
            else
              Center(child: Text('No jobs match your search criteria.')),

            // Pagination
            Pagination(
              currentPage: currentPage,
              itemsPerPage: itemsPerPage,
              totalItems: filteredJobs.length,
              onPageChanged: (page) {
                setState(() {
                  currentPage = page;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final Map<String, String> job;

  JobCard({required this.job});

  @override
  Widget build(BuildContext context) {
    // Define colors for each job type
    Color jobTypeColor = Colors.grey;  // Default color
    String jobTypeText = job['type'] ?? 'Full Time';

    if (jobTypeText == 'Full Time') {
      jobTypeColor = Colors.green;
    } else if (jobTypeText == 'Part Time') {
      jobTypeColor = Colors.orange;
    } else if (jobTypeText == 'Internship') {
      jobTypeColor = Colors.blue;
    }

    return Card(
      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            // Main content area (job details)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Job title and bookmark icon in a row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Job title
                    Text(
                      job['title']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    // Bookmark Icon aligned to the top-right
                    IconButton(
                      icon: Icon(FontAwesomeIcons.bookmark),
                      onPressed: () {
                        // Add your bookmarking functionality here
                      },
                    ),
                  ],
                ),
                SizedBox(height: 8),

                // Job Type and Salary in a row, placed close to each other
                Row(
                  children: [
                    // Job Type with color
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 1),
                      decoration: BoxDecoration(
                        color: jobTypeColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        jobTypeText,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    // Salary display
                    Text(
                      '${job['salary'] ?? '70,000'}',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),

                // Company logo and name
                Row(
                  children: [
                    // Increased company logo size
                    CircleAvatar(
                      radius: 40, // Increased from 20 to 30
                      backgroundImage: AssetImage('assets/logo/google_logo.png'),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          job['company']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        
                        Text(
                          job['location'] ?? 'Location not specified',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class FilterModal extends StatelessWidget {
  final List<Map<String, String>> activeFilters;
  final Function removeFilter;
  final Function handleIndustryChange;
  final Function handleJobTypeChange;
  final Function handleSalaryRangeChange;
  final List<Map<String, dynamic>> presetRanges;
  final String industry;
  final String jobType;
  final List<int> salaryRange;

  FilterModal({
    required this.activeFilters,
    required this.removeFilter,
    required this.handleIndustryChange,
    required this.handleJobTypeChange,
    required this.handleSalaryRangeChange,
    required this.presetRanges,
    required this.industry,
    required this.jobType,
    required this.salaryRange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           // Title for the modal aligned to the left
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Filter by',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 4),
          
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Based on your preferences',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 16),
          // Industry Filter
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Industry',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Industry Dropdown Styled as a Field
          DropdownButtonFormField<String>(
            value: industry,
            onChanged: (value) => handleIndustryChange(value!),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              filled: true,
              fillColor: Colors.grey[300],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            items: ['Business', 'Tech', 'Finance'].map((e) {
              return DropdownMenuItem(child: Text(e), value: e);
            }).toList(),
          ),
          SizedBox(height: 16),

          // Job Type Filter
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Job Type',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Job Type Dropdown Styled as a Field
          DropdownButtonFormField<String>(
            value: jobType,
            onChanged: (value) => handleJobTypeChange(value!),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              filled: true,
              fillColor: Colors.grey[300],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            items: ['Full Time', 'Part Time', 'Contract'].map((e) {
              return DropdownMenuItem(child: Text(e), value: e);
            }).toList(),
          ),
          SizedBox(height: 16),

          // Salary Range Filter (Updated to Dropdown Styled as a Field)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Salary Range',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Salary Range Dropdown Styled as a Field
          DropdownButtonFormField<List<int>>(
          value: presetRanges.firstWhere((range) => 
          range['range'] == salaryRange, orElse: () => presetRanges[0])['range'],
          onChanged: (value) => handleSalaryRangeChange(value!),
          decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          filled: true,
          fillColor: Colors.grey[300],
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
            ),
          ),
          items: presetRanges.map((range) {
          final label = range['label'];
          final salaryRange = range['range'] as List<int>;
          return DropdownMenuItem<List<int>>(
          value: salaryRange,
          child: Text(label!),
              );
            }).toList(),
          ),

        ],
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
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: currentPage > 1
              ? () => onPageChanged(currentPage - 1)
              : null,
        ),
        Text('$currentPage of $totalPages'),
        IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: currentPage < totalPages
              ? () => onPageChanged(currentPage + 1)
              : null,
        ),
      ],
    );
  }
}
