import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:terms_of_mapperz/pages/politics.dart';
import 'package:terms_of_mapperz/screens/showstores.dart';
import 'package:terms_of_mapperz/utilities/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Un récit de résilience, d\'innovation et de connexion',
                        style: styleTitle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        """
    C’est avant tout l’histoire de Pierre, une profonde illustration de la résilience, de la réinvention et du pouvoir durable de la connexion humaine. Arrivé à Montpellier il y a 25 ans sans diplôme de fin d'études secondaires, il a su s'adapter aux défis de la vie en occupant divers petits boulots, principalement dans les bars, les restaurants et la vie nocturne animée de la ville.
                  
    Plongé dans l'ambiance électrique et gay-friendly de la ville, Pierre se souvient avec émotion de la facilité de faire des rencontres, que ce soit en journée ou sous le ciel étoilé. Même les rencontres les plus éphémères pouvaient dissiper la solitude et favoriser un sentiment d'appartenance à la communauté soudée du quartier historique de l'Écusson de Montpellier.
                  
    La vie a pris un tournant inattendu lorsque Pierre a rencontré sa future femme et fondé une famille. Ensemble, ils ont partagé de nombreuses expériences enrichissantes.
                  """,
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Un esprit d\'entrepreneur',
                        style: styleTitle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        """
    Animé par un esprit d'entrepreneur, Pierre a décidé de se lancer dans une aventure entrepreneuriale en pleine pandémie du COVID-19. Il s'est associé à d'autres personnes pour ouvrir un fast-food, une expérience qui a marqué un point d'orgue dans son parcours professionnel diversifié.
                  """,
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Un phare d\'espoir dans une période de limitations',
                        style: styleTitle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        """
    Guidés par leurs convictions, Pierre et sa famille ont pris la décision personnelle de ne pas se faire vacciner, optant pour une approche plus prudente. Cette décision a cependant eu des conséquences profondes. Pierre a perdu son emploi en raison de sa position, ce qui lui a effectivement interdit de poursuivre sa carrière choisie ou de se lancer dans d'autres domaines.
                  
    C'est dans ce contexte de difficultés et d'opportunités limitées que l'idée de Mapperz a germé dans l'esprit de Pierre. Il envisageait cette plateforme comme un pont pour connecter les gens dans leur environnement, favoriser des activités simples, renforcer les liens sociaux et lutter contre l'isolement.
                  """,
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Une plateforme née d\'expériences uniques',
                        style: styleTitle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        """
    Mapperz se distingue des autres applications de réseaux sociaux, notamment celles apparues suite aux effets du confinement, par ses origines singulières. L'application est née de l'expérience et des convictions personnelles de Pierre, suite à sa décision de ne pas recevoir le vaccin, qui a entraîné un changement important dans sa vie sociale. Cette expérience a motivé Pierre à créer une plateforme permettant aux individus partageant des expériences et des convictions similaires de se connecter, offrant un espace pour des interactions authentiques et un engagement social au-delà des contraintes imposées par les normes sociétales.
                  
    Les origines de Mapperz illustrent le pouvoir des expériences personnelles dans la création de la technologie. Elles nous rappellent que des idées innovantes peuvent souvent naître de circonstances difficiles, lorsque les individus cherchent à se connecter avec d'autres personnes partageant leurs perspectives et leurs expériences.
                  
    Déterminé à concrétiser sa vision, Pierre s'est inscrit à une formation à distance de développement web de 9 mois. Bien qu'il n'ait pas le baccalauréat, il a relevé le défi de créer un site web vitrine en l'espace de dix jours seulement. Guidé par les enseignements de Mathieu Nebra et utilisant l'ordinateur de son fils, Pierre a surmonté les obstacles et réalisé un projet remarquable qui lui a permis d'être admis à la formation.
                  
    Après avoir réussi sa formation, Pierre s'est équipé d'un ordinateur personnel avec le peu d'économie qui lui resté, puis s'est plongé dans les bases techniques pour obtenir son diplôme. Il s'est ensuite inveti tête baissée dans l'apprentissage, en autodidacte, du langage mobile multiplateforme Dart/Flutter, tout en élaborant le cahier des charges de Mapperz.
                  
    Le développement de l'application s'est étalé sur une année, se déroulant dans les rues animées et les quartiers vibrants au plus proche des gens. Pierre cherchait inconsciemment à raviver son amour pour la musique électronique minimaliste, à travers les mix de John Digweed ( Transitions ), Sasha et Nick Warren - une bande-son d'une époque de connexions sans effort.
                  
    Évitant l'utilisation de modèles, Pierre a méticuleusement façonné l'identité visuelle de Mapperz, lui insufflant un mélange de nostalgie et de l'esprit qu'il souhaitait transmettre, ce qui donne à l'application une identité unique.
                  """,
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Un voyage extraordinaire, de la résilience à la création',
                        style: styleTitle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        """
    Mapperz n'est pas né d'une simple idée de business ou d'une opportunité de marché. C'est l'aboutissement de la résilience de Pierre face à l'adversité, de sa volonté de se connecter avec d'autres personnes partageant des expériences similaires et de son désir de créer un impact positif sur le monde.
                  
    L'histoire de Pierre et Mapperz est un témoignage inspirant de ce que l'esprit humain peut accomplir lorsqu'il est confronté à des défis. C'est un rappel que même dans les moments les plus difficiles, il est possible de trouver l'inspiration, de développer de nouvelles compétences et de créer quelque chose de significatif.
                  """,
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const Text(
                        '___________________________',
                        style: TextStyle(
                          fontFamily: 'Courgette',
                          color: white,
                          shadows: [
                            Shadow(
                              blurRadius: 5.0,
                              color: neonBlue,
                            ),
                            Shadow(
                              blurRadius: 1.0,
                              color: neonBlue,
                              offset: Offset(1.1, -1.1),
                            ),
                            Shadow(
                              blurRadius: 2.0,
                              color: neonBlue,
                              offset: Offset(1.2, -1.2),
                            ),
                          ],
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Pierre de passage sur Divergence FM avec Olivier Nottale',
                        style: styleTitle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 400,
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
                            image: AssetImage('assets/images/radio.webp'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all<Color>(
                            Colors.transparent,
                          ),
                          surfaceTintColor: MaterialStateProperty.all<Color>(
                            Colors.transparent,
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent,
                          ),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          ),
                        ),
                        child: Text(
                          "Lien vers le podcast de Divergence FM",
                          // style: styleText2,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationThickness: 1.5,
                            decorationColor: white.withOpacity(0.3),
                            fontFamily: 'TiltNeon',
                            color: white,
                            // shadows: const <Shadow>[
                            //   Shadow(
                            //     blurRadius: 2.0,
                            //     color: neonYellow,
                            //   ),
                            //   Shadow(
                            //     blurRadius: 5.0,
                            //     color: white,
                            //   ),
                            // ],
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () async {
                          if (!await launchUrl(
                            Uri.parse(
                              "https://divergence-fm.org/podcasts/cest-quoi-mapperz/",
                            ),
                          )) {
                            if (kDebugMode) print('Could not launch URL');
                          }
                        },
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
