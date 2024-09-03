import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TravelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Positioned(
              left: -28,
              top: -38,
              child: Container(
                width: 371,
                height: 814,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'Assets\App background image 1.png',
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(17, 24, 0, 15),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 47,
                    top: 98,
                    child: Opacity(
                      opacity: 1,
                      child: Container(
                        width: 221,
                        height: 65,
                        decoration: BoxDecoration(
                          backgroundBlendMode: BlendMode.softLight,
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(4, 4),
                              blurRadius: 3.4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 390,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(1.9, 0, 1.9, 68),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              width: 322.1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 28),
                                    child: SizedBox(
                                      width: 38.2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFD9D9D9),
                                            ),
                                            width: 38.2,
                                            height: 0,
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                1.1, 0, 12.9, 0),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFD9D9D9),
                                            ),
                                            width: 24.2,
                                            height: 0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                    child: Container(
                                      width: 42,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD9D9D9),
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            'https://yourdomain.com/assets/images/people_1.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 75, 378),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'PADHARO',
                              style: GoogleFonts.philosopher(
                                fontWeight: FontWeight.w700,
                                fontSize: 40,
                                letterSpacing: 3.2,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 19, 0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFD9D9D9)),
                                  borderRadius: BorderRadius.circular(45),
                                  color: Color(0xFFD9D9D9),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 9),
                                      child: Text(
                                        'Itinerary',
                                        style: GoogleFonts.comfortaa(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 30,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(0, 0, 81.8, 12),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            'https://yourdomain.com/assets/images/calendar_1.png',
                                          ),
                                        ),
                                      ),
                                      width: 49,
                                      height: 49,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(0, 0, 79.8, 0),
                                      transform: Matrix4.rotationZ(1.5708),
                                      child: Container(
                                        color: Colors.black,
                                        width: 36.1,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFCCC9C9)),
                                        borderRadius: BorderRadius.circular(45),
                                        color: Color(0xFFCCC9C9),
                                      ),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(
                                              0, 35, 19.8, 71),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 0, 0, 9),
                                                child: Text(
                                                  'Essentials',
                                                  style: GoogleFonts.comfortaa(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 25,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 0, 86.3, 0),
                                                child: Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Container(
                                                    width: 45,
                                                    height: 45,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                          'https://yourdomain.com/assets/images/image_3.png',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 51,
                                      bottom: 33,
                                      child: Transform(
                                        transform: Matrix4.rotationZ(1.5758),
                                        child: SizedBox(
                                          width: 22,
                                          height: 22,
                                          child: SvgPicture.network(
                                            'https://yourdomain.com/assets/vectors/arrow_2_x2.svg',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TravelPage(),
  ));
}
