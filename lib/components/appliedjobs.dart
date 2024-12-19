import 'package:flutter/material.dart';
import 'applicantsidebar.dart'; // Import ApplicantsSidebar

class AppliedJobPage extends StatefulWidget {
  @override
  _AppliedJobPageState createState() => _AppliedJobPageState();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Applied Jobs')),
      drawer: ApplicantsSidebar(currentRoute: '/applicants/appliedjobs'), // Pass the current route to the sidebar
      body: Center(
        child: Text('Applied Jobs Content'),
      ),
    );
  }
}

class _AppliedJobPageState extends State<AppliedJobPage> {
  final int itemsPerPage = 5;
  int currentPage = 1;

  final List<Map<String, dynamic>> jobs = List.generate(31, (index) {
    return {
      'id': index + 1,
      'jobTitle': index % 2 == 0 ? 'Game Dev' : 'Graphic Designer',  // Alternate between Riot Games and Google
      'companyLogo': index % 2 == 0
          ? 'assets/logo/riot.png'
          : 'assets/logo/google_logo.png',  // Alternate between the two logos
      'jobType': ['Full Time', 'Temporary', 'Contract Base'][index % 3],
      'location': ['Quezon City', 'Pasig', 'Makati'][index % 3],
      'minSalary': 50000,
      'maxSalary': 80000,
      'daysRemaining': index % 5 == 0 ? 0 : 4 - (index % 5),
      'isExpired': index % 5 == 0,
    };
  });

  List<Map<String, dynamic>> get currentJobs {
    final startIndex = (currentPage - 1) * itemsPerPage;
    final endIndex = (startIndex + itemsPerPage).clamp(0, jobs.length);
    return jobs.sublist(startIndex, endIndex);
  }

  void paginate(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Applied Jobs')),
      body: Column(
        children: [
          Expanded(
            child: currentJobs.isEmpty
                ? Center(child: Text('No favorite jobs found.'))
                : ListView.builder(
                    itemCount: currentJobs.length,
                    itemBuilder: (context, index) {
                      final job = currentJobs[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: Image.asset(job['companyLogo']),
                          title: Row(
                            children: [
                              Text(job['jobTitle'], style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(width: 8),
                              Chip(
                                label: Text(job['jobType']),
                                backgroundColor: Colors.blue.shade50,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0), // Adjust the radius as needed
                                ),
                              ),
                            ],

                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${job['location']}'),
                              Text('₱${job['minSalary']} - ₱${job['maxSalary']}'),
                              if (job['isExpired'])
                                Text('Job Expired', style: TextStyle(color: Colors.red)),
                              if (!job['isExpired'])
                                Text('${job['daysRemaining']} days remaining'),
                              // Move the Apply Now button here below the job details
                              Padding(
                                padding: const EdgeInsets.only(top: 1, left: 110.0), // Add left padding to move it right
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Apply Now',
                                        style: TextStyle(color: Colors.black), // Set text color to black
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.black, // Set icon color to black
                                      ),
                                    ],

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          PaginationWidget(
            currentPage: currentPage,
            totalItems: jobs.length,
            itemsPerPage: itemsPerPage,
            onPageChanged: paginate,
          ),
        ],
      ),
    );
  }
}

class PaginationWidget extends StatelessWidget {
  final int currentPage;
  final int totalItems;
  final int itemsPerPage;
  final Function(int) onPageChanged;

  const PaginationWidget({
    required this.currentPage,
    required this.totalItems,
    required this.itemsPerPage,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final totalPages = (totalItems / itemsPerPage).ceil();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        final pageNumber = index + 1;
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: GestureDetector(
            onTap: () => onPageChanged(pageNumber),
            child: CircleAvatar(
              backgroundColor: pageNumber == currentPage ? Colors.blue : Colors.grey.shade300,
              child: Text(
                '$pageNumber',
                style: TextStyle(
                  color: pageNumber == currentPage ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AppliedJobPage(),
  ));
}
