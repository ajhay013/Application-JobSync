import 'package:flutter/material.dart';

class FavoriteJobPage extends StatefulWidget {
  @override
  _FavoriteJobPageState createState() => _FavoriteJobPageState();
}

class _FavoriteJobPageState extends State<FavoriteJobPage> {
  final int itemsPerPage = 5;
  int currentPage = 1;

  final List<Map<String, dynamic>> jobs = List.generate(31, (index) {
    return {
      'id': index + 1,
      'jobTitle': 'Job Title $index',
      'companyLogo': 'https://via.placeholder.com/50',
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
      appBar: AppBar(title: Text('Favorite Jobs')),
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
                          leading: Image.network(job['companyLogo']),
                          title: Row(
                            children: [
                              Text(job['jobTitle'], style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(width: 8),
                              Chip(
                                label: Text(job['jobType']),
                                backgroundColor: Colors.blue.shade50,
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
                            ],
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Apply Now'),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
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
    home: FavoriteJobPage(),
  ));
}
