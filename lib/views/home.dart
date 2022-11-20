// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import '../models/student.dart';
import 'detail.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<Student> students = [];

  void generateDataFake() {
    var faker = Faker();

    var descriptionFake = '';
    faker.lorem.sentences(10).forEach((element) {
      descriptionFake += '$element ';
    });

    for (int i = 0; i < 10; i++) {
      students.add(Student(
          name: faker.person.name(),
          lastName: faker.person.lastName(),
          email: faker.internet.email(),
          country: faker.address.country(),
          description: descriptionFake,
          photoUrl: faker.image.image(
              keywords: ['person', 'male', 'female', 'student'],
              random: true)));
    }
  }

  @override
  Widget build(BuildContext context) {
    generateDataFake();
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Alex Santacruz - 8vo A'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          Student student = students[index];
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(10),
            elevation: 10,
            child: Column(
              children: <Widget>[
                ListTile(
                  contentPadding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  title: Text('${student.name} ${student.lastName}'),
                  subtitle: Text(student.country),
                  leading: const Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 50.0,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Detail(student)));
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 0, 20, 10),
                      child: Text(student.email),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
