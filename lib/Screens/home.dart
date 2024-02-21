// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, override_on_non_overriding_member, unused_field, prefer_final_fields, annotate_overrides, unused_element, avoid_print, unused_local_variable, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, sort_child_properties_last, curly_braces_in_flow_control_structures, non_constant_identifier_names, sized_box_for_whitespace

import 'dart:convert';
import 'dart:ffi';
import 'package:form_test/Models/subject.dart';
import 'package:form_test/Components/textModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// import 'package:test_form/Model/subject.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final _formKey = GlobalKey<FormState>();

  String? _firstName;
  String? _lastName;
  double? _gpa;
  int? _level;
  int? _semester;
  String? _department;
  List<String> _passedCourses = [];

  List<Subject> _semesterSubjects_IT = [
    Subject('CS121', 'Subject 1 of Semester 1'),
    Subject('HUM111', 'Subject 2 of Semester 1'),
    Subject('HUM132', 'Subject 3 of Semester 1'),
    Subject('MATH101', 'Subject 4333333333 of Semester 1'),
    Subject('PHYS101', 'Subject 5 of Semester 1'),
    Subject('PHYS103', 'Subject 6 of Semester 1'),
    Subject('CS101', 'Subject 1 of Semester 2'),
    Subject('CS141', 'Subject 2 of Semester 2'),
    Subject('HUM112', 'Subject 3 of Semester 2'),
    Subject('HUM121', 'Subject 4 of Semester 2'),
    Subject('HUM141', 'Subject 5 of Semester 2'),
    Subject('MATH102', 'Subject 6 of Semester 2'),
    Subject('CS241', 'Subject 1 of Semester 3'),
    Subject('HUM231', 'Subject 2 of Semester 3'),
    Subject('IS201', 'Subject 3 of Semester 3'),
    Subject('IS231', 'Subject 4 of Semester 3'),
    Subject('IT251', 'Subject 5 of Semester 3'),
    Subject('MATH201', 'Subject 633333333333 of Semester 3'),
    Subject('AI201', 'Subject 1 of Semester 4'),
    Subject('CS211', 'Subject 2 of Semester 4'),
    Subject('IS212', 'Subject 3 of Semester 4'),
    Subject('IS221', 'Subject 4 of Semester 4'),
    Subject('IT271', 'Subject 5 of Semester 4'),
    Subject('MATH202', 'Subject 6 of Semester 4'),
    Subject('CS352', 'Subject 1 of Semester 5'),
    Subject('CS361', 'Subject 2 of Semester 5'),
    Subject('CS381', 'Subject 3 of Semester 5'),
    Subject('IT351', 'Subject 4 of Semester 5'),
    Subject('PHYS104', 'Subject 5 of Semester 5'),
    Subject('SE301', 'Subject 6 of Semester 5'),
    Subject('CS322', 'Subject 1 of Semester 6'),
    Subject('IS322', 'Subject 2 of Semester 6'),
    Subject('MATH301', 'Subject 3 of Semester 6'),
    Subject('IT311', 'Subject 4 of Semester 6'),
    Subject('IT331', 'Subject 5 of Semester 6'),
    Subject('IT452', 'Subject 6 of Semester 6'),
    Subject('CS452', 'Subject 1 of Semester 7'),
    Subject('CS461', 'Subject 2 of Semester 7'),
    Subject('IT431', 'Subject 3 of Semester 7'),
    Subject('IT461', 'Subject 4 of Semester 7'),
    Subject('IT441', 'Subject 5 of Semester 7'),
    Subject('IT451', 'Subject 6 of Semester 7'),
    Subject('IT432', 'Subject 1 of Semester 8'),
    Subject('CS431', 'Subject 2 of Semester 8'),
    Subject('CS451', 'Subject 3 of Semester 8'),
    Subject('IT462', 'Subject 4 of Semester 8'),
    Subject('IT471', 'Subject 5 of Semester 8'),
    Subject('IT411', 'Subject 6 of Semester 8'),
  ];
  List<Subject> _semesterSubjects_CS = [
    Subject('CS121', 'Subject 1 of Semester 1'),
    Subject('HUM111', 'Subject 2 of Semester 1'),
    Subject('HUM132', 'Subject 3 of Semester 1'),
    Subject('MATH101', 'Subject 4 of Semester 1'),
    Subject('PHYS101', 'Subject 5 of Semester 1'),
    Subject('PHYS103', 'Subject 6 of Semester 1'),
    Subject('CS101', 'Subject 1 of Semester 2'),
    Subject('CS141', 'Subject 2 of Semester 2'),
    Subject('HUM112', 'Subject 3 of Semester 2'),
    Subject('HUM121', 'Subject 4 of Semester 2'),
    Subject('HUM141', 'Subject 5 of Semester 2'),
    Subject('MATH102', 'Subject 6 of Semester 2'),
    Subject('CS241', 'Subject 1 of Semester 3'),
    Subject('HUM231', 'Subject 2 of Semester 3'),
    Subject('IS201', 'Subject 3 of Semester 3'),
    Subject('IS231', 'Subject 4 of Semester 3'),
    Subject('IT251', 'Subject 5 of Semester 3'),
    Subject('MATH201', 'Subject 6 of Semester 3'),
    Subject('AI201', 'Subject 1 of Semester 4'),
    Subject('CS211', 'Subject 2 of Semester 4'),
    Subject('IS212', 'Subject 3 of Semester 4'),
    Subject('IS221', 'Subject 4 of Semester 4'),
    Subject('IT271', 'Subject 5 of Semester 4'),
    Subject('MATH202', 'Subject 6 of Semester 4'),
    Subject('CS352', 'Subject 1 of Semester 5'),
    Subject('CS361', 'Subject 2 of Semester 5'),
    Subject('CS381', 'Subject 3 of Semester 5'),
    Subject('IT351', 'Subject 4 of Semester 5'),
    Subject('PHYS104', 'Subject 5 of Semester 5'),
    Subject('SE301', 'Subject 6 of Semester 5'),
    Subject('CS322', 'Subject 1 of Semester 6'),
    Subject('IS322', 'Subject 2 of Semester 6'),
    Subject('MATH301', 'Subject 3 of Semester 6'),
    Subject('IS414', 'Subject 4 of Semester 6'),
    Subject('CS342', 'Subject 5 of Semester 6'),
    Subject('CS311', 'Subject 6 of Semester 6'),
    Subject('CS452', 'Subject 1 of Semester 7'),
    Subject('CS461', 'Subject 2 of Semester 7'),
    Subject('IT431', 'Subject 3 of Semester 7'),
    Subject('IT461', 'Subject 4 of Semester 7'),
    Subject('CS421', 'Subject 5 of Semester 7'),
    Subject('CS441', 'Subject 6 of Semester 7'),
    Subject('IT432', 'Subject 1 of Semester 8'),
    Subject('CS431', 'Subject 2 of Semester 8'),
    Subject('CS451', 'Subject 3 of Semester 8'),
    Subject('IT462', 'Subject 4 of Semester 8'),
    Subject('CS471', 'Subject 5 of Semester 8'),
    Subject('CS462', 'Subject 6 of Semester 8'),
  ];
  List<Subject> _semesterSubjects_General = [
    Subject('CS121', 'Subject 1 of Semester 1'),
    Subject('HUM111', 'Subject 2 of Semester 1'),
    Subject('HUM132', 'Subject 3 of Semester 1'),
    Subject('MATH101', 'Subject 4 of Semester 1'),
    Subject('PHYS101', 'Subject 5 of Semester 1'),
    Subject('PHYS103', 'Subject 6 of Semester 1'),
    Subject('CS101', 'Subject 1 of Semester 2'),
    Subject('CS141', 'Subject 2 of Semester 2'),
    Subject('HUM112', 'Subject 3 of Semester 2'),
    Subject('HUM121', 'Subject 4 of Semester 2'),
    Subject('HUM141', 'Subject 5 of Semester 2'),
    Subject('MATH102', 'Subject 6 of Semester 2'),
    Subject('CS241', 'Subject 1 of Semester 3'),
    Subject('HUM231', 'Subject 2 of Semester 3'),
    Subject('IS201', 'Subject 3 of Semester 3'),
    Subject('IS231', 'Subject 4 of Semester 3'),
    Subject('IT251', 'Subject 5 of Semester 3'),
    Subject('MATH201', 'Subject 6 of Semester 3'),
    Subject('AI201', 'Subject 1 of Semester 4'),
    Subject('CS211', 'Subject 2 of Semester 4'),
    Subject('IS212', 'Subject 3 of Semester 4'),
    Subject('IS221', 'Subject 4 of Semester 4'),
    Subject('IT271', 'Subject 5 of Semester 4'),
    Subject('MATH202', 'Subject 6 of Semester 4'),
    Subject('CS352', 'Subject 1 of Semester 5'),
    Subject('CS361', 'Subject 2 of Semester 5'),
    Subject('CS381', 'Subject 3 of Semester 5'),
    Subject('IT351', 'Subject 4 of Semester 5'),
    Subject('PHYS104', 'Subject 5 of Semester 5'),
    Subject('SE301', 'Subject 6 of Semester 5'),
    Subject('CS322', 'Subject 1 of Semester 6'),
    Subject('IS322', 'Subject 2 of Semester 6'),
    Subject('MATH301', 'Subject 3 of Semester 6'),
  ];
  List<Subject> newList = [];
  List<Subject> getList() {
    if (_department == 'IT') {
      newList = _semesterSubjects_IT;
    } else if (_department == 'CS') {
      newList = _semesterSubjects_CS;
    } else {
      newList = _semesterSubjects_General;
    }
    return newList;
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Prepare the data to send to the API
      Map<String, dynamic> requestData = {
        'firstName': _firstName,
        'lastName': _lastName,
        'level': _level,
        'semester': _semester,
        'gpa': _gpa,
        'department': _department,
        'passedCourses':
            _passedCourses.map((courseId) => {'courseId': courseId}).toList(),
      };

      // Convert the requestData to JSON
      String jsonData = json.encode(requestData);

      // Send the requestData to the API using the POST method
      try {
        var response = await http.post(
          Uri.parse('https://your-api-endpoint.com/submit-form'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonData,
        );
        if (response.statusCode == 200) {
          print('Form submitted successfully!');
        } else {
          print('Failed to submit form. Error: ${response.statusCode}');
        }
      } catch (error) {
        print('Error sending form data: $error');
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: Center(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            width: 700,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: TextModel(
                      text: 'Academic Advisor',
                      FontSize: 30,
                      color: Colors.blueGrey.shade800),
                ),
                Text(
                  'First Name *',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Jomolhari',
                      fontSize: 22,
                      color: Colors.blueGrey[800]),
                ),
                Expanded(
                  // flex:2,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(
                          fontFamily: 'Jomolhari',
                          fontSize: 15,
                          color: Colors.blueGrey[800]),
                      hintText: 'First Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _firstName = value!;
                    },
                  ),
                ),
                Text(
                  'Last Name *',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Jomolhari',
                      fontSize: 22,
                      color: Colors.blueGrey[800]),
                ),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Last Name',
                      hintStyle: TextStyle(
                          fontFamily: 'Jomolhari',
                          fontSize: 15,
                          color: Colors.blueGrey[800]),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _lastName = value!;
                    },
                  ),
                ),
                Text(
                  'GPA *',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Jomolhari',
                      fontSize: 22,
                      color: Colors.blueGrey[800]),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'GPA',
                      hintStyle: TextStyle(
                          fontFamily: 'Jomolhari',
                          fontSize: 15,
                          color: Colors.blueGrey[800]),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your GPA';
                      }
                      double? gpa = double.tryParse(value);
                      if (gpa == null || gpa < 0 || gpa > 4) {
                        return 'Please enter a valid GPA between 0 and 4';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _gpa = double.parse(value!);
                    },
                  ),
                ),
                Text(
                  'Level *',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Jomolhari',
                      fontSize: 22,
                      color: Colors.blueGrey[800]),
                ),
                Expanded(
                  child: DropdownButtonFormField<int>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Level',
                      hintStyle: TextStyle(
                          fontFamily: 'Jomolhari',
                          fontSize: 15,
                          color: Colors.blueGrey[800]),
                    ),
                    value: _level,
                    items: [
                      DropdownMenuItem<int>(
                        value: 1,
                        child: Text('First'),
                      ),
                      DropdownMenuItem<int>(
                        value: 2,
                        child: Text('Second'),
                      ),
                      DropdownMenuItem<int>(
                        value: 3,
                        child: Text('Third'),
                      ),
                      DropdownMenuItem<int>(
                        value: 4,
                        child: Text('Fourth'),
                      ),
                    ],
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter your level';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _level = value!;
                      });
                    },
                    onSaved: (value) {
                      _level = value!;
                    },
                  ),
                ),
                Text(
                  'Semester *',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Jomolhari',
                      fontSize: 22,
                      color: Colors.blueGrey[800]),
                ),
                Expanded(
                  child: DropdownButtonFormField<int>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Semester',
                      hintStyle: TextStyle(
                          fontFamily: 'Jomolhari',
                          fontSize: 15,
                          color: Colors.blueGrey[800]),
                    ),
                    value: _semester,
                    items: [
                      DropdownMenuItem<int>(
                        value: 0,
                        child: Text('New Student'),
                      ),
                      DropdownMenuItem<int>(
                        value: 1,
                        child: Text('First Semester'),
                      ),
                      DropdownMenuItem<int>(
                        value: 2,
                        child: Text('Second Semester'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _semester = value!;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter your semester';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _semester = value!;
                    },
                  ),
                ),
                Text(
                  'Department *',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Jomolhari',
                      fontSize: 22,
                      color: Colors.blueGrey[800]),
                ),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Department',
                      hintStyle: TextStyle(
                          fontFamily: 'Jomolhari',
                          fontSize: 15,
                          color: Colors.blueGrey[800]),
                    ),
                    value: _department,
                    items: [
                      DropdownMenuItem<String>(
                        value: 'General',
                        child: Text('General'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'IT',
                        child: Text('IT'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'CS',
                        child: Text('CS'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _department = value!;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter your department';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _department = value!;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Please Select the Subjects that you passed',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Jomolhari',
                          fontSize: 25,
                          color: Colors.blueGrey[800]),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder:
                                  (BuildContext context, StateSetter setState) {
                                return Dialog(
                                  backgroundColor: Colors.blueGrey[800],
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 16),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Select the subjects',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Jomolhari',
                                                fontSize: 35),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            width: 500,
                                            child: ListView.builder(
                                              itemCount: _department != null
                                                  ? getList().length
                                                  : 1,
                                              shrinkWrap: true,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                if (_department == null) {
                                                  return Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Please select the department first',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: 'Jomolhari',
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  Subject subject =
                                                      getList()[index];

                                                  bool isMath1Selected =
                                                      _passedCourses
                                                          .contains('MATH101');
                                                  bool isEng1Selected =
                                                      _passedCourses
                                                          .contains('HUM132');
                                                  bool isSci1Selected =
                                                      _passedCourses
                                                          .contains('HUM111');

                                                  bool isMath12Disabled =
                                                      subject.id == 'MATH201' &&
                                                          !isMath1Selected;
                                                  bool isEng2Disabled =
                                                      subject.id == 'AI201' &&
                                                          !isEng1Selected;
                                                  bool isSci2Disabled =
                                                      subject.id == 'CS211' &&
                                                          !isSci1Selected;

                                                  bool isSubjectDisabled =
                                                      isMath12Disabled ||
                                                          isEng2Disabled ||
                                                          isSci2Disabled;
                                                  bool isSubjectSelected =
                                                      _passedCourses
                                                          .contains(subject.id);

                                                  return Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 8.0),
                                                    child: CheckboxListTile(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16)),
                                                      side: BorderSide(
                                                          style: BorderStyle
                                                              .solid),
                                                      hoverColor: Colors.white,
                                                      tileColor: Colors.white,
                                                      fillColor:
                                                          MaterialStatePropertyAll(
                                                              Colors.blueGrey[
                                                                  800]),
                                                      activeColor:
                                                          Colors.blueGrey[800],
                                                      checkColor: Colors.white,
                                                      title: Text(
                                                        subject.name,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .blueGrey[800],
                                                            fontFamily:
                                                                'Jomolhari',
                                                            fontSize: 20),
                                                      ),
                                                      value: isSubjectSelected,
                                                      onChanged: isSubjectDisabled
                                                          ? null // Disable the checkbox for the subject
                                                          : (value) {
                                                              setState(() {
                                                                if (value!) {
                                                                  _passedCourses
                                                                      .add(subject
                                                                          .id);
                                                                } else {
                                                                  _passedCourses
                                                                      .remove(
                                                                          subject
                                                                              .id);
                                                                }

                                                                // Handle the dependent subjects
                                                                if (subject.id ==
                                                                        'MATH101' &&
                                                                    !value) {
                                                                  _passedCourses
                                                                      .remove(
                                                                          'MATH201');
                                                                }
                                                                if (subject.id ==
                                                                        'HUM132' &&
                                                                    !value) {
                                                                  _passedCourses
                                                                      .remove(
                                                                          'AI201');
                                                                }
                                                                if (subject.id ==
                                                                        'HUM111' &&
                                                                    !value) {
                                                                  _passedCourses
                                                                      .remove(
                                                                          'CS211');
                                                                }
                                                              });
                                                            },
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width -
                                                        1050,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 80,
                                                child: ElevatedButton(
                                                  style: ButtonStyle(
                                                      padding:
                                                          MaterialStatePropertyAll(
                                                              EdgeInsets.zero),
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              Colors.white)),
                                                  child: Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        color: Colors
                                                            .blueGrey[800]),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    setState(() {
                                                      _passedCourses.clear();
                                                    });
                                                  },
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Container(
                                                height: 30,
                                                width: 80,
                                                child: ElevatedButton(
                                                  style: ButtonStyle(
                                                      padding:
                                                          MaterialStatePropertyAll(
                                                              EdgeInsets.zero),
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              Colors.white)),
                                                  child: Text(
                                                    'OK',
                                                    style: TextStyle(
                                                        color: Colors
                                                            .blueGrey[800]),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  // actions: [
                                  //
                                  // ],
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Text(
                        'Click Here',
                        style: TextStyle(
                            fontFamily: 'Jomolhari',
                            fontSize: 25,
                            color: Colors.red[800]),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blueGrey[800])),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontFamily: 'Jomolhari',
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      onPressed: _submitForm,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
