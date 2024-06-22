import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:terms_of_mapperz/pages/politics.dart';
import 'package:terms_of_mapperz/screens/showstores.dart';
import 'package:terms_of_mapperz/utilities/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class VisualPage extends StatefulWidget {
  const VisualPage({super.key});

  @override
  State<VisualPage> createState() => _VisualPageState();
}

class _VisualPageState extends State<VisualPage> {
  bool animate = false;
  bool bottom = false;
  bool remove = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        animate = true;
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
    // var sizeDevice = (MediaQuery.of(context).size.width > 800);
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: AnimatedSlide(
        offset: remove ? const Offset(0, 2) : const Offset(0, 0),
        duration: const Duration(milliseconds: 600),
        curve: Curves.fastLinearToSlowEaseIn,
        child: BottomAppBar(
          clipBehavior: Clip.hardEdge,
          padding: const EdgeInsets.all(0),
          // height: 50,
          surfaceTintColor: transparent,
          color: black.withOpacity(0.3),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Container(
              decoration: const BoxDecoration(color: transparent),
              clipBehavior: Clip.hardEdge,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //=> on ajoute un icone pour les stores (google play et app store)
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
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: transparent,
        surfaceTintColor: transparent,
        backgroundColor: black.withOpacity(0.3),
        toolbarHeight: 130,
        title: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 0,
                bottom: 30,
                child: AnimatedSlide(
                  offset: animate ? const Offset(0, 0) : const Offset(0, -4),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        remove = true;
                      });
                      Future.delayed(const Duration(milliseconds: 300), () {
                        Navigator.pushReplacementNamed(context, '/homepage');
                      });
                      // Navigator.pushReplacementNamed(context, '/homepage');
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 25,
                      // weight: 60,
                      shadows: [
                        Shadow(
                          blurRadius: 20.0,
                          color: neonBlue,
                        ),
                        Shadow(
                          blurRadius: 10.0,
                          color: neonBlue,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
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
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: transparent,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: transparent,
            boxShadow: [
              BoxShadow(
                color: splash.withOpacity(0.4),
                // color: splash.withOpacity(0.3),
                blurRadius: 25,
                spreadRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: splash.withOpacity(0.5),
              width: 2,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: splash.withOpacity(0.7),
                width: 5,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: white.withOpacity(0.6),
                boxShadow: [
                  BoxShadow(
                    color: white.withOpacity(0.7),
                    // color: splash.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
                // color: black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: splash.withOpacity(0.5),
                  width: 2,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(
                  left: 40,
                  right: 40,
                  top: 0,
                  bottom: 0,
                ),
                child: Text(
                  'Mapperz',
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
                        blurRadius: 1.0,
                        color: black,
                        offset: Offset(1, -1),
                      ),
                      Shadow(
                        blurRadius: 2.0,
                        color: black,
                        offset: Offset(4, -4),
                      ),
                      Shadow(
                        blurRadius: 3.0,
                        color: deepPurple,
                        offset: Offset(3, -3),
                      ),
                      Shadow(
                        blurRadius: 20.0,
                        color: deepPurple,
                      ),
                      Shadow(
                        blurRadius: 2.0,
                        color: deepPurple,
                      ),
                      Shadow(
                        blurRadius: 1.0,
                        color: splash,
                        offset: Offset(1, -1),
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
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),

        // Container(
        //   // height: double.infinity,
        //   decoration: const BoxDecoration(
        //     // gradient: linearGradient,
        //     color: transparent,
        //   ),
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: transparent,
        //       boxShadow: [
        //         BoxShadow(
        //           color: neonBlue.withOpacity(0.1),
        //           // color: splash.withOpacity(0.3),
        //           blurRadius: 30,
        //           spreadRadius: 5,
        //         ),
        //       ],
        //       borderRadius: BorderRadius.circular(30),
        //       border: Border.all(
        //         color: splash.withOpacity(0.6),
        //         width: 2,
        //       ),
        //     ),
        //     child: Container(
        //       decoration: BoxDecoration(
        //         color: Colors.transparent,
        //         borderRadius: BorderRadius.circular(25),
        //         border: Border.all(
        //           color: splash.withOpacity(0.7),
        //           width: 5,
        //         ),
        //       ),
        //       child: Container(
        //         decoration: BoxDecoration(
        //           color: white.withOpacity(0.09),
        //           borderRadius: BorderRadius.circular(15),
        //           border: Border.all(
        //             color: splash.withOpacity(0.6),
        //             width: 2,
        //           ),
        //         ),
        //         child: const Padding(
        //           padding: EdgeInsets.only(
        //             left: 40,
        //             right: 40,
        //             top: 0,
        //             bottom: 0,
        //           ),
        //           child: Text(
        //             'Mapperz',
        //             style: TextStyle(
        //               fontFamily: 'Megrim',
        //               color: white,
        //               shadows: <Shadow>[
        //                 Shadow(
        //                   blurRadius: 2.0,
        //                   color: deepPurple,
        //                   offset: Offset(2, -2),
        //                 ),
        //                 Shadow(
        //                   blurRadius: 4.0,
        //                   color: deepPurple,
        //                   offset: Offset(4, -4),
        //                 ),
        //                 Shadow(
        //                   blurRadius: 5.0,
        //                   color: deepPurple,
        //                   offset: Offset(5, -5),
        //                 ),
        //                 Shadow(
        //                   blurRadius: 3.0,
        //                   color: deepPurple,
        //                   offset: Offset(3, -3),
        //                 ),
        //                 // Shadow(
        //                 //   blurRadius: 17.0,
        //                 //   color: deepPurple,
        //                 // ),
        //                 Shadow(
        //                   blurRadius: 1.0,
        //                   color: deepPurple,
        //                 ),
        //                 Shadow(
        //                   blurRadius: 4.0,
        //                   color: deepPurple,
        //                 ),
        //                 Shadow(
        //                   blurRadius: 1.0,
        //                   color: deepPurple,
        //                   offset: Offset(1, -1),
        //                 ),
        //                 Shadow(
        //                   blurRadius: 4.0,
        //                   color: white,
        //                   // offset: Offset(1, -1),
        //                 ),
        //                 Shadow(
        //                   blurRadius: 2.0,
        //                   color: white,
        //                   offset: Offset(1, -1),
        //                 ),
        //                 Shadow(
        //                   blurRadius: 2.0,
        //                   color: neonBlue,
        //                   offset: Offset(2, -2),
        //                 ),
        //                 Shadow(
        //                   blurRadius: 1.0,
        //                   color: neonBlue,
        //                   offset: Offset(1, -1),
        //                 ),
        //               ],
        //               fontSize: 80,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}

// Container(
//                   decoration: BoxDecoration(
//                     color: black,
//                     boxShadow: [
//                       BoxShadow(
//                         color: splash.withOpacity(0.4),
//                         // color: splash.withOpacity(0.3),
//                         blurRadius: 25,
//                         spreadRadius: 5,
//                       ),
//                     ],
//                     borderRadius: BorderRadius.circular(30),
//                     border: Border.all(
//                       color: splash.withOpacity(0.6),
//                       width: 2,
//                     ),
//                   ),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.transparent,
//                       borderRadius: BorderRadius.circular(25),
//                       border: Border.all(
//                         color: splash.withOpacity(0.7),
//                         width: 5,
//                       ),
//                     ),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: black,
//                         borderRadius: BorderRadius.circular(15),
//                         border: Border.all(
//                           color: splash.withOpacity(0.6),
//                           width: 2,
//                         ),
//                       ),
//                       child: const Padding(
//                         padding: EdgeInsets.only(
//                           left: 40,
//                           right: 40,
//                           top: 0,
//                           bottom: 0,
//                         ),
//                         child: Text(
//                           'Mapperz',
//                           style: TextStyle(
//                             fontFamily: 'Megrim',
//                             color: white,
//                             shadows: <Shadow>[
//                               Shadow(
//                                 blurRadius: 2.0,
//                                 color: deepPurple,
//                                 offset: Offset(2, -2),
//                               ),
//                               Shadow(
//                                 blurRadius: 3.0,
//                                 color: deepPurple,
//                                 offset: Offset(3, -3),
//                               ),
//                               Shadow(
//                                 blurRadius: 17.0,
//                                 color: deepPurple,
//                               ),
//                               Shadow(
//                                 blurRadius: 1.0,
//                                 color: deepPurple,
//                               ),
//                               Shadow(
//                                 blurRadius: 7.0,
//                                 color: deepPurple,
//                               ),
//                               Shadow(
//                                 blurRadius: 1.0,
//                                 color: deepPurple,
//                                 offset: Offset(1, -1),
//                               ),
//                               Shadow(
//                                 blurRadius: 4.0,
//                                 color: white,
//                                 // offset: Offset(1, -1),
//                               ),
//                             ],
//                             fontSize: 80,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
