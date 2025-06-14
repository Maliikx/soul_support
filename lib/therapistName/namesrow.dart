// import 'package:flutter/material.dart';
// // import 'package:flutter/material.dart';
// import 'package:flutter_application_1/services/api.dart';
// import 'package:flutter_application_1/main.dart';
// import 'package:flutter_application_1/services/getDoctorbyemail.dart';
// import 'package:flutter_application_1/services/getpaatientofDoctor.dart';
// import 'package:flutter_application_1/services/getpatientName.dart';
// import 'package:flutter_application_1/widgets/AvailabletherapistsCardrow.dart';
// import 'package:flutter_application_1/widgets/availableTherapistsCard.dart';
// import 'package:hive/hive.dart';

// class Namesrow extends StatefulWidget {
//   Namesrow({super.key});

//   @override
//   State<Namesrow> createState() => _NamesrowState();
// }

// class _NamesrowState extends State<Namesrow> {
//   String? _email;

//   int? _id;
//   List<int>? _patientid;
//   @override
//   void initState() {
//     super.initState();
//     _loadEmail();
//   }

//   // Future<void> _loadEmail() async {
//   //   var box = Hive.box('myBox');
//   //   _email = box.get('email');
//   //   setState(() {
//   //   _email = email;
//   //   _id = id;
//   //   _patientid = patientIds;

      
//   //   });
//   //   _id = await Getdoctorbyemail.getpatientId(_email!);
//   //   _patientid = await Getpaatientofdoctor.getPatientsByTherapistId(_id.toString());
//   //   print('$_patientid');
//   //   print('Email from Hive: $_email');
//   //   print('pDoctor from Hive: $_id');
//   //   print('$_patientid');
//   // }
// Future<void> _loadEmail() async {
//   var box = Hive.box('myBox');
//   String? email = box.get('email');

//   int? id = await Getdoctorbyemail.getpatientId(email!);
//   List<int>? patientIds = await Getpaatientofdoctor.getPatientsByTherapistId("12");

//   setState(() {
//     _email = email;
//     _id = id;
//     _patientid = patientIds;
//   });

//   print('Email from Hive: $_email');
//   print('pDoctor from Hive: $_id');
//   print('Patient IDs: $_patientid');
// }
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<String>>(
//       future: GetPatientById.fetchPatientNamesByIds([4]),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return const Center(child: CircularProgressIndicator());
//         }

//  final names = snapshot.data!;
//         return SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: names.map((name) {
//               return Container(
//                 margin: const EdgeInsets.only(right: 16),
//                 child: AvailabletherapistsCardrow(
//                   name: name,
//                   time: 'Today, 08:00 : 12:00',
//                   height: 110,
//                   width: 250,
//                   color: Colors.white,
//                   imgPath: "Assets/Group 6878.png",
//                 ),
//               );
//             }).toList(),
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/getDoctorbyemail.dart';
import 'package:flutter_application_1/services/getpaatientofDoctor.dart';
import 'package:flutter_application_1/services/getpatientName.dart';
import 'package:flutter_application_1/widgets/AvailabletherapistsCardrow.dart';
import 'package:hive/hive.dart';

class Namesrow extends StatefulWidget {
  Namesrow({super.key});

  @override
  State<Namesrow> createState() => _NamesrowState();
}

class _NamesrowState extends State<Namesrow> {
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
