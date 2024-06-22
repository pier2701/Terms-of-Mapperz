import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:terms_of_mapperz/pages/politics.dart';
import 'package:terms_of_mapperz/screens/showstores.dart';
import 'package:terms_of_mapperz/utilities/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class CgvPage extends StatefulWidget {
  const CgvPage({super.key});

  @override
  State<CgvPage> createState() => _CgvPageState();
}

class _CgvPageState extends State<CgvPage> {
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
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Nos Conditions Générales de Vente',
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
                        "   Mapperz est une application mobile en téléchargement gratuit sur Apple Store.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   Elle propose une version gratuite Freemium et une version payante Premium.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "   Lorsqu'un utilisateur crée un compte sur l'application, il est automatiquement enregistré en tant qu'utilisateur Freemium.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "   Pendant les 7 premiers jours, ce dernier pourra créer et participer à un nombre illimité d'événements, sans aucune restriction. Au-delà de cette période, il sera limité à 3 créations d'événements et 3 participations par mois.",
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        """
  La version Freemium est gratuite et permet d'accéder à certaines fonctionnalités de l'application, mais avec un nombre limité de créations d'événements et de participants.
                  
  La version Premium est un abonnement mensuel et sans engagement, qui permet d'accéder à toutes les fonctionnalités de l'application, sans aucune limitation.
  Voici les fonctionnalités supplémentaires de la version Premium, en plus de la suppression des publicités :
                          
    - création illimitée de Events
    - participation illimitée aux Events
    - personnalisation du Event avec une photo, un flyer, une affiche, un logo, etc...
    - possibilité de rajouter un lien vers un site web, une page Pro, une billetterie, un réseau social, etc...
    - créer un Event avec la possibilité de retirer un Participant selon vos critères, profil incompatible, parité homme/femme, place limitée, etc...
    - mettre en avant un Lieu ou une Activité que vous adorez ou que vous recommandez, sur la carte pour que les autres utilisateurs puissent le découvrir
    - zoom sur la photo d'un profil, obtenir l'itinéraire d'un Event planifié ou d'un Lieu Favori proposé par un utilisateur, ajouter un Event planifié à votre calendrier
    - possibilité de rajouter un commentaire sur un Lieu ou une Activité

    Que vous soyez un particulier, un professionnel ou un indépendant, vous pouvez souscrire à un abonnement Premium pour profiter pleinement de l'application.
  Le prix sera le même pour tous les utilisateurs permettant ainsi une équité de traitement et offrant une expérience optimale quel que soit le statut de l'utilisateur.
  Soit 3.99€ par mois.
                  
    Comme tout abonnement, il sera renouvelé automatiquement à la fin de chaque période d'abonnement à partir de la date initiale de souscription.
                  
    Le paiement est effectué via le compte Apple Store, selon votre appareil.
    Chaque utilisateur est responsable de la gestion de son abonnement et de son renouvellement, il ne pourra souscrire qu'à un seul abonnement à la fois lié à son adresse mail et/ou son compte Apple Store.
    Nous n'avons pas accès aux informations de paiement de nos utilisateurs, ni à leur compte Apple Store. 
    Nous ne pouvons pas non plus gérer les abonnements de nos utilisateurs, ni les annuler pour eux.
    Vous pourrez vous rapporter aux conditions générales de vente et d'utilisation de Apple Store pour plus d'informations, en lien ci-dessous.
                          """,
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: splash.withOpacity(0.3),
                                width: 2,
                              ),
                            ),
                            width: 320,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent,
                                ),
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                ),
                              ),
                              child: Text(
                                "Conditions d'utilisation de Apple Store",
                                style: styleText2,
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () async {
                                if (!await launchUrl(
                                  Uri.parse(
                                    "https://www.apple.com/legal/internet-services/itunes/fr/terms.html",
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
                        height: 30,
                      ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(30),
                      //     border: Border.all(
                      //       color: splash.withOpacity(0.3),
                      //       width: 2,
                      //     ),
                      //   ),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(25),
                      //       border: Border.all(
                      //         color: splash.withOpacity(0.4),
                      //         width: 6,
                      //       ),
                      //     ),
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(15),
                      //         border: Border.all(
                      //           color: splash.withOpacity(0.3),
                      //           width: 2,
                      //         ),
                      //       ),
                      //       width: 320,
                      //       child: TextButton(
                      //         style: ButtonStyle(
                      //           backgroundColor: MaterialStateProperty.all<Color>(
                      //             Colors.transparent,
                      //           ),
                      //           padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      //             const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      //           ),
                      //         ),
                      //         child: Text(
                      //           "Conditions d'utilisation de Google Play",
                      //           style: styleText2,
                      //           textAlign: TextAlign.center,
                      //         ),
                      //         onPressed: () async {
                      //           if (!await launchUrl(
                      //             Uri.parse(
                      //               "https://play.google.com/intl/ALL_fr/about/play-terms/",
                      //             ),
                      //           )) {
                      //             if (kDebugMode) print('Could not launch URL');
                      //           }
                      //         },
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      Text(
                        """
    Vous pourrez annuler votre abonnement à tout moment, mais aucun remboursement ne sera effectué pour la période en cours.
    Après votre résiliation et la fin de la période en cours, vous basculerez automatiquement sur la version Freemium de l'application.
                          
    L'application Mapperz et son éditeur se réservent le droit de suspendre l'accès un abonnement à tout moment, et ce sans préavis, en cas de non-respect des conditions générales de vente et/ou des conditions générales d'utilisation de l'application par l'utilisateur.
    Conditions pouvant entrainer la suspension de l'accès à l'abonnement : 
                          
    - Utilisation frauduleuse de l'application
    - Non-respect des droits d'auteur
    - Non-respect des droits à l'image
    - Non-respect des droits à la vie privée
    - Non-respect des droits de propriété intellectuelle
    - Non-respect des droits de tiers
    - Non-respect des lois et règlements en vigueur
    - Non-respect des conditions générales d'utilisation de l'application
                  
    Les paiements acquittés auprès de Apple Store ne sont pas remboursables et seront définitivement acquis par Mapperz et son éditeur.
    La résiliation de l'abonnement n'entraîne pas le remboursement des sommes déjà versées.
                  
    Pour plus d'informations, veuillez consulter les conditions générales de vente de Apple Store.
                  
    Nous vous laisserons un lien pour vous désabonner de Apple Store.
                          """,
                        style: styleText,
                        textAlign: TextAlign.start,
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: splash.withOpacity(0.3),
                                width: 2,
                              ),
                            ),
                            width: 280,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent,
                                ),
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                ),
                              ),
                              child: Text(
                                "Se désabonner de Apple Store",
                                style: styleText2,
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () async {
                                if (!await launchUrl(
                                  Uri.parse(
                                    "https://support.apple.com/fr-fr/HT202039",
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
                        height: 30,
                      ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(30),
                      //     border: Border.all(
                      //       color: splash.withOpacity(0.3),
                      //       width: 2,
                      //     ),
                      //   ),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(25),
                      //       border: Border.all(
                      //         color: splash.withOpacity(0.4),
                      //         width: 5,
                      //       ),
                      //     ),
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(15),
                      //         border: Border.all(
                      //           color: splash.withOpacity(0.3),
                      //           width: 2,
                      //         ),
                      //       ),
                      //       width: 280,
                      //       child: TextButton(
                      //         style: ButtonStyle(
                      //           backgroundColor: MaterialStateProperty.all<Color>(
                      //             Colors.transparent,
                      //           ),
                      //           padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      //             const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      //           ),
                      //         ),
                      //         child: Text(
                      //           "Se désabonner du Google Play",
                      //           style: styleText2,
                      //           textAlign: TextAlign.center,
                      //         ),
                      //         onPressed: () async {
                      //           if (!await launchUrl(
                      //             Uri.parse(
                      //               "https://support.google.com/googleplay/answer/7018481?hl=fr&ref_topic=1689236",
                      //             ),
                      //           )) {
                      //             if (kDebugMode) print('Could not launch URL');
                      //           }
                      //         },
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      Text(
                        "Ou depuis l'application",
                        style: styleText,
                        textAlign: TextAlign.center,
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
                            image: AssetImage('assets/images/unsubscribe.webp'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 140,
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
