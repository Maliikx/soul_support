import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class delete_screen extends StatefulWidget {
  final dynamic doctortId;

 

  const delete_screen({super.key,  required this.doctortId});


  @override
  State<delete_screen> createState() => _delete_screenState();
}

class _delete_screenState extends State<delete_screen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Builder(
      key: UniqueKey(), // prevents SnackBar Hero collision
      builder: (context) => Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 30, start: 20),
              child: Text(
                "Delete my account",
                style: TextStyle(
                  color: Color(0xff01709A),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 10, start: 30, end: 30),
              child: Text(
                "Are you sure you want to delete your account?",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffD6E8EE),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Color(0xff01709A),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final box = Hive.box('myBox');
                    final token = box.get('token')?.toString().trim();
                    print('Token from Hive: $token'); // Debug print

                    if (token == null || token.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Session expired. Please login again.'))
                      );
                      return;
                    }

                    try {
                      final response = await http.delete(
                        Uri.parse('http://192.168.124.134:3000/delete/doctor/${widget.doctortId}'),
                        headers: {
                          'Content-Type': 'application/json',
                          'Authorization': 'Bearer $token',
                        },
                      );

                      final responseBody = jsonDecode(response.body);

                      if (response.statusCode == 200) {
                        await box.clear();
                        Navigator.pushReplacementNamed(context, '/'); // Navigate to signup
                      } else {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('Error'),
                            content: Text(responseBody['message'] ?? 'Deletion failed'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('OK'),
                              )
                            ],
                          ),
                        );
                      }
                    } catch (e) {
                      print("Error deleting account: $e");
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error deleting account: $e'))
                      );
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff01709A),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }}
