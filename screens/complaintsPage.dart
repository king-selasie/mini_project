import 'package:flutter/material.dart';

class ComplaintsPage extends StatefulWidget {
  @override
  _ComplaintsPageState createState() => _ComplaintsPageState();
}

class _ComplaintsPageState extends State<ComplaintsPage> {


   List<Map<String,String>> complaints = [
     {
      'title': 'Noisy Neighbors',
      'description': 'My neighbors are making a lot of noise at night.',
    },
    {
      'title': 'Internet Connection',
      'description': 'The internet connection in my room is very slow.',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaints'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    TextEditingController titleController = TextEditingController();
                    TextEditingController descriptionController = TextEditingController();

                    return AlertDialog(
                      title: const Text('Add Complaint'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: titleController,
                            decoration: const InputDecoration(labelText: 'Title'),
                          ),
                          TextField(
                            controller: descriptionController,
                            decoration: const InputDecoration(labelText: 'Description'),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            String title = titleController.text;
                            String description = descriptionController.text;
                           if (title.isNotEmpty && description.isNotEmpty) {
                              setState(() {
                                complaints.add({
                                  'title': title,
                                  'description': description,
                                });
                              });
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ],
                    );
                  },
                );
                
              },
              child: const Text('Add Complaint'),
            ),
           const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: complaints.length,
                itemBuilder: (context, index) {
                  return ComplaintCard(
                     title: complaints[index]['title']!,
                    description: complaints[index]['description']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ComplaintCard extends StatelessWidget {
  final String title;
  final String description;

  const ComplaintCard({
    required this.title,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}