import 'package:flutter/material.dart';
import 'package:terms_of_mapperz/home_page.dart';
import 'package:terms_of_mapperz/pages/cgu.dart';
import 'package:terms_of_mapperz/pages/cgv.dart';
import 'package:terms_of_mapperz/pages/politics.dart';
import 'package:terms_of_mapperz/pages/terms.dart';
import 'package:terms_of_mapperz/pages/story.dart';
import 'package:terms_of_mapperz/pages/vision.dart';
import 'package:terms_of_mapperz/pages/visual.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mapperz',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/homepage',
      routes: {
        '/homepage': (context) => const HomePage(),
        '/vision': (context) => const VisionPage(),
        '/story': (context) => const StoryPage(),
        '/cgu': (context) => const CguPage(),
        '/cgv': (context) => const CgvPage(),
        '/terms': (context) => const TermsPage(),
        '/politics': (context) => const PoliticsPage(),
        '/visual': (context) => const VisualPage(),
      },
    );
  }
}
