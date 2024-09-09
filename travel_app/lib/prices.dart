import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';

class PricealertWidget extends StatefulWidget {
  const PricealertWidget({super.key});

  @override
  _PricealertWidgetState createState() => _PricealertWidgetState();
}

class _PricealertWidgetState extends State<PricealertWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator PricealertWidget - FRAME

    return Container(
        width: 360,
        height: 800,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: 26,
              left: 326,
              child: Container(
                  width: 42,
                  height: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Color.fromRGBO(217, 217, 217, 1),
                  ))),
          const Positioned(
              top: 24,
              left: 18.89502716064453,
              child: Divider(color: Color.fromRGBO(0, 0, 0, 1), thickness: 3)),
          Positioned(
              top: 35,
              left: 20,
              child: Transform.rotate(
                angle: -7.951386703658792e-16 * (math.pi / 180),
                child: const Divider(
                    color: Color.fromRGBO(0, 0, 0, 1), thickness: 3),
              )),
          Positioned(
              top: 29,
              left: 330,
              child: Container(
                  width: 34,
                  height: 34,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/People1 (1).png'),
                        fit: BoxFit.fitWidth),
                  ))),
          Positioned(
              top: 243,
              left: 33,
              child: Container(
                  width: 146,
                  height: 175,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(55),
                      topRight: Radius.circular(55),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    color: Color.fromRGBO(217, 217, 217, 1),
                  ))),
          Positioned(
              top: 243,
              left: 225,
              child: Container(
                  width: 146,
                  height: 175,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(55),
                      topRight: Radius.circular(55),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    color: Color.fromRGBO(217, 217, 217, 1),
                  ))),
          Positioned(
              top: 544,
              left: 33,
              child: Container(
                  width: 146,
                  height: 175,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(55),
                      topRight: Radius.circular(55),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    color: Color.fromRGBO(217, 217, 217, 1),
                  ))),
          Positioned(
              top: 544,
              left: 225,
              child: Container(
                  width: 146,
                  height: 175,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(55),
                      topRight: Radius.circular(55),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    color: Color.fromRGBO(217, 217, 217, 1),
                  ))),
          Positioned(
              top: 243,
              left: 34,
              child: Container(
                  width: 142,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(55),
                      topRight: Radius.circular(55),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/kerala.jpg'),
                      fit: BoxFit.fitWidth,
                    ),
                  ))),
          const Positioned(
              top: 98,
              left: 110,
              child: Text(
                'PRICE ALERT',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Comfortaa',
                    fontSize: 30,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    height: 1),
              )),
          Positioned(
              top: 157,
              left: 60,
              child: Container(
                  width: 88,
                  height: 42,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    color: Color.fromRGBO(149, 186, 221, 1),
                  ))),
          Positioned(
              top: 157,
              left: 165,
              child: Container(
                  width: 207,
                  height: 42,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    color: Color.fromRGBO(149, 186, 221, 1),
                  ))),
          const Positioned(
              top: 165,
              left: 100,
              child: Text(
                'All',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Fenix',
                    fontSize: 24,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                    height: 1),
              )),
          Positioned(
              top: 165,
              left: 65,
              child: Transform.rotate(
                angle: -180 * (math.pi / 180),
                child: Container(
                    width: 26,
                    height: 26,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Image10.png'),
                          fit: BoxFit.fitWidth),
                    )),
              )),
          const Positioned(
              top: 165,
              left: 180,
              child: Text(
                'Search',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Fenix',
                    fontSize: 24,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                    height: 1),
              )),
          Positioned(
              top: 163,
              left: 340,
              child: Container(
                  width: 29,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(149, 186, 221, 1),
                      width: 1,
                    ),
                    image: const DecorationImage(
                        image: AssetImage('assets/Image6.png'),
                        fit: BoxFit.fitWidth),
                  ))),
          const Positioned(
              top: 429,
              left: 77,
              child: Text(
                'KERALA',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Della Respira',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                    height: 1),
              )),
          const Positioned(
              top: 733,
              left: 265,
              child: Text(
                'KASHMIR',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Della Respira',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                    height: 1),
              )),
          const Positioned(
              top: 733,
              left: 60,
              child: Text(
                'MEGHALAYA',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Della Respira',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                    height: 1),
              )),
          const Positioned(
              top: 429,
              left: 280,
              child: Text(
                'GOA',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Della Respira',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                    height: 1),
              )),
          Positioned(
              top: 243,
              left: 227,
              child: Container(
                  width: 143,
                  height: 180,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(55),
                      topRight: Radius.circular(55),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    image: DecorationImage(
                        image: AssetImage('assets/goa.jpg'),
                        fit: BoxFit.fitWidth),
                  ))),
          Positioned(
              top: 544,
              left: 228,
              child: Container(
                  width: 146,
                  height: 175,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(55),
                      topRight: Radius.circular(55),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    image: DecorationImage(
                        image: AssetImage('assets/kashmir.jpg'),
                        fit: BoxFit.fitWidth),
                  ))),
          Positioned(
              top: 460,
              left: 60,
              child: Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Stack(children: <Widget>[
                    Positioned(
                      top: 12.5,
                      left: 8.5,
                      child: SvgPicture.asset('assets/cash-icon.svg',
                          semanticsLabel: 'vector'),
                    ),
                    Positioned(
                      top: 0.6589999794960022,
                      left: 1.5,
                      child: SvgPicture.asset('assets/cash-icon.svg',
                          semanticsLabel: 'vector'),
                    ),
                  ]))),
          Positioned(
              top: 759,
              left: 235,
              child: Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Stack(children: <Widget>[
                    Positioned(
                      top: 12.5,
                      left: 8.5,
                      child: SvgPicture.asset('assets/cash-icon.svg',
                          semanticsLabel: 'vector'),
                    ),
                    Positioned(
                      top: 0.6589999794960022,
                      left: 1.5,
                      child: SvgPicture.asset('assets/cash-icon.svg',
                          semanticsLabel: 'vector'),
                    ),
                  ]))),
          Positioned(
              top: 455,
              left: 235,
              child: Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Stack(children: <Widget>[
                    Positioned(
                      top: 12.5,
                      left: 8.5,
                      child: SvgPicture.asset('assets/cash-icon.svg',
                          semanticsLabel: 'vector'),
                    ),
                    Positioned(
                      top: 0.6589999794960022,
                      left: 1.5,
                      child: SvgPicture.asset('assets/cash-icon.svg',
                          semanticsLabel: 'vector'),
                    ),
                  ]))),
          Positioned(
              top: 760,
              left: 60,
              child: Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Stack(children: <Widget>[
                    Positioned(
                      top: 12.5,
                      left: 8.5,
                      child: SvgPicture.asset('assets/cash-icon.svg',
                          semanticsLabel: 'vector'),
                    ),
                    Positioned(
                      top: 0.6589999794960022,
                      left: 1.5,
                      child: SvgPicture.asset('assets/cash-icon.svg',
                          semanticsLabel: 'vector'),
                    ),
                  ]))),
          const Positioned(
              top: 762,
              left: 285,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '80k',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Della Respira',
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                      height: 1),
                ),
              )),
          const Positioned(
              top: 459,
              left: 285,
              child: Text(
                '28k',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Della Respira',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                    height: 1),
              )),
          const Positioned(
              top: 464,
              left: 100,
              child: Text(
                '1L',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Della Respira',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                    height: 1),
              )),
          const Positioned(
              top: 764,
              left: 100,
              child: Text(
                '30k',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Della Respira',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                    height: 1),
              )),
          Positioned(
              top: 547,
              left: 30,
              child: Container(
                  width: 147,
                  height: 175,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(55),
                      topRight: Radius.circular(55),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    image: DecorationImage(
                        image: AssetImage('assets/meghalaya.jpg'),
                        fit: BoxFit.fitWidth),
                  ))),
        ]));
  }
}
