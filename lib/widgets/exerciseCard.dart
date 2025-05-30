import 'package:flutter/material.dart';
import 'package:soul_support/main.dart';

class Exercisecard extends StatefulWidget {
  final String title;
  final String numberOfEcercises;
  final String imgPath;
  final VoidCallback? onTap;
  const Exercisecard({
    required this.title,
    required this.numberOfEcercises,
    required this.imgPath,
    this.onTap,
    super.key});

  @override
  State<Exercisecard> createState() => _ExercisecardState();
}

class _ExercisecardState extends State<Exercisecard> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 150,
      width: 145,
      decoration: BoxDecoration(
        color: banners,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                child: Container(
                  height: 100,
                  child: Image.asset(widget.imgPath,
                  fit: BoxFit.cover,
                  )),
              ),
              Transform.translate(
                offset: Offset(0, 60),
                child: Container(
                   height: 40,
                   decoration: BoxDecoration(
                     gradient: LinearGradient(colors: [banners, const Color.fromARGB(0, 255, 255, 255)],
                     begin: Alignment.bottomCenter,
                     end: Alignment.topCenter,
                     stops: [0.1, 0.5],
                     ),
                   ),
                ),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(widget.numberOfEcercises),
                Text(widget.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ],
      ),
     );
  }
}