import 'package:flutter/material.dart';
import 'dart:ui'; // Important for ImageFilter.blur


// Slide transition
Route slideRtL(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // Slide from right to left
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
Route slideLtR(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0); // Slide from right to left
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
Route slideBtT(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0, 1.0); // Slide from bottom to top
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}



Route halfSlideBtT(Widget page) {
  return PageRouteBuilder(
    opaque: false,
    barrierColor: Colors.transparent, // No default barrier color
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0, 1.0);
      const end = Offset(0, 0.2);
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      // Use animation value to gradually apply blur + fade
      return Stack(
        children: [
          // Animated blur background
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
             final blurValue = (animation.value * 10).clamp(0, 3.5).toDouble();
             final opacity = (animation.value * 0.5).clamp(0, 0.2).toDouble();


              return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
                child: Container(
                  color: Colors.black.withOpacity(opacity), // Fades in softly
                ),
              );
            },
          ),

          // Sliding panel
          SlideTransition(
            position: offsetAnimation,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
              child: child,
            ),
          ),
        ],
      );
    },
  );
}

Route smallSlideBtT(Widget page) {
  return PageRouteBuilder(
    opaque: false,
    barrierColor: Colors.transparent, // No default barrier color
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0, 1.0);
      const end = Offset(0, 0.75);
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      // Use animation value to gradually apply blur + fade
      return Stack(
        children: [
          // Animated blur background
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
             final blurValue = (animation.value * 10).clamp(0, 3.5).toDouble();
             final opacity = (animation.value * 0.5).clamp(0, 0.2).toDouble();


              return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
                child: Container(
                  color: Colors.black.withOpacity(opacity), // Fades in softly
                ),
              );
            },
          ),

          // Sliding panel
          SlideTransition(
            position: offsetAnimation,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
              child: child,
            ),
          ),
        ],
      );
    },
  );
}



Route slideTtB(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0, -1.0); // Slide from top to bottom
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}


// Fade transition
Route fadeTransition(Widget page) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 1),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,

        child: child,
      );
    },
  );
}


// Scale transition
Route scaleTransition(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
  );
}