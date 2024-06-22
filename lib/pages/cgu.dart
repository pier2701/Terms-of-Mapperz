import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:terms_of_mapperz/pages/politics.dart';
import 'package:terms_of_mapperz/screens/showstores.dart';
import 'package:terms_of_mapperz/utilities/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class CguPage extends StatefulWidget {
  const CguPage({super.key});

  @override
  State<CguPage> createState() => _CguPageState();
}

class _CguPageState extends State<CguPage> {
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          'Nos Conditions Générales d\'Utilisation',
                          style: styleTitle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Divider(
                        height: 30,
                        color: eventPage.withOpacity(0.7),
                        thickness: 1,
                        indent: 50,
                        endIndent: 50,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "1. ACCEPTATION DES CONDITIONS GÉNÉRALES D'UTILISATION",
                        style: styleTitle2,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        """
                      En téléchargeant, installant ou utilisant l'application mobile Mapperz, vous acceptez pleinement et sans réserve les présentes conditions générales d'utilisation (CGU). Si vous n'acceptez pas ces CGU, veuillez ne pas télécharger, installer ou utiliser l'application.
                  
                      L'utilisation de l'application est également soumise au respect de la législation en vigueur et aux présentes CGU. L'utilisateur s'engage à utiliser l'application de manière licite et conforme aux présentes CGU, ainsi qu'aux droits des tiers.
                  
                      En acceptant les présentes CGU, vous reconnaissez avoir pris connaissance des conditions d'utilisation de l'application et vous vous engagez à les respecter intégralement.
                  """,
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "2. DESCRIPTION DE L'APPLICATION",
                        style: styleTitle2,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        """
                      Mapperz est une application mobile, disponible sur la plateforme Apple App Store en téléchargement gratuit, qui offre à ses utilisateurs la possibilité de créer des événements géolocalisés sur une carte, que ce soit à partir de leur position actuelle ou d'un emplacement défini.
                      Mapperz propose que des événements réels, physiques, solicitant une présence physique des participants, et non des événements virtuels ou en ligne.
                    
                      L'objectif principal de l'application est de faciliter l'interaction entre les utilisateurs et de renforcer les liens de proximité au sein d'une communauté. 
                  
                      En favorisant les interactions locales et en mettant en avant les vraies relations dans un quartier, une ville ou un village, Mapperz encourage les utilisateurs à créer et à entretenir des liens authentiques avec leur entourage. 
                  
                      En mettant l'accent sur les interactions humaines et la proximité géographique, Mapperz a pour ambition d'offrir une expérience enrichissante, où le numérique vient renforcer les relations humaines et non les remplacer.
                  """,
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "3. CRÉATION DE COMPTE ET UTILISATION",
                        style: styleTitle2,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        """
                  3.1    Pour utiliser l'application, les utilisateurs doivent créer un compte en fournissant leur adresse e-mail et en choisissant un mot de passe. Ils peuvent également se connecter via leur compte Google ou Apple.
                      Ils devront également choisir un pseudo unique pour leur profil. Bien que le reste des informations ne soit pas obligatoire, nous vous encourageons à fournir autant de détails que possible, car cela peut renforcer la confiance au sein de la communauté lors de la consultation des profils.
                  
                  3.2    L'utilisation de Mapperz nécessite l'activation de la géolocalisation afin d'accéder aux fonctionnalités de la carte interactive. 
                      Si vous préférez ne pas partager votre géolocalisation pour le moment, vous pouvez toujours revenir plus tard dans les paramètres de l'application pour activer cette fonctionnalité. Nous serons ravis de vous accueillir parmi nous lorsque vous serez prêt à partager votre position.
                      
                      Les notifications sont uniquement utilisées pour recevoir des messages liés aux événements créés par l'utilisateur ou auxquels il participe. 
                      
                      Nous tenons à vous assurer que ces données ne sont ni visibles, ni partagées, ni revendues à des tiers.
                      Pour plus de détails sur notre politique de confidentialité, veuillez vous référer à la page dédiée sur nos règles de confidentialité en revenant en arrière.    
                      
                  3.3    L'utilisation de Mapperz est réservée aux personnes âgées de 16 ans et plus. Les utilisateurs mineurs, soit moins de 18 ans, peuvent accéder à l'application sous la responsabilité et la supervision d'un parent ou d'un tuteur légal. Nous encourageons les parents et tuteurs légaux à surveiller l'utilisation de l'application par les mineurs et à les guider dans leur interaction avec celle-ci.
                  
                      Nous déclinons toute responsabilité pour l'utilisation de Mapperz par les utilisateurs mineurs. Les parents et tuteurs légaux sont responsables de surveiller et de superviser l'utilisation de l'application par les mineurs, et ils sont pleinement responsables de toutes les activités réalisées par les utilisateurs mineurs sous leur supervision.
                  
                  3.4    Les utilisateurs s'engagent à ne pas partager leur compte avec d'autres personnes et à ne pas utiliser le compte d'un tiers. Ils sont responsables de la confidentialité de leur mot de passe et de leur compte, et doivent informer immédiatement l'éditeur de toute utilisation non autorisée de leur compte ou de toute violation de la sécurité.
                      Les utlisateurs s'engagent à ne pas utiliser l'application à des fins illégales ou contraires aux présentes CGU. Ils s'engagent également à ne pas perturber le fonctionnement de l'application ou à nuire à l'expérience des autres utilisateurs.
                      Les utilisateurs sont responsables de leur utilisation de l'application et s'engagent à respecter les droits des tiers. Ils s'engagent également à ne pas violer les lois applicables au niveau local, national et international.
                  
                  3.5    Les établissements commerciaux sont autorisés à se géolocaliser pour mettre en avant des animations, activités ou tout autre événement susceptible de créer des interactions réelles et des rencontres entre les utilisateurs.
                      Cette fonctionnalité vise à promouvoir des initiatives locales et à encourager les interactions au sein de la communauté. Cependant, les établissements commerciaux sont tenus de respecter les lois et réglementations en vigueur concernant la publicité et la promotion de leurs services.
                  
                      Les travailleurs indépendants auront également le droit d'être visibles sur la plateforme, à condition de proposer une réelle activité ou attraction en rapport avec leur domaine et de la géolocaliser.
                      Cette mesure vise à encourager l'économie locale et à offrir aux utilisateurs une diversité d'initiatives et de services au niveau de leur localité. Il est attendu que ces travailleurs respectent les règles de qualité et de transparence dans la présentation de leurs activités.
                  
                  3.6    Mapperz ne facilite pas les transactions financières entre utilisateurs et ne prend aucune commission sur les activités proposées sur la plateforme. Tout échange financier ou transaction réalisé en dehors de l'application est de la seule responsabilité des parties impliquées. Les utilisateurs sont invités à faire preuve de discernement lorsqu'ils interagissent ou participent à des activités sur la plateforme.
                  
                      Mapperz propose uniquement un forfait Premium au prix de 3,99 euros par mois, géré par Apple App Store.
                      Ce prix égalitaire vise à offrir une expérience équitable à tous nos utilisateurs, quel que soit leur statut. 
                      Aucune autre transaction financière n'est autorisée ou gérée dans notre application. Pour plus de détails sur notre forfait Premium, veuillez vous référer à la page dédiée aux conditions générales de vente en revenant en arrière.
                  """,
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "4. RESPONSABILITÉ DE L'UTILISATEUR",
                        style: styleTitle2,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        """
                  4.1    L'utilisateur est seul responsable des contenus qu'il publie sur l'application, que ce soit des textes ou des images, ainsi que pendant les rencontres lors des événements avec les autres utilisateurs, et dans les lieux ou activités proposés.
                      
                      L'Utilisateur s'engage à ne pas mettre en ligne de contenus pouvant porter atteinte aux intérêts de tierces personnes. Tout recours en justice engagé par un tiers lésé contre l'éditeur ( Mapperz ) sera pris en charge par l'Utilisateur.
                      
                      L'utilisateur s'engage à respecter les droits des tiers et à ne pas publier de contenus diffamatoires, injurieux, obscènes, violents, racistes, discriminatoires, ou contraires aux bonnes mœurs.
                      Il s'engage à respecter les règles de la Netiquette ( règles de bonne conduite de l’internet ).
                      
                      L'utilisateur s'engage à fournir des informations exactes lors de la création de son compte et à ne pas usurper l'identité d'une autre personne.
                      Son pseudo ne doit pas être offensant, discriminatoire ou contraire aux bonnes mœurs, sous peine de voir son compte suspendu ou supprimé.
                  
                  4.2    L'utilisateur s'engage à ne pas rediriger les utilisateurs vers des sites ou des applications concurrents d'une manière qui violerait les droits de propriété intellectuelle de Mapperz ou les termes de ses conditions d'utilisation. Il reconnait que toute tentative de rediriger les utilisateurs vers des concurrents de quelconque manière peut constituer une forme de concurrence déloyale ou une violation des droits de propriété intellectuelle de Mapperz. En cas de non-respect de cet engagement, il est conscient que Mapperz se réserve le droit de prendre des mesures appropriées, y compris de recourir à des actions en justice pour protéger ses droits et obtenir réparation des dommages subis. 
                  
                  4.3    L'utilisateur s'engage à participer seulement aux événements auxquels il est inscrit, et à respecter les horaires et les consignes de sécurité éventuelles. Il peut annuler sa participation à tout moment de la même manière qu'il s'est inscrit.
                  
                  4.4    La version Premium offre des avantages pour organiser des événements de manière efficace et personnalisée. Cependant, nous tenons à rappeler l'importance de faire un usage responsable du pouvoir de retirer des participants d'un événement.
                      L'utilisateur Premium doit respecter les règles de courtoisie et de respect envers les autres participants, et ne doit pas exclure des personnes de manière abusive ou discriminatoire.
                      En cas de non-respect de ces règles, l'utilisateur Premium s'expose à des sanctions, y compris la suspension ou la suppression de son compte.
                      L'utilisateur, en tant que participant, s'engagera à respecter le choix de l'organisateur et à ne pas perturber le bon déroulement de l'événement au risque de subir les mêmes sanctions.
                          
                  4.5    L'utilisateur, en tant que participant, s'engage à respecter les règles de courtoisie et de respect lors des événements, et à ne pas perturber le bon déroulement des activités proposées.
                          
                  4.6    L'utilisateur, en tant qu'organisateur, s'engage à respecter les règles de sécurité et à informer les participants des risques éventuels liés à l'activité proposée. 
                      Il est responsable de la bonne organisation de l'événement, et s'engage à être présent et à veiller au bon déroulement de l'activité.
                      Les évènements doivent être créés dans le respect des lois et des règlements en vigueur, et ne doivent pas inciter à la violence, à la haine, à la discrimination ou à des comportements illégaux.
                      L'organisateur doit vérifier que l'activité qu'il propose ne contrevient à aucune loi ou réglementation en vigueur. Cela inclut, par exemple, le respect des règles de concurrence déloyale, des normes de sécurité, des règlementations professionnelles (par exemple, la nécessité d'être diplômé pour exercer certaines activités), et toute autre règle ou loi applicable à son activité.
                      L'organisateur doit évaluer les risques associés à son activité afin de s'assurer qu'elle ne met pas en danger la vie ou la sécurité des participants. Cela peut inclure la mise en place de mesures de sécurité appropriées, l'utilisation de matériel adéquat, et la prise en compte des conditions environnementales ou des capacités physiques des participants.
                      En proposant une activité ou un évènement, l'organisateur s'engage à assumer une certaine responsabilité légale envers les participants. Il est donc important qu'il prenne toutes les mesures nécessaires pour garantir la sécurité et le bien-être des participants, ainsi que pour éviter tout risque de litige ou de poursuite judiciaire.
                  
                      En tant qu'organisateur, l'utilisateur pourra aussi créer des évènements faciles à organiser, comme des sorties au parc, des pique-niques, des balades en ville, des visites de musées, des séances de sport en plein air, des ateliers créatifs, des rencontres autour d'un café, etc... Pas besoin d'être un professionnel pour organiser ce genre d'évènement, il suffit d'avoir envie de partager un moment convivial avec d'autres personnes.
                  
                      Chaque évènement doit être clairement décrit, avec des informations précises sur le lieu, la date, l'heure, le type d'activité, le nombre de participants attendus, et les éventuels frais à prévoir.
                      Ce qui représente un investissement personnel pour l'organisateur; et pour les participants, un investissement en temps et en énergie pour se rendre à l'évènement.
                      La messagerie interne lié à chaque événement permet de communiquer en cas de modification ou d'annulation de l'événement. 
                      Les participants sont invités à consulter régulièrement la messagerie pour être informés des éventuels changements si le système de notification ne fonctionne pas correctement ou si ce dernier est désactivé.
                  
                  4.7    Les participants sont invités à signaler toute absence, organisateur ou participant, pour que Mapperz puisse prendre les mesures nécessaires.
                      Pour le bon fonctionnement de l'application et le respect de la communauté, Mapperz se réserve le droit de suspendre ou de supprimer un compte en cas de non-respect des présentes CGU.
                  
                  4.8    L'utilisateur est responsable de sa propre sécurité lors des événements. Il doit prendre les précautions nécessaires pour éviter les accidents et les situations dangereuses.
                      Il devra également se prémunir contre les risques liés à la rencontre des autres utilisateurs, en choisissant des lieux publics et en informant un proche de sa localisation.
                      Il est recommandé de ne pas divulguer l'adresse de son domicile ou de son lieu de travail, ni de partager des informations personnelles sensibles lors de la création d'un événement.
                      Ce qui sous-entend qu'il est déconseillé de créer un évènement géolocalisé à son domicile ou à son lieu de travail.
                  
                  4.9    Dans la mesure où Mapperz ne peut garantir la fiabilité des utilisateurs, il est de la responsabilité de chacun de prendre les mesures nécessaires pour sa propre sécurité, et de signaler tout comportement suspect à l'éditeur ( Mapperz ) ou aux autorités compétentes.
                      L'application propose un moteur de recherche permettant de retrouver un utilisateur par son pseudo puis de le signaler en cas de comportement inapproprié.
                  
                  4.10    Mapperz n'est qu'un outil de mise en relation et ne peut être tenu responsable des actes des utilisateurs, ni des conséquences des rencontres ou des activités proposées.
                      Toute action pénalement répréhensible ou contraire à la loi devra être signalée aux autorités compétentes et entraînera la suppression du compte de l'utilisateur concerné.
                      Aucune poursuite judiciaire ne pourra être engagée contre l'éditeur ( Mapperz ) en cas de litige entre utilisateurs, ou en cas de dommages causés lors des événements.
                  
                  4.11    L'utilisateur s'engage à respecter les droits de propriété intellectuelle des contenus présents sur la plateforme.
                      Il comprend et accepte que toute reproduction totale ou partielle du contenu de l'application sans l'autorisation préalable de l'exploitant constitue une violation des droits d'auteur, conformément aux dispositions de l'article L 335-2 et suivants du Code de la propriété intellectuelle.
                      En cas de reproduction, copie ou publication de contenu protégé, l'utilisateur s'engage à citer l'auteur et la source, comme le prévoit l'article L122-5 du Code de la propriété intellectuelle.
                  
                  4.12    L'utilisateur s'engage à ne pas porter atteinte à la sécurité de l'application Mapperz, de l'éditeur et de ses utilisateurs.
                      À ce titre, il s'interdit notamment de pirater, modifier, altérer, endommager, ou introduire tout code malveillant ou programme informatique susceptible de perturber, altérer, ou compromettre le fonctionnement de l'application, des serveurs ou des systèmes informatiques de l'éditeur ou de ses utilisateurs.
                      L'utilisateur s'engage également à ne pas collecter, récupérer, ou exploiter de manière abusive ou non autorisée les informations personnelles ou confidentielles des autres utilisateurs de l'application.
                      En cas de violation de cette clause, l'utilisateur s'expose à des poursuites judiciaires et à des sanctions pénales conformément à la législation en vigueur.
                  
                  4.13    L'utilisateur reconnaît que s'il souhaite supprimer son compte sur l'application Mapperz ou désinstaller l'application, il est de sa responsabilité de gérer son abonnement Premium souscrit via les plateformes Google Play Store ou Apple App Store.
                      L'éditeur ne peut être tenu responsable des frais engagés par l'utilisateur en cas de non-resiliation de son abonnement Premium.
                  """,
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "5. DISPONIBILITÉ DE L'APPLICATION ET RESPONSABILITÉ DE L'ÉDITEUR",
                        style: styleTitle2,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        """
                  5.1     Mapperz met tout en œuvre pour assurer le bon fonctionnement de son service, mais ne peut garantir l'absence d'interruptions ou d'erreurs. L'application décline toute responsabilité en cas de dommages directs ou indirects causés par l'utilisation de son service.
                      L'éditeur n'est pas tenu de supporter les frais pour la connexion internet, le matériel ou les logiciels nécessaires à l'utilisation de l'application. L'utilisateur est seul responsable de ces coûts.
                  
                  5.2     L'Éditeur ne saurait être tenu responsable en cas d'impossibilité d'accès à l'Application due à des événements indépendants de sa volonté, tels que des problèmes sur les serveurs de l'Utilisateur, des incidents techniques ou des perturbations du réseau Internet.
                      L'Utilisateur reconnaît que l'engagement de l'Éditeur concernant la disponibilité de l'Application est soumis à une obligation de moyens, signifiant que l'Éditeur mettra tout en œuvre pour assurer la disponibilité de l'Application, mais ne peut garantir un accès ininterrompu dans toutes les circonstances.
                  
                  5.3     Dans le domaine des applications mobiles, un hébergeur désigne une plateforme ou un service qui fournit l'infrastructure et l'espace de stockage nécessaire pour héberger les données, le contenu et les fonctionnalités de l'application. L'hébergeur assure le fonctionnement et la disponibilité de l'application en permettant aux utilisateurs d'accéder aux services proposés.
                  
                    Dans le cas spécifique de Firebase, qui héberge l'application Mapperz, l'infrastructure est fournie par Google Ireland Limited, une société de droit irlandais immatriculée en Irlande. Les coordonnées de Google Ireland Limited sont les suivantes :
                  
                    Google Ireland Limited
                    Gordon House, Barrow Street
                    Dublin 4
                    Irlande
                  
                    La société est enregistrée sous le numéro d'immatriculation 368047 et dispose d'un numéro de TVA IE6388047V.
                  
                    L'hébergeur est responsable de la maintenance de l'infrastructure sous-jacente, de la sécurité des données, de la sauvegarde des informations et de la gestion des performances de l'application. Il joue un rôle essentiel dans la garantie de la disponibilité et de la fiabilité de l'application pour les utilisateurs finaux.
                  
                    En résumé, l'hébergeur d'une application mobile, tel que Firebase fourni par Google Ireland Limited, assure le bon fonctionnement de l'application en mettant à disposition une infrastructure robuste et sécurisée.
                  
                  5.4    Malgré nos meilleurs efforts, il est important de reconnaître que des événements indépendants de notre contrôle peuvent entraîner une interruption temporaire de nos services. Les cas de force majeure peuvent inclure, sans s'y limiter, les catastrophes naturelles, les pannes de réseau, les cyberattaques, les conflits sociaux ou les décisions gouvernementales.
                  
                      Dans de telles circonstances, nous déclinons toute responsabilité pour les conséquences résultant de l'interruption des services. En aucun cas, l'éditeur de l'application ne pourra être tenu responsable des dommages, pertes ou préjudices subis par les utilisateurs ou les tiers en raison de ces événements indépendants de notre volonté.
                  
                  Nous vous prions de comprendre que notre responsabilité est limitée à la fourniture de nos services dans la mesure du possible, et que nous ne pouvons garantir une disponibilité ininterrompue en toutes circonstances. En utilisant notre application, vous acceptez de décharger l'éditeur de toute responsabilité découlant de ces cas de force majeure.
                  
                  5.5     L'application Mapperz s'efforce de fournir des informations fiables, cependant, elle ne garantit pas l'absence de défauts, d'erreurs ou d'omissions. Les informations présentées sur l'application sont fournies à titre indicatif et général et n'ont aucune valeur contractuelle.
                  
                    Malgré nos efforts pour maintenir les informations à jour, l'application Mapperz décline toute responsabilité en cas de modification des dispositions administratives ou juridiques intervenant après la publication des informations. De même, nous ne pouvons être tenus responsables de l'utilisation ou de l'interprétation des informations contenues dans l'application.
                  
                    Nous vous encourageons à vérifier les informations auprès de sources officielles ou à consulter un professionnel qualifié si vous avez des questions spécifiques. L'application Mapperz ne peut garantir l'exactitude, l'exhaustivité ou la pertinence des informations fournies et décline toute responsabilité pour les conséquences de leur utilisation.
                  """,
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "6. LIENS VERS DES SITES TIERS",
                        style: styleTitle2,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        """
                  6.1       Des liens hypertextes peuvent être présents sur l'application Mapperz, notamment lors d'évènements proposés par d'autres utilisateurs, établissements commerciaux ou travailleurs indépendants.
                  
                  6.2       L’Utilisateur est informé qu'en cliquant sur ces liens, il pourrait quitter l'application Mapperz. Nous tenons à souligner que Mapperz n'a aucun contrôle sur le contenu des pages web vers lesquelles ces liens dirigent, et par conséquent, nous déclinons toute responsabilité quant à leur contenu.
                  
                  6.3       Toute information accessible via un lien vers d'autres sites n'est pas sous le contrôle de l'Editeur, qui décline toute responsabilité en cas de dommages techniques, de pertes de données, de préjudices moraux, ou de tout autre dommage résultant de l'utilisation de ces liens.
                  """,
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "7. MODÉRATION AUTOMATISÉE ET COMMUNAUTAIRE",
                        style: styleTitle2,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        """
                  7.1       Mapperz met en œuvre un système de modération automatisée et communautaire pour surveiller les contenus publiés sur sa plateforme, en accord avec la loi n°2004-575 du 21 juin 2004 pour la confiance dans l'économie numérique, notamment son article 6. La mise en place de cette modération s'inscrit dans le cadre légal établi par cette loi, qui régit la responsabilité des hébergeurs en ligne. 
                  
                  7.2       Conformément à cette réglementation, Mapperz est considéré comme un hébergeur et n'est pas responsable des contenus publiés par les utilisateurs, mais il est tenu d'agir promptement pour retirer tout contenu illicite, offensant ou contraire aux bonnes mœurs dès qu'il en a connaissance.
                  
                  7.3       Ce système analyse automatiquement les contenus textuels et visuels afin de détecter toute violation des règles de la plateforme, telles que la présence de contenus illicites, offensants, ou portant atteinte aux droits de propriété intellectuelle.
                  
                  7.4       En complément, Mapperz permet à ses utilisateurs de signaler tout contenu inapproprié ou préoccupant à travers un bouton de signalement intégré dans l'application.
                      Les signalements ainsi recueillis sont examinés par l'Editeur, qui prend les mesures appropriées en cas de violation avérée des règles de la plateforme. Cet engagement envers la modération vise à assurer un environnement numérique sûr, respectueux et conforme aux normes légales, tout en préservant une expérience positive pour l'ensemble des utilisateurs de Mapperz.
                  
                  7.5       En cas de signalement d'un contenu inapproprié, l'Editeur se réserve le droit de supprimer le contenu en question, de suspendre ou de supprimer le compte de l'utilisateur concerné, et de prendre toute mesure nécessaire pour garantir le respect des règles de la plateforme.
                  """,
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "8. MODIFICATION DES CONDITIONS GÉNÉRALES D'UTILISATION",
                        style: styleTitle2,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        """
                  8.1       Mapperz se réserve le droit de modifier à tout moment les présentes Conditions Générales d'Utilisation (CGU) afin de les adapter aux évolutions légales, techniques ou fonctionnelles de la plateforme, ainsi qu'aux besoins des utilisateurs. Toute modification des CGU sera effective dès sa parution.
                          
                  8.2       Il est recommandé aux utilisateurs de consulter régulièrement les CGU pour prendre connaissance des éventuelles mises à jour. Les CGU applicables sont celles en vigueur à la date d'utilisation de la plateforme par l'utilisateur.
                          
                  8.3       Si un utilisateur n'accepte pas les nouvelles CGU, il devra cesser toute utilisation de la plateforme. En continuant à utiliser l'application après la publication des nouvelles CGU, l'utilisateur accepte les modifications apportées aux conditions d'utilisation.
                  """,
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "9. PROPRIÉTÉ INTELLECTUELLE ET DROITS D'AUTEUR",
                        style: styleTitle2,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        """
                  9.1       Mapperz est une application mobile qui offre une plateforme permettant aux utilisateurs de créer, découvrir et participer à des événements localisés sur une carte interactive.
                      L'application offre des fonctionnalités avancées telles que la création d'événements personnalisés avec des détails spécifiques tels que la date, l'heure, la localisation géographique et la description de l'événement. De plus, Mapperz permet aux utilisateurs de communiquer entre eux via une messagerie dédiée à chaque événement, facilitant ainsi la coordination et l'organisation.
                  
                  9.2       Une caractéristique de Mapperz est sa capacité à mettre en avant des lieux ou des activités sur la carte, permettant aux utilisateurs de découvrir des points d'intérêt à proximité et de partager leurs expériences avec d'autres membres de la communauté. 
                      Les utilisateurs peuvent également ajouter des commentaires ou des avis sur les lieux visités, offrant ainsi une expérience interactive et collaborative.
                          
                  9.3     En termes de propriété intellectuelle, certains éléments de Mapperz, tels que son algorithme de localisation, son interface utilisateur, ses fonctionnalités spécifiques et ses caractéristiques uniques, peuvent être protégés par des droits de propriété intellectuelle.
                      De plus, les marques, les logos et les noms commerciaux associés à Mapperz peuvent également bénéficier d'une protection en tant que propriété intellectuelle.
                          
                  9.4     Cependant, il est important de noter que les idées générales, les concepts abstraits et les fonctionnalités de base de toute application mobile ne sont généralement pas protégés par des droits de propriété intellectuelle et peuvent être utilisés par d'autres développeurs pour créer des applications similaires.
                      Par conséquent, la protection de Mapperz réside principalement dans ses aspects uniques et distinctifs, ainsi que dans tout élément spécifique qui peut être légalement protégé en vertu des lois applicables sur la propriété intellectuelle.
                          
                  9.5     En utilisant l'application Mapperz, l'utilisateur reconnaît et accepte que tous les contenus qu'il publie demeurent sa propriété intellectuelle exclusive. Cependant, en publiant du contenu sur l'application Mapperz, l'utilisateur accorde à l'éditeur de l'application une licence mondiale, non exclusive, libre de redevance, perpétuelle, irrévocable et transférable pour utiliser, reproduire, adapter, modifier, distribuer, afficher et exploiter le contenu de quelque manière que ce soit, dans le cadre de la fourniture des services de l'application Mapperz.
                          
                      Cette licence permet à l'éditeur de l'application d'agir en tant qu'hébergeur et de faciliter la diffusion et la visualisation du contenu par les autres utilisateurs de l'application. L'utilisateur comprend que cette licence permet également à l'éditeur de réaliser des modifications techniques nécessaires pour adapter et afficher le contenu sur différentes plateformes et appareils.
                      En utilisant l'application Mapperz, l'utilisateur déclare et garantit qu'il détient tous les droits nécessaires pour publier le contenu sur l'application Mapperz et accorder la licence susmentionnée à l'éditeur de l'application, et qu'il n'enfreint aucun droit de tiers en publiant ce contenu. 
                      L'utilisateur s'engage à indemniser et à dégager de toute responsabilité l'éditeur de l'application contre toute réclamation de tiers découlant de son contenu ou de son utilisation de l'application Mapperz.
                          
                  9.6     L'éditeur de l'application respecte les droits de propriété intellectuelle des tiers et s'engage à retirer tout contenu publié sur l'application Mapperz qui enfreint les droits de propriété intellectuelle d'autrui dès qu'il en est informé.
                      En utilisant l'application Mapperz, l'utilisateur accepte et consent à cette politique de propriété intellectuelle et reconnaît que celle-ci fait partie intégrante des conditions générales d'utilisation de l'application Mapperz.
                  
                  9.7     Mapperz et tous les éléments qui le composent, y compris mais sans s'y limiter, le nom de l'application, le design, le code source, les fonctionnalités, les logos et tout autre contenu, sont protégés par des lois sur la propriété intellectuelle, y compris les droits d'auteur, les marques déposées et autres droits similaires.
                      Le nom de l'application "Mapperz" est une marque déposée auprès de l'Institut National de la Propriété Industrielle (INPI) et son utilisation non autorisée est strictement interdite. En utilisant Mapperz, vous reconnaissez et acceptez que toute utilisation non autorisée de la propriété intellectuelle associée à Mapperz peut entraîner des poursuites judiciaires.
                      """,
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "10. DROIT APPLICABLE, JURIDICTION COMPÉTENTE, LANGUE DES CONDITIONS GÉNÉRALES D'UTILISATION ET RÈGLEMENT DES LITIGES",
                        style: styleTitle2,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        """
                        Les présentes conditions générales d'utilisation sont régies et interprétées conformément au droit français.
                          
                  Toute réclamation, en cas de litige, pourra se faire soit par voie électronique, soit par voie postale dont les coordonnées sont disponibles dans la section des mentions légales.
                          
                  Tout litige découlant des présentes conditions générales d'utilisation ou en relation avec celles-ci, y compris les litiges relatifs à leur validité, leur interprétation, leur exécution ou leur résiliation, sera soumis à la compétence exclusive des tribunaux de Montpellier, France.
                          
                  Les parties conviennent de rechercher une solution amiable à tout litige survenant dans le cadre des présentes conditions générales d'utilisation. En cas d'échec de cette tentative de résolution amiable dans un délai de 30 jours à compter de la notification écrite d'un litige, ledit litige sera soumis à la juridiction exclusive des tribunaux de Montpellier, France.
                  
                  Si une partie des CGU est jugée invalide ou inapplicable en vertu de la loi applicable, y compris, mais sans s'y limiter, les exclusions de garantie et les limitations de responsabilité énoncées précédemment, cette disposition invalide ou inapplicable sera remplacée par une disposition valide et exécutoire qui correspondra au mieux à l’intention de la disposition originale. Les autres dispositions des CGU demeureront pleinement en vigueur.
                          
                  Les présentes conditions générales d'utilisation ont été rédigées en français. En cas de divergence entre les versions traduites des CGU et la version originale en français, la version française prévaudra.
                      """,
                        style: styleText,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 130,
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
