import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weekstolive/screens/home.dart';

class UserDetailsScreen extends StatefulWidget {
  static String id = 'user_details';

  final String? userId;

  const UserDetailsScreen({Key? key, this.userId}) : super(key: key);

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  TextEditingController _nameController = TextEditingController();
  String? genderValue;
  String? smokeValue;
  String? drinkValue;
  DateTime? selectedDate;

  String getText() {
    if (selectedDate == null) {
      return 'Select Date';
    } else {
      return DateFormat('MM/dd/yyyy').format(selectedDate!);
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Full name',
              ),
              controller: _nameController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: DropdownButton<String>(
              hint: Text('Gender'),
              value: genderValue,
              icon: const Icon(Icons.arrow_downward),
              onChanged: (String? newValue) {
                setState(() {
                  genderValue = newValue!;
                });
              },
              items: <String>['Male', 'Female']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: TextButton(
              onPressed: () => _selectDate(context),
              child: Text(
                getText(),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: DropdownButton<String>(
              hint: Text('Do you Smoke?'),
              value: smokeValue,
              icon: const Icon(Icons.arrow_downward),
              onChanged: (String? newValue) {
                setState(() {
                  smokeValue = newValue!;
                });
              },
              items: <String>['Yes', 'No']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: DropdownButton<String>(
              hint: Text('Do you Drink?'),
              value: drinkValue,
              icon: const Icon(Icons.arrow_downward),
              onChanged: (String? newValue) {
                setState(() {
                  drinkValue = newValue!;
                });
              },
              items: <String>['Yes', 'No']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String? userId = widget.userId;

              FirebaseFirestore.instance.doc('users/$userId').set({
                'name': _nameController.text,
                'gender': genderValue,
                'dob': selectedDate,
                'smoke': smokeValue,
                'drink': drinkValue,
              });

              Navigator.pushNamedAndRemoveUntil(
                  context, HomeScreen.id, (route) => false);
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
