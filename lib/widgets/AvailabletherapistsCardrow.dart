import 'package:flutter/material.dart';
import 'package:flutter_application_1/Therapist_Home.dart';
import 'package:flutter_application_1/main.dart';
// import 'package:soul_support/screens/therapistProfileScreen.dart';
// import 'package:soul_support/transitions/custom_transitions.dart';
import 'package:flutter_application_1/widgets/screenWrapper.dart';
class AvailabletherapistsCardrow extends StatefulWidget {
  final String name;
  final String time;
  final Color color;
  final double height;
  final double width;
  final String imgPath;
  final VoidCallback? onTap;

  const AvailabletherapistsCardrow({
    required this.name,
    required this.time,
    required this.color,
    required this.height,
    required this.width,
    required this.imgPath,
    this.onTap,
    super.key,
  });

  @override
  State<AvailabletherapistsCardrow> createState() => _AvailabletherapistsCardrowState();
}

class _AvailabletherapistsCardrowState extends State<AvailabletherapistsCardrow> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: widget.height, // e.g., 110
        width: widget.width,   // e.g., 280
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            // Image with gradient overlay
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                  child: Image.asset(
                    widget.imgPath,
                    height: widget.height,
                    width: widget.width * 0.4, // roughly 40% width for image
                    fit: BoxFit.cover,
                    alignment: const Alignment(0.7, 0),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 35,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          widget.color,
                          widget.color.withAlpha(0),
                        ],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        stops: const [0.4, 0.9],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(width: 10),

            // Text info takes the rest of the space and wraps text
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                     widget.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    "Therapist",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.time,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



