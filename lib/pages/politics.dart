import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:terms_of_mapperz/screens/showstores.dart';
import 'package:terms_of_mapperz/utilities/constant.dart';
import 'package:url_launcher/url_launcher.dart';

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries.map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
}

final Uri emailUri = Uri(
  scheme: 'mailto',
  path: 'miageru00@gmail.com',
  query: encodeQueryParameters(<String, String>{
    'subject': 'Contact via le site Mapperz',
    'body': '',
  }),
);

class PoliticsPage extends StatefulWidget {
  const PoliticsPage({super.key});

  @override
  State<PoliticsPage> createState() => _PoliticsPageState();
}

class _PoliticsPageState extends State<PoliticsPage> {
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
    var sizeDevice = (MediaQuery.of(context).size.width > 800);

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
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: linearGradient,
        ),
        child: Theme(
          data: ThemeData(
            scrollbarTheme: ScrollbarThemeData(
              thickness: MaterialStateProperty.all(5),
              thumbColor: MaterialStateProperty.all(Colors.white.withOpacity(0.2)),
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Center(
              child: Padding(
                padding: sizeDevice ? const EdgeInsets.fromLTRB(200, 130, 200, 15) : const EdgeInsets.fromLTRB(20, 130, 20, 10),
                child: AnimatedSlide(
                  offset: animate ? const Offset(0, 0) : const Offset(0, 3),
                  duration: const Duration(milliseconds: 1300),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Nos Règles de confidentialité',
                        style: styleTitle,
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        height: 30,
                        color: eventPage.withOpacity(0.7),
                        thickness: 1,
                        indent: 50,
                        endIndent: 50,
                      ),
                      Text(
                        "   Mapperz est une application mobile éditée par «Miageru», dénomination commerciale de la micro-entreprise MAI Chi Cuong\nnuméro SIRET 537 836 751 00033\ndont le siège social est situé au 12 rue Boussairolles 34000 Montpellier, France.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   Le terme Application s’applique à l’application pour mobile Android et iOS nommée Mapperz.\nLe terme Serveur Mapperz s’applique au composant logiciel édité par «Miageru» avec lequel communique l’Application.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   Le terme Utilisateur s’applique à toute personne physique ou morale utilisant l’Application ou le Serveur Mapperz.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   Le terme Données personnelles s’applique à toute information permettant d’identifier directement ou indirectement une personne physique.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   Nos règles de confidentialité expliquent quelles données nous collectons depuis l’Application et les raisons de cette collecte, comment nous utilisons ou traitons ces informations.\nNous ne collectons aucune information personnelle identifiable. Nous ne vendons pas, n’échangeons ni transférons ces informations à des tiers.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   En utilisant l’Application, vous acceptez la collecte et l’utilisation de vos données personnelles telles que décrites dans cette politique de confidentialité.\nCependant, l'Application s’appuie sur des logiciels fournis par d’autres éditeurs; leurs règles de confidentialité sont aussi applicables.\nNous vous invitons à consulter les règles de confidentialité de ces éditeurs.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Liens et règles de confidentialité des éditeurs tiers',
                        style: styleTitle,
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        height: 30,
                        color: eventPage.withOpacity(0.7),
                        thickness: 1,
                        indent: 50,
                        endIndent: 50,
                      ),
                      Text(
                        "Serveur Mapperz",
                        style: styleText,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: splash.withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: splash.withOpacity(0.4),
                              width: 5,
                            ),
                          ),
                          child: Container(
                            height: 45,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: splash.withOpacity(0.3),
                                width: 2,
                              ),
                            ),
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent,
                                ),
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                ),
                              ),
                              child: Text(
                                "Firebase",
                                style: styleText2,
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () async {
                                if (!await launchUrl(
                                  Uri.parse(
                                    "https://firebase.google.com/support/privacy?hl=fr",
                                  ),
                                )) {
                                  if (kDebugMode) {
                                    print('Could not launch URL');
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Affichage de la carte",
                        style: styleText,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: splash.withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: splash.withOpacity(0.4),
                              width: 5,
                            ),
                          ),
                          child: Container(
                            height: 45,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: splash.withOpacity(0.3),
                                width: 2,
                              ),
                            ),
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent,
                                ),
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                ),
                              ),
                              child: Text(
                                "Mapbox",
                                style: styleText2,
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () async {
                                if (!await launchUrl(
                                  Uri.parse(
                                    "https://www.mapbox.com/legal/privacy/",
                                  ),
                                )) {
                                  if (kDebugMode) print('Could not launch URL');
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Système d'abonnement",
                        style: styleText,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: splash.withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: splash.withOpacity(0.4),
                              width: 5,
                            ),
                          ),
                          child: Container(
                            height: 45,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: splash.withOpacity(0.3),
                                width: 2,
                              ),
                            ),
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent,
                                ),
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                ),
                              ),
                              child: Text(
                                "RevenueCat",
                                style: styleText2,
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () async {
                                if (!await launchUrl(
                                  Uri.parse(
                                    "https://www.revenuecat.com/privacy/#:~:text=We%20will%20disclose%20your%20personal,terms%20of%20this%20Privacy%20Policy",
                                  ),
                                )) {
                                  if (kDebugMode) print('Could not launch URL');
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Gestion des publicités",
                        style: styleText,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: splash.withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: splash.withOpacity(0.4),
                              width: 5,
                            ),
                          ),
                          child: Container(
                            height: 45,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: splash.withOpacity(0.3),
                                width: 2,
                              ),
                            ),
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent,
                                ),
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                ),
                              ),
                              child: Text(
                                "Google AdMob",
                                style: styleText2,
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () async {
                                if (!await launchUrl(
                                  Uri.parse(
                                    "https://policies.google.com/privacy?hl=fr",
                                  ),
                                )) {
                                  if (kDebugMode) print('Could not launch URL');
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Données personnelles lors de l\'inscription',
                        style: styleTitle,
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        height: 30,
                        color: eventPage.withOpacity(0.7),
                        thickness: 1,
                        indent: 50,
                        endIndent: 50,
                      ),
                      Text(
                        "   De part la nature de l'Application, nous collectons votre adresse e-mail et votre pseudo d'utilisateur.\nVous pouvez complèter votre profil par d'autres informations facultatives ( mini bio, hobbies, genre, âge ). Ces informations sont stockées sur le Serveur Mapperz et sont utilisées pour vous authentifier et vous identifier sur l'Application.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   Votre adresse e-mail ne sera ni communiquée à des tiers, ni visible par les autres utilisateurs de l'Application.\nToutefois, en cas de non respect des règles de l'Application, votre adresse e-mail pourra être communiquée à l'éditeur de l'Application ou aux autorités compétentes.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   Vous avez également la possibilité de choisir une photo de profil tout en respectant les règles de contenu de l'Application.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   Nous nous réservons le droit de supprimer tout contenu, ou compte, jugé inapproprié, violent, pornographique, raciste, diffamatoire ou contraire aux bonnes mœurs, sans préavis ni indemnité.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   L'utilisateur pourra faire l'objet de poursuites judiciaires à l'initiative de l'éditeur de l'Application ou de toute personne physique ou morale victime du contenu litigieux.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Données personnelles lors de l\'utilisation de l\'Application',
                        style: styleTitle,
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        height: 30,
                        color: eventPage.withOpacity(0.7),
                        thickness: 1,
                        indent: 50,
                        endIndent: 50,
                      ),
                      Text(
                        "   La géolocation est utilisée pour vous offrir une expérience utilisateur optimale. Que ce soit pour vous localiser sur la carte ou pour vous proposer des évènements à proximité.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   Vous avez également la possibilité de proposer des évènements autour de votre position, ou sur la carte, et de les partager avec les autres utilisateurs de l'Application. Ces évènements sont stockés sur le Serveur Mapperz et sont utilisés pour les afficher sur la carte.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   Lorsque vous vous connectez, nous collectons également des données sur votre appareil, notamment votre adresse IP, votre type d'appareil ainsi que ses données techniques.\nCes données sont uniquement utilisées pour offrir un bon fonctionnement de l'Application et pour des raisons de sécurité.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   Toutes ces mesures sont prises pour assurer la sécurité de vos données personnelles et empêcher qu'elles ne soient perdues, détournées, consultées, modifiées ou divulguées par erreur.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Permissions demandées par l’Application',
                        style: styleTitle,
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        height: 30,
                        color: eventPage.withOpacity(0.7),
                        thickness: 1,
                        indent: 50,
                        endIndent: 50,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   Lors de l’installation de l’Application, vous pouvez être informé des permissions requises par l’Application pour fonctionner correctement.\nVous pouvez accepter ou refuser ces permissions à tout moment depuis les paramètres de votre appareil.\nCependant, pour faire preuve de transparence, nous vous expliquons ici les raisons de ces permissions et comment elles sont utilisées.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   En accord avec les recommandations de la CNIL, Commission Nationale de l'Informatique et des Libertés, plutôt que de laisser le système d'exploitation de votre appareil vous demander les permissions au moment de l'installation, nous laissons l'utilisateur choisir les permissions qu'il souhaite accorder à l'Application, et ce, à tout moment.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 650,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          border: Border.fromBorderSide(
                            BorderSide(
                              color: Colors.white.withOpacity(0.2),
                              width: 2,
                            ),
                          ),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/appsettings.webp'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "   Toutefois, l’Application requiert obligatoirement l’accès à votre position géographique pour vous localiser sur la carte et vous proposer des évènements à proximité, de la même manière que d'autres applications de navigation ou de jeux utilisant la géolocalisation pour fonctionner.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   Vous pouvez choisir de ne pas partager votre position géographique en désactivant la géolocalisation dans les paramètres de votre appareil.\nDans ce cas, l’Application deviendra inutilisable.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   Votre position n’est pas stockée sur le Serveur Mapperz.\nLes autres utilisateurs de l’Application ne peuvent pas accéder à votre position géographique, seulement aux évènements que vous avez géolocalisés.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   L’Application requiert l’accès à votre bibliothèque de photos pour vous permettre de choisir une photo de profil ou d'ajouter une image pour illustrer un évènement.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   Vous pouvez choisir de recevoir des notifications de l’Application. Dans ce cas, l’Application requiert l’accès aux notifications de votre appareil.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "   Les notifications sont utilisées uniquement pour vous informer des messages reçus liés à vos créations d'évènements ou à ceux auxquels vous participez.\nVous recevez également des notifications pour vous informer d'une inscription ou d'une annulation à votre évènement.\n   Vous pouvez désactiver les notifications à tout moment dans les paramètres de l'Application, depuis la page de votre profil.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 650,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          border: Border.fromBorderSide(
                            BorderSide(
                              color: Colors.white.withOpacity(0.2),
                              width: 2,
                            ),
                          ),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/notifications.webp'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "   Les notifications ne sont pas utilisées à des fins publicitaires.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Cookies',
                        style: styleTitle,
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        height: 30,
                        color: eventPage.withOpacity(0.7),
                        thickness: 1,
                        indent: 50,
                        endIndent: 50,
                      ),
                      Text(
                        "   L’Application utilise des cookies persistants uniquement pour vous identifier et vous authentifier sur le Serveur Mapperz.\nCes cookies sont stockés sur votre appareil et ne sont pas accessibles par les autres utilisateurs de l’Application.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   Ils sont indispensables au bon fonctionnement de l'Application et vous permettent de rester connecté à votre compte entre les sessions. Les informations collectées via ces cookies ne sont pas utilisées à des fins publicitaires ou de suivi. Vous pouvez configurer votre navigateur pour bloquer les cookies, mais cela pourrait affecter certaines fonctionnalités de l'Application.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Conservation des données',
                        style: styleTitle,
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        height: 30,
                        color: eventPage.withOpacity(0.7),
                        thickness: 1,
                        indent: 50,
                        endIndent: 50,
                      ),
                      Text(
                        "   Les données personnelles collectées sont conservées sur le Serveur Mapperz et sont utilisées pour vous authentifier et vous identifier sur l’Application.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   Elles peuvent également être utilisées pour coopérer avec les autorités publiques et gouvernementales, les tribunaux ou les régulateurs conformément aux obligations légales.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   Mapperz utilise les données personnelles collectées pour se conformer à la loi, protéger ses droits et ceux de ses utilisateurs, et pour des raisons de sécurité.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   Vous pouvez demander à avoir accès à vos données personnelles, les modifier ou les supprimer, conformément à la loi n° 78-17 du 6 janvier 1978 relative à l'informatique, aux fichiers et aux libertés.\nPour cela, vous pouvez nous contacter à l’adresse suivante :\n   miageru00@gmail.com",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   En tant qu'éditeur de l'Application, nous sommes tenus de conserver les données personnelles des utilisateurs pour une durée de 1 an après la suppression du compte, conformément à l'article 6-I-5 de la loi n° 2004-575 du 21 juin 2004 pour la confiance dans l'économie numérique.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Modification de la politique de confidentialité',
                        style: styleTitle,
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        height: 30,
                        color: eventPage.withOpacity(0.7),
                        thickness: 1,
                        indent: 50,
                        endIndent: 50,
                      ),
                      Text(
                        "   Nous nous réservons le droit de modifier la présente politique de confidentialité à tout moment, en fonction des évolutions de l’Application, des lois et réglementations en vigueur, ou pour toute autre raison.\nNous vous invitons donc à consulter régulièrement cette page pour vous tenir informé des éventuelles modifications.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Contact',
                        style: styleTitle,
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        height: 30,
                        color: eventPage.withOpacity(0.7),
                        thickness: 1,
                        indent: 50,
                        endIndent: 50,
                      ),
                      Text(
                        "Pour toute question relative à la présente politique de confidentialité, vous pouvez nous contacter à l’adresse suivante :",
                        style: styleText,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // //=> on créé un bouton pour envoyer un mail à l'adresse de l'éditeur miageru00@gmail.com
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: splash.withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: splash.withOpacity(0.4),
                              width: 5,
                            ),
                          ),
                          child: Container(
                            height: 45,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: splash.withOpacity(0.3),
                                width: 2,
                              ),
                            ),
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent,
                                ),
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                ),
                              ),
                              child: Text(
                                "miageru00@gmail.com",
                                style: styleText2,
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () async {
                                if (!await launchUrl(emailUri)) {
                                  if (kDebugMode) print('Could not launch URL');
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 150,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
