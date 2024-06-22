// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:terms_of_mapperz/pages/politics.dart';
import 'package:terms_of_mapperz/screens/showstores.dart';
import 'package:terms_of_mapperz/utilities/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool animate = false;
  bool animate2 = false;
  bool bottom = false;
  bool animate3 = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        animate = true;
      });
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        animate2 = true;
      });
    });
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        animate3 = true;
      });
    });
    Future.delayed(const Duration(milliseconds: 900), () {
      setState(() {
        bottom = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var sizeDevice = (MediaQuery.of(context).size.width > 800);
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        shadowColor: transparent,
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.all(0),
        // height: 100,
        surfaceTintColor: transparent,
        color: black.withOpacity(0.3),
        child: Container(
          decoration: const BoxDecoration(color: transparent),
          clipBehavior: Clip.hardEdge,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedSlide(
                    offset: bottom ? const Offset(0, 0) : const Offset(-10, 0),
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: IconButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            barrierDismissible: true,
                            opaque: false,
                            barrierColor: black.withOpacity(0.3),
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return FadeTransition(
                                opacity: animation,
                                child: const ShowStores(),
                              );
                            },
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.install_mobile_rounded,
                        // Icons.file_download_outlined,
                        color: white,
                        size: 30,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 1.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 10.0,
                            color: white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedSlide(
                    offset: bottom ? const Offset(0, 0) : const Offset(0, 10),
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: const Text(
                      '© 2024 Mapperz',
                      style: TextStyle(
                        fontFamily: 'TiltNeon',
                        color: white,
                        shadows: <Shadow>[
                          Shadow(
                            blurRadius: 1.0,
                            color: splash,
                          ),
                          Shadow(
                            blurRadius: 5.0,
                            color: splash,
                          ),
                        ],
                        fontSize: 14,
                      ),
                    ),
                  ),
                  //=> on créé  une icône de contact
                  AnimatedSlide(
                    offset: bottom ? const Offset(0, 0) : const Offset(10, 0),
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: IconButton(
                      onPressed: () {
                        //=> on affiche un snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Contact :',
                                    style: TextStyle(
                                      fontFamily: 'TiltNeon',
                                      color: white,
                                      shadows: <Shadow>[
                                        Shadow(
                                          blurRadius: 1.0,
                                          color: splash,
                                        ),
                                        Shadow(
                                          blurRadius: 5.0,
                                          color: splash,
                                        ),
                                      ],
                                      fontSize: 14,
                                    ),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(
                                        Colors.transparent,
                                      ),
                                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                        const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                      ),
                                    ),
                                    child: const Text(
                                      " miageru00@gmail.com",
                                      style: TextStyle(
                                        fontFamily: 'TiltNeon',
                                        color: white,
                                        shadows: <Shadow>[
                                          Shadow(
                                            blurRadius: 1.0,
                                            color: deepPurple,
                                          ),
                                          Shadow(
                                            blurRadius: 5.0,
                                            color: deepPurple,
                                          ),
                                        ],
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    onPressed: () async {
                                      if (!await launchUrl(emailUri)) {
                                        if (kDebugMode) print('Could not launch URL');
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            backgroundColor: black.withOpacity(0.1),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.contact_mail_rounded,
                        size: 30,
                        color: white,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 1.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 10.0,
                            color: white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: transparent,
        surfaceTintColor: transparent,
        backgroundColor: black.withOpacity(0.3),
        toolbarHeight: 130,
        title: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: animate ? 1.0 : 0.0,
                    curve: Curves.bounceIn,
                    child: const Text(
                      'M',
                      style: TextStyle(
                        fontFamily: 'Megrim',
                        color: white,
                        shadows: <Shadow>[
                          Shadow(
                            blurRadius: 2.0,
                            color: deepPurple,
                            offset: Offset(2, -2),
                          ),
                          Shadow(
                            blurRadius: 3.0,
                            color: deepPurple,
                            offset: Offset(3, -3),
                          ),
                          Shadow(
                            blurRadius: 17.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 1.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 7.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 1.0,
                            color: deepPurple,
                            offset: Offset(1, -1),
                          ),
                          Shadow(
                            blurRadius: 4.0,
                            color: white,
                            // offset: Offset(1, -1),
                          ),
                        ],
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 600),
                    opacity: animate ? 1.0 : 0.0,
                    curve: Curves.bounceInOut,
                    child: const Text(
                      'a',
                      style: TextStyle(
                        fontFamily: 'Megrim',
                        color: white,
                        shadows: <Shadow>[
                          Shadow(
                            blurRadius: 2.0,
                            color: deepPurple,
                            offset: Offset(2, -2),
                          ),
                          Shadow(
                            blurRadius: 3.0,
                            color: deepPurple,
                            offset: Offset(3, -3),
                          ),
                          Shadow(
                            blurRadius: 17.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 1.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 7.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 1.0,
                            color: deepPurple,
                            offset: Offset(1, -1),
                          ),
                          Shadow(
                            blurRadius: 4.0,
                            color: white,
                            // offset: Offset(1, -1),
                          ),
                        ],
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 700),
                    opacity: animate ? 1.0 : 0.0,
                    curve: Curves.bounceInOut,
                    child: const Text(
                      'p',
                      style: TextStyle(
                        fontFamily: 'Megrim',
                        color: white,
                        shadows: <Shadow>[
                          Shadow(
                            blurRadius: 2.0,
                            color: deepPurple,
                            offset: Offset(2, -2),
                          ),
                          Shadow(
                            blurRadius: 3.0,
                            color: deepPurple,
                            offset: Offset(3, -3),
                          ),
                          Shadow(
                            blurRadius: 17.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 1.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 7.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 1.0,
                            color: deepPurple,
                            offset: Offset(1, -1),
                          ),
                          Shadow(
                            blurRadius: 4.0,
                            color: white,
                            // offset: Offset(1, -1),
                          ),
                        ],
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 400),
                    opacity: animate ? 1.0 : 0.0,
                    curve: Curves.bounceIn,
                    child: const Text(
                      'p',
                      style: TextStyle(
                        fontFamily: 'Megrim',
                        color: white,
                        shadows: <Shadow>[
                          Shadow(
                            blurRadius: 2.0,
                            color: deepPurple,
                            offset: Offset(2, -2),
                          ),
                          Shadow(
                            blurRadius: 3.0,
                            color: deepPurple,
                            offset: Offset(3, -3),
                          ),
                          Shadow(
                            blurRadius: 17.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 1.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 7.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 1.0,
                            color: deepPurple,
                            offset: Offset(1, -1),
                          ),
                          Shadow(
                            blurRadius: 4.0,
                            color: white,
                            // offset: Offset(1, -1),
                          ),
                        ],
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: animate ? 1.0 : 0.0,
                    curve: Curves.bounceIn,
                    child: const Text(
                      'e',
                      style: TextStyle(
                        fontFamily: 'Megrim',
                        color: white,
                        shadows: <Shadow>[
                          Shadow(
                            blurRadius: 2.0,
                            color: deepPurple,
                            offset: Offset(2, -2),
                          ),
                          Shadow(
                            blurRadius: 3.0,
                            color: deepPurple,
                            offset: Offset(3, -3),
                          ),
                          Shadow(
                            blurRadius: 17.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 1.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 7.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 1.0,
                            color: deepPurple,
                            offset: Offset(1, -1),
                          ),
                          Shadow(
                            blurRadius: 4.0,
                            color: white,
                            // offset: Offset(1, -1),
                          ),
                        ],
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 600),
                    opacity: animate ? 1.0 : 0.0,
                    curve: Curves.bounceOut,
                    child: const Text(
                      'r',
                      style: TextStyle(
                        fontFamily: 'Megrim',
                        color: white,
                        shadows: <Shadow>[
                          Shadow(
                            blurRadius: 2.0,
                            color: deepPurple,
                            offset: Offset(2, -2),
                          ),
                          Shadow(
                            blurRadius: 3.0,
                            color: deepPurple,
                            offset: Offset(3, -3),
                          ),
                          Shadow(
                            blurRadius: 17.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 1.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 7.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 1.0,
                            color: deepPurple,
                            offset: Offset(1, -1),
                          ),
                          Shadow(
                            blurRadius: 4.0,
                            color: white,
                            // offset: Offset(1, -1),
                          ),
                        ],
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: animate ? 1.0 : 0.0,
                    curve: Curves.bounceOut,
                    child: const Text(
                      'z',
                      style: TextStyle(
                        fontFamily: 'Megrim',
                        color: white,
                        shadows: <Shadow>[
                          Shadow(
                            blurRadius: 2.0,
                            color: deepPurple,
                            offset: Offset(2, -2),
                          ),
                          Shadow(
                            blurRadius: 3.0,
                            color: deepPurple,
                            offset: Offset(3, -3),
                          ),
                          Shadow(
                            blurRadius: 17.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 1.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 7.0,
                            color: deepPurple,
                          ),
                          Shadow(
                            blurRadius: 1.0,
                            color: deepPurple,
                            offset: Offset(1, -1),
                          ),
                          Shadow(
                            blurRadius: 4.0,
                            color: white,
                            // offset: Offset(1, -1),
                          ),
                        ],
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 1300),
                opacity: animate ? 1.0 : 0.0,
                curve: Curves.bounceIn,
                child: const Text(
                  "__________________",
                  style: TextStyle(
                    fontFamily: 'TiltNeon',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: white,
                    shadows: [
                      Shadow(
                        blurRadius: 12.0,
                        color: splash,
                      ),
                      Shadow(
                        blurRadius: 10.0,
                        color: neonBlue,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: transparent,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: linearGradient,
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: sizeDevice ? const EdgeInsets.fromLTRB(30, 180, 30, 0) : const EdgeInsets.fromLTRB(30, 160, 30, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 1000),
                    opacity: animate2 ? 1.0 : 0.0,
                    curve: Curves.bounceInOut,
                    child: const PageButton(
                      // styleFrom: styleFrom,
                      route: '/vision',
                      title: 'Notre\nVision',
                      // widget: VisionPage(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: animate2 ? 1.0 : 0.0,
                    curve: Curves.bounceIn,
                    child: const PageButton(
                      // styleFrom: styleFrom,
                      route: '/story',
                      title: 'Notre\nHistoire',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 1000),
                    opacity: animate2 ? 1.0 : 0.0,
                    curve: Curves.bounceIn,
                    child: const PageButton(
                      // styleFrom: styleFrom,
                      route: '/cgu',
                      title: 'Nos Conditions Générales\nd\'Utilisation',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 1000),
                    opacity: animate2 ? 1.0 : 0.0,
                    curve: Curves.bounceIn,
                    child: const PageButton(
                      // styleFrom: styleFrom,
                      route: '/cgv',
                      title: 'Nos Conditions Générales\nde Vente',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 900),
                    opacity: animate2 ? 1.0 : 0.0,
                    curve: Curves.bounceOut,
                    child: const PageButton(
                      // styleFrom: styleFrom,
                      route: '/terms',
                      title: 'Nos\nMentions Légales',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: animate2 ? 1.0 : 0.0,
                    curve: Curves.bounceIn,
                    child: const PageButton(
                      // styleFrom: styleFrom,
                      route: '/politics',
                      title: 'Nos Règles\nde Confidentialité',
                    ),
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // AnimatedOpacity(
                  //   duration: const Duration(milliseconds: 800),
                  //   opacity: animate2 ? 1.0 : 0.0,
                  //   curve: Curves.bounceIn,
                  //   child: const PageButton(
                  //     // styleFrom: styleFrom,
                  //     route: '/visual',
                  //     title: 'Visual',
                  //   ),
                  // ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PageButton extends StatefulWidget {
  const PageButton({
    super.key,
    // required this.styleFrom,
    required this.route,
    required this.title,
    // required this.widget,
  });

  // final ButtonStyle styleFrom;
  final String route;
  final String title;
  // final Widget widget;

  @override
  State<PageButton> createState() => _PageButtonState();
}

class _PageButtonState extends State<PageButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: splash.withOpacity(0.5),
          width: 2,
        ),
        color: transparent,
        // color: splash.withOpacity(0.3),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: splash.withOpacity(0.6),
            width: 5,
          ),
          color: transparent,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: splash.withOpacity(0.5),
              width: 2,
            ),
            color: transparent,
          ),
          width: 330,
          // width: MediaQuery.of(context).size.width > 500 ? 330 : double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(grey.withOpacity(0.1)),
              textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(
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
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.fromLTRB(0, 12, 0, 12),
              ),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            // style: styleFrom,
            onPressed: () {
              Navigator.pushReplacementNamed(context, widget.route);
              // Navigator.push(
              //   context,
              //   PageRouteBuilder(
              //     barrierDismissible: true,
              //     opaque: false,
              //     barrierColor: Colors.black.withOpacity(0.5),
              //     pageBuilder: (
              //       context,
              //       animation,
              //       secondaryAnimation,
              //     ) {
              //       return FadeTransition(
              //         opacity: animation,
              //         child: widget,
              //       );
              //     },
              //   ),
              // );
            },
            child: Text(
              widget.title,
              style: styleButton,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
