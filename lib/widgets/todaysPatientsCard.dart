import 'package:flutter/material.dart';
// import 'package:soul_support/main.dart';

class TodaysPatientsCard extends StatefulWidget {
  final String name;
  final String time;
  final String description;
  final Color color;
  final double height;
  final double width;

  final VoidCallback? onTap;
  const TodaysPatientsCard({
    required this.name,
    required this.time,
    required this.description,
    required this.color,
    required this.height,
    required this.width,
    this.onTap,
    super.key, 
    });

  @override
  State<TodaysPatientsCard> createState() => _TodaysPatientsCardState();
}

class _TodaysPatientsCardState extends State<TodaysPatientsCard> {
  @override
  Widget build(BuildContext context) {
    return  Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              width: widget.width,//280
              decoration: BoxDecoration(
                color: widget.color, //Color.fromARGB(153, 255, 255, 255)
                borderRadius: BorderRadius.circular(30)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Text(widget.name,
                 style: TextStyle(fontSize: 16,
                 fontWeight: FontWeight.bold,
                 color: Color(0xFF01709A),
                 ), ),
                
                 SizedBox(height: 5,),
                Text(widget.time),
                 SizedBox(height: 5,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white
                  ),
                  child: Text(widget.description, 
                  style: TextStyle(
                    fontSize: 16
                  ),))
              ],),
   );
  }
}