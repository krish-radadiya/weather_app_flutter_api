import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro_screen extends StatelessWidget {
  Intro_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          back: Container(
            color: Colors.lightBlueAccent,
          ),
          pages: [
            PageViewModel(
              title: "Title of orange text and bold page",
              body:
                  "This is a description on a page with an orange title and bold, big body.",
              image: Image.asset("assets/image 2.png", height: 175.0),
              decoration: const PageDecoration(
                pageColor: Color(
                  0xFF608FEB,
                ),
                titleTextStyle: TextStyle(color: Colors.white),
                bodyTextStyle:
                    TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
              ),
            ),
            PageViewModel(
              title: "Multi Language",
              body:
                  "It build in two languages Hindi, English with best and easy translation ",
              image: Image.asset("assets/intro 1.png", height: 175.0),
              decoration: const PageDecoration(
                pageColor: Color(
                  0xFF608FEB,
                ),
                titleTextStyle: TextStyle(color: Colors.white),
                bodyTextStyle:
                    TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
              ),
            ),
            PageViewModel(
              title: "Audio Book",
              body:
                  "You can listen the book in Hindi, English while doing your work",
              image: Image.network(
                  "https://cdn.jim-nielsen.com/ios/512/weather-2021-12-07.png",
                  height: 175.0),
              decoration: const PageDecoration(
                pageColor: Color(
                  0xFF608FEB,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                ),
                bodyTextStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                ),
              ),
            ),
            PageViewModel(
              title: "Let’s Start",
              body: "rainy weather",
              image: Image.asset(
                "assets/intro 2.png",
                height: 175.0,
              ),
              decoration: const PageDecoration(
                pageColor: Color(
                  0xFF608FEB,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                ),
                bodyTextStyle:
                    TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
              ),
            ),
          ],
          done: Text(
            "done",
            style: GoogleFonts.abrilFatface(
              color: Colors.black,
            ),
            // style: TextStyle(
            //   color: Colors.black,
            // ),
          ),
          onDone: () async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.setBool('IsIntroVisited', true);
            Navigator.pushReplacementNamed(
              context,
              "home",
            );
          },
          next: const Text(
            "next",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          showNextButton: true,
          skip: const Text(
            "skip",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          onSkip: () {
            Navigator.pushReplacementNamed(
              context,
              "homescreen",
            );
          },
          showSkipButton: true,
          dotsDecorator: DotsDecorator(
            size: const Size.square(
              10.0,
            ),
            activeSize: const Size(
              20.0,
              10.0,
            ),
            activeColor: Theme.of(context).colorScheme.secondary,
            color: Colors.black,
            spacing: const EdgeInsets.symmetric(
              horizontal: 3.0,
            ),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}
