import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestForm extends StatefulWidget {
  const TestForm({super.key});

  @override
  State<TestForm> createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  TextEditingController collectdata = TextEditingController();
  void _saveData() async{
    await FirebaseFirestore.instance.collection('users').add({
      "name":collectdata.text
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: collectdata,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )
              ),
            ),
          ),
          ElevatedButton(onPressed:_saveData, child: Text("Submit"))
        ],
      ),
    );
  }
}