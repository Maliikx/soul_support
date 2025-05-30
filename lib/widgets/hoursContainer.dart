import 'package:flutter/material.dart';

class hoursContainer extends StatelessWidget {
  const hoursContainer({super.key, required this.Date});
  final String Date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 44,
      decoration: BoxDecoration(
        color: Color(0xFFF9FCFD).withOpacity(0.8),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(this.Date,style: TextStyle(color: Colors.black,
                                      fontSize: 16,
                                  fontWeight: FontWeight.w400),),
      ),
    );
  }
}
