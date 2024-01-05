import 'dart:async';

import 'package:flutter/material.dart';

class spleshscreen extends StatelessWidget {
  const spleshscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.pushNamed(context, "intro");
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/Splash screen.jpg",
            ),
          ),
        ),
      ),
    );
  }
}
