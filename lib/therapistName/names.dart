import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/api.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/widgets/availableTherapistsCard.dart';

class TherapistList extends StatelessWidget {
  const TherapistList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: Api.getTherapist(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final names = snapshot.data!;

        return Column(
          children: names.map((name) {
            return Container(
              margin: const EdgeInsets.only(bottom: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: accent,
                    spreadRadius: 0,
                    blurRadius: 0,
                    offset: const Offset(-8, -8),
                  )
                ],
              ),
              child: AvailabletherapistsCard(
                name: name,
                time: 'Today, 08:00 : 12:00',
                height: 110,
                width: double.infinity,
                color: Colors.white,
                imgPath: "Assets/Group 6878.png",
                email: "ranaKhater57@gmail.com",
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

