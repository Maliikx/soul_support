import 'package:flutter/material.dart';


class Timecontainer extends StatelessWidget {
  final String time;
  final bool isSelected;
  final VoidCallback onSelect;

  const Timecontainer({
    Key? key,
    required this.time,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect, // Select only one
      child: Container(
        height: 27.45,
        width: 90,
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF01709A) : Color(0xFFECF1FF),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected ? Color(0xFF01709A) : Colors.white, // Border color
            width: 1.5,
          ),
        ),
        child: Center(
          child: Text(
            time,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.white : Color(0xFF589FBA),
            ),
          ),
        ),
      ),
    );
  }
}

