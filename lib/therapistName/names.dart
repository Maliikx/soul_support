import 'package:flutter/material.dart';
import 'package:soul_support/services/api.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/widgets/availableTherapistsCard.dart';

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
                imgPath: "assets/imgs/doc2.jpeg",
                email: "ranaKhater57@gmail.com",),
            );
          }).toList(),
        );
      },
    );
  }
}

