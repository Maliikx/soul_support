import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DockBtn extends StatefulWidget {
    final double size;
    final String icon;
    final bool isActive;
    final Color color;
    final VoidCallback? onTap;
    

  const DockBtn({
    required this.size,
    required this.icon,
    required this.isActive,
    required this.color,
     this.onTap,
    super.key});

  @override
  State<DockBtn> createState() => _DockBtnState();
}

class _DockBtnState extends State<DockBtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(15),
              height: widget.size,
              width: widget.size,
              decoration: BoxDecoration(
                color: widget.isActive? Colors.white : widget.color,
                borderRadius: BorderRadius.circular(60),
                border: Border.all(color: Colors.white, width: 1)
              ),
              child: Container(
                child: SvgPicture.asset(widget.icon,
                 color: widget.isActive? widget.color : Colors.white,),
              ),
              ),
    );
  }
}