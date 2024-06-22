import 'package:flutter/material.dart';

TextStyle neonblue = const TextStyle(
  fontFamily: 'TiltNeon',
  fontWeight: FontWeight.w900,
  fontSize: 19,
  shadows: [
    Shadow(
      blurRadius: 2.0,
      color: neonBlue,
    ),
    Shadow(
      blurRadius: 5.0,
      color: neonBlue,
    ),
    Shadow(
      blurRadius: 2.0,
      color: white,
      offset: Offset(1, -1),
    ),
    Shadow(
      offset: Offset(1, -1),
      blurRadius: 1.0,
      color: white,
    ),
    Shadow(
      // offset: Offset(1, -1),
      blurRadius: 3.0,
      color: white,
    ),
  ],
);

TextStyle neonDeepurple = const TextStyle(
  fontFamily: 'TiltNeon',
  fontWeight: FontWeight.w900,
  fontSize: 16,
  shadows: [
    Shadow(
      blurRadius: 2.0,
      color: deepPurple,
    ),
    Shadow(
      blurRadius: 5.0,
      color: deepPurple,
    ),
    Shadow(
      blurRadius: 2.0,
      color: white,
      offset: Offset(1, -1),
    ),
    Shadow(
      offset: Offset(1, -1),
      blurRadius: 1.0,
      color: white,
    ),
    Shadow(
      // offset: Offset(1, -1),
      blurRadius: 3.0,
      color: white,
    ),
  ],
);

final linearGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    // Colors.black,
    Colors.black87,
    Colors.grey.shade900,
    Colors.grey.shade900,
    Colors.blueGrey.shade800,
    Colors.blueGrey.shade700,
    Colors.blueGrey.shade700,
    Colors.blueGrey.shade800,
    Colors.grey.shade900,
    Colors.grey.shade900,
    Colors.black87,
    // Colors.black,
  ],
);

const mainColor = Color.fromARGB(255, 7, 32, 45);
const logBgColor = Color.fromARGB(255, 45, 48, 53);
const appleGreen = Color.fromARGB(255, 97, 255, 103);
const neonBlue = Color.fromARGB(255, 3, 225, 210);
const turquoise = Color.fromARGB(255, 57, 255, 202);
const deepPurple = Color.fromARGB(255, 245, 79, 201);
const bookedColor = Color.fromARGB(255, 77, 255, 252);
const neonYellow = Color.fromARGB(255, 247, 253, 134);
const darkOcean = Color.fromARGB(255, 82, 82, 228);
const neonRed = Color.fromARGB(255, 217, 9, 68);
const eventPage = Color.fromARGB(255, 85, 177, 211);
const white = Color.fromARGB(255, 255, 255, 255);
const deepViolet = Color.fromARGB(255, 139, 6, 255);
const splash = Color.fromARGB(255, 113, 236, 255);
const black = Colors.black;
const transparent = Colors.transparent;
const neonGreen = Color(0xFF00FF00);
const neonBlueElectrik = Color(0xFF0000FF);
const neonPurple = Color(0xFF8A2BE2);
const neonPink = Color(0xFFFF1493);
const blueGrey = Colors.blueGrey;
const grey = Colors.grey;

TextStyle styleTitle = const TextStyle(
  fontFamily: 'TiltNeon',
  color: white,
  // shadows: <Shadow>[
  //   Shadow(
  //     blurRadius: 1.0,
  //     color: white,
  //     offset: Offset(1.1, -1.1),
  //   ),
  //   Shadow(
  //     blurRadius: 1.0,
  //     color: splash,
  //   ),
  //   // Shadow(
  //   //   blurRadius: 2.0,
  //   //   color: splash,
  //   //   offset: Offset(1.2, -1.2),
  //   // ),
  //   Shadow(
  //     blurRadius: 2.0,
  //     color: splash,
  //   ),
  // ],
  fontSize: 19,
  // fontWeight: FontWeight.bold,
);

TextStyle styleTitle2 = const TextStyle(
  fontFamily: 'TiltNeon',
  color: white,
  // shadows: <Shadow>[
  //   Shadow(
  //     blurRadius: 3.0,
  //     color: deepPurple,
  //   ),
  //   Shadow(
  //     blurRadius: 1.0,
  //     color: white,
  //   ),
  // ],
  fontSize: 16,
  // fontWeight: FontWeight.bold,
);

TextStyle styleButton = const TextStyle(
  fontFamily: 'TiltNeon',
  color: white,
  shadows: <Shadow>[
    Shadow(
      blurRadius: 2.0,
      color: white,
    ),
    Shadow(
      blurRadius: 1.0,
      color: black,
    ),
  ],
  fontSize: 15,
  // fontWeight: FontWeight.bold,
);

TextStyle styleText = const TextStyle(
  fontFamily: 'TiltNeon',
  // color: Colors.blueGrey,
  color: white,
  // shadows: <Shadow>[
  //   Shadow(
  //     blurRadius: 1.0,
  //     color: white,
  //   ),
  //   // Shadow(
  //   //   blurRadius: 10.0,
  //   //   color: eventPage,
  //   // ),
  // ],
  fontSize: 16,
  fontWeight: FontWeight.bold,
);
TextStyle styleText2 = const TextStyle(
  fontFamily: 'TiltNeon',
  color: white,
  shadows: <Shadow>[
    Shadow(
      blurRadius: 2.0,
      color: neonYellow,
    ),
    Shadow(
      blurRadius: 5.0,
      color: white,
    ),
  ],
  fontSize: 15,
  // fontWeight: FontWeight.bold,
);
