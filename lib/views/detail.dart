// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../models/student.dart';
import 'home.dart';

class Detail extends StatelessWidget {
  final Student student;

  const Detail(this.student, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Detalles del Estudiante'),
      ),
      body: Column(
        children: [
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              margin: const EdgeInsets.all(15),
              elevation: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Column(
                  children: <Widget>[
                    FadeInImage(
                      image: NetworkImage(student.photoUrl),
                      placeholder: const AssetImage('assets/loading.gif'),
                      fit: BoxFit.cover,
                      height: 300,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text('${student.name} ${student.lastName}'),
                    )
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Text(
              student.description,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(110, 10, 110, 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              ),
              child: Row(
                children: const <Widget>[
                  Icon(
                    Icons.home_filled,
                    color: Colors.black,
                    size: 40.0,
                  ),
                  Text('Home', style: TextStyle(fontSize: 20)),
                ],
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
