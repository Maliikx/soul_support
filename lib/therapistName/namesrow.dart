import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:soul_support/services/api.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/widgets/AvailabletherapistsCardrow.dart';
import 'package:soul_support/widgets/availableTherapistsCard.dart';

class Namesrow extends StatelessWidget {
  const Namesrow({super.key});

  @override
  Widget build(BuildContext context) {
     return FutureBuilder<List<String>>(
      future: Api.getTherapist(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator(
            color: primary,
            ));
        }

        final names = snapshot.data!;

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
                  imgPath: "assets/imgs/doc2.jpeg",
                ),

              );
            }).toList(),
            
          ),
        );
      },
    );
  }
  }
