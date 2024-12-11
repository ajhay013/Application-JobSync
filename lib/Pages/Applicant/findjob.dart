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
        {'title': 'Software Developer', 'company': 'Company A'},
        {'title': 'Data Scientist', 'company': 'Company B'},
        // Add more job data here
      ];
    });
  }

  void handleFilter() {
    setState(() {
      showFilter = !showFilter;
    });
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
      appBar: AppBar(title: Text('Find Jobs')),
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
                      border: OutlineInputBorder(),
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
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (text) {
                      setState(() {}); // Trigger filtering when the user types
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Filter and Find Job Buttons
            Row(
              children: [
                ElevatedButton(
                  onPressed: handleFilter,
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.filter),
                      SizedBox(width: 8),
                      Text('Filter'),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Handle find job functionality
                  },
                  child: Text('Find Job'),
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
    );
  }).toList(),
),

            // Filter Dialog
            if (showFilter)
              FilterDialog(
                activeFilters: activeFilters,
                removeFilter: removeFilter,
                handleIndustryChange: handleIndustryChange,
                handleJobTypeChange: handleJobTypeChange,
                handleSalaryRangeChange: handleSalaryRangeChange,
                presetRanges: presetRanges,
                industry: industry,
                jobType: jobType,
                salaryRange: salaryRange,
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
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(job['title']!),
        subtitle: Text(job['company']!),
      ),
    );
  }
}

class FilterDialog extends StatelessWidget {
  final List<Map<String, String>> activeFilters;
  final Function removeFilter;
  final Function handleIndustryChange;
  final Function handleJobTypeChange;
  final Function handleSalaryRangeChange;
  final List<Map<String, dynamic>> presetRanges;
  final String industry;
  final String jobType;
  final List<int> salaryRange;

  FilterDialog({
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
    return AlertDialog(
      title: Text('Filters'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Industry Dropdown
          DropdownButton<String>(
            value: industry,
            onChanged: (value) => handleIndustryChange(value!),
            items: ['Business', 'Tech', 'Finance'].map((e) {
              return DropdownMenuItem(child: Text(e), value: e);
            }).toList(),
          ),

          // Job Type Dropdown
          DropdownButton<String>(
            value: jobType,
            onChanged: (value) => handleJobTypeChange(value!),
            items: ['Full Time', 'Part Time', 'Contract'].map((e) {
              return DropdownMenuItem(child: Text(e), value: e);
            }).toList(),
          ),

          // Salary Range Options
          Column(
            children: presetRanges.map((range) {
              final label = range['label'];
              final salaryRange = range['range'] as List<int>;
              return ListTile(
                title: Text(label),
                onTap: () => handleSalaryRangeChange(salaryRange),
              );
            }).toList(),
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('Close')),
      ],
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
