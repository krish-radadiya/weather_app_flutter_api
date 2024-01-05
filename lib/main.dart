import 'package:flutter/material.dart';
import 'package:weather_app_flutter_api/modules/screen/introscreen/views/introscreen.dart';

import 'modules/screen/homescreen/views/homescreen.dart';
import 'modules/screen/introscreen/views/animation_intro.dart';
import 'modules/screen/spleshscreen/views/spleshscreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'splesh': (context) => const spleshscreen(),
        'intro': (context) => Intro_screen(),
        '/': (context) => const homescreen(),
      },
    ),
  );
}
