import 'package:flutter/material.dart';


class Student {
  final String name;
  final String email;
  final String phoneNumber;

  Student({required this.name, required this.email, required this.phoneNumber});
}

class ManageStudents extends StatefulWidget {
  const ManageStudents({Key? key}) : super(key: key);

  @override
  State<ManageStudents> createState() => _ManageStudentsState();
}

class _ManageStudentsState extends State<ManageStudents> {
  
  List<Student> students = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Students'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return GestureDetector(
            onTap: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditStudentDetailsPage(student: student),
                ),
              ).then((editedStudent) {
                
                if (editedStudent != null) {
                  setState(() {
                    students[index] = editedStudent;
                  });
                }
              });
            },
            child: ListTile(
              title: Text(student.name),
              subtitle: Text(student.email),
            ),
          );
        },
      ),
    );
  }
}

class EditStudentDetailsPage extends StatefulWidget {
  final Student student;

  const EditStudentDetailsPage({required this.student, Key? key}) : super(key: key);

  @override
  State<EditStudentDetailsPage> createState() => _EditStudentDetailsPageState();
}

class _EditStudentDetailsPageState extends State<EditStudentDetailsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    
    _nameController.text = widget.student.name;
    _emailController.text = widget.student.email;
    _phoneController.text = widget.student.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Student Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            ElevatedButton(
              onPressed: () {
                
                Navigator.pop(
                  context,
                  Student(
                    name: _nameController.text,
                    email: _emailController.text,
                    phoneNumber: _phoneController.text,
                  ),
                );
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
