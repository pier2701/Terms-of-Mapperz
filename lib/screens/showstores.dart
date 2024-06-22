import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:terms_of_mapperz/utilities/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowStores extends StatefulWidget {
  const ShowStores({Key? key}) : super(key: key);

  @override
  State<ShowStores> createState() => _ShowStoresState();
}

class _ShowStoresState extends State<ShowStores> {
  bool animate = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 300, 0, 300),
      child: Material(
        color: black.withOpacity(0.6),
        clipBehavior: Clip.hardEdge,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: AnimatedSlide(
              offset: animate ? const Offset(0, 0) : const Offset(0, 5),
              duration: const Duration(milliseconds: 600),
              curve: Curves.fastLinearToSlowEaseIn,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 150,
                  right: 150,
                  top: 50,
                  bottom: 50,
                ),
                child: GestureDetector(
                  onTap: () async {
                    if (!await launchUrl(
                      Uri.parse(
                        "https://apps.apple.com/fr/app/mapperz/id6451254537",
                      ),
                    )) {
                      if (kDebugMode) print('Could not launch URL');
                    }
                  },
                  child: const MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Image(
                      image: AssetImage('assets/images/apple.webp'),
                      width: 200,
                      height: 90,
                    ),
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
