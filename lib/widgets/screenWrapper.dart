import 'package:flutter/material.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/screens/drawerScreen.dart';
import 'package:soul_support/screens/tDrawerScreen.dart';

class ScreenWrapper extends StatefulWidget {
    final bool? isTherapist;

    final Widget child;
  const ScreenWrapper({super.key, required this.child, this.isTherapist});

  @override
  State<ScreenWrapper> createState() => _ScreenWrapperState();
}

class _ScreenWrapperState extends State<ScreenWrapper> {
   double xOffset = 0;
   double yOffset = 0;
   double screenBorder = 0;
   double scaleFactor = 1;
   bool _opacityContainer = false;
   bool isPanelVisible = false;

   void togglePanel() {
     setState(() {
       isPanelVisible = !isPanelVisible;
     });
   }
   
   void _toggleOpacity() {
    setState(() {
      _opacityContainer = !_opacityContainer;
    });
  }

  @override
  Widget build(BuildContext context) {
   return Stack(
      children: [
        widget.isTherapist == null ? DrawerScreen(): TDrawerScreen(),
        AnimatedContainer(
          duration: Duration(milliseconds: 250),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(screenBorder),
                child: widget.child),
                    Positioned(
                      top: 35,
                      left: 30,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                              xOffset = 260;
                              yOffset = 80;
                              scaleFactor = 0.85;
                              screenBorder = 30;
                              _toggleOpacity();
                          
                            });
                        },
                        child: Container(
                              width: 65,
                              height: 55,
                              decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(30)
                              ),
                              child: Icon(Icons.menu_outlined, color: Colors.white, size: 30,),
                            ),
                      ),
                    ),
                    if (_opacityContainer)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            xOffset = 0;
                            yOffset = 0;
                            scaleFactor = 1;
                            screenBorder = 0;
                            _toggleOpacity();
                          });
                        },
                        child: Container(
                           width: double.infinity,
                           height: double.infinity,
                           decoration: BoxDecoration(
                            // color: const Color.fromARGB(50, 0, 0, 0),
                            borderRadius: BorderRadius.circular(30),
                           ),
                        ),
                      ),
            ],
          )),
             AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            bottom: isPanelVisible ? 0 : -200,  // Panel slides from bottom
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              color: Colors.white,
              child: Center(child: Text("Quick Mood Log Panel")),
            ),),
      ],
    );
  }
}