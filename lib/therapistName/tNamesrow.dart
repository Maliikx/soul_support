

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:soul_support/services/getDoctorbyemail.dart';
import 'package:soul_support/services/getpaatientofDoctor.dart';
import 'package:soul_support/services/getpatientName.dart';
import 'package:soul_support/widgets/AvailabletherapistsCardrow.dart';

class TNamesrow extends StatefulWidget {
  TNamesrow({super.key});

  @override
  State<TNamesrow> createState() => _TNamesrowState();
}

class _TNamesrowState extends State<TNamesrow> {
  Future<List<String>>? _patientNamesFuture;

  Future<List<String>> _loadDataAndFetchNames() async {
    var box = Hive.box('myBox');
    String? email = box.get('email');

    int? id = await Getdoctorbyemail.getpatientId(email!);
    List<int>? patientIds = await Getpaatientofdoctor.getPatientsByTherapistId(id.toString());

    print('Email: $email');
    print('Doctor ID: $id');
    print('Patient IDs: $patientIds');

    if (patientIds == null || patientIds.isEmpty) return [];

    // Use actual patient IDs
    List<String> names = await GetPatientById.fetchPatientNamesByIds(patientIds);
    print('Patient Names: $names');
    return names;
  }

  @override
  void initState() {
    super.initState();
    _patientNamesFuture = _loadDataAndFetchNames();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _patientNamesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        final names = snapshot.data ?? [];

        if (names.isEmpty) {
          return const Center(child: Text("No patients found"));
        }

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: names.map((name) {
              return Container(
                margin: const EdgeInsets.only(right: 16),
                child: AvailabletherapistsCardrow(
                  name: name,
                  time: 'Today, 08:00 : 12:00',
                  height: 110,
                  width: 250,
                  color: Colors.white,
                  imgPath: "Assets/Group 6878.png",
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
