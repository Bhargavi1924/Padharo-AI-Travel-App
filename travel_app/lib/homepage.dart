import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  // Scale factors for hover effect
  double _itineraryScale = 1.0;
  double _essentialsScale = 1.0;
  double _priceAlertScale = 1.0;
  double _crowdPredictionScale = 1.0;
  double _documentManagementScale = 1.0;

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
                      'assets//bg.png',
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
                          margin: EdgeInsets.fromLTRB(0, 0, 75, 20),
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
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildHoverableContainer(
                                'Itinerary',
                                'https://yourdomain.com/assets/images/calendar_1.png',
                                _itineraryScale,
                                (value) => setState(() {
                                  _itineraryScale = value;
                                }),
                              ),
                              _buildHoverableContainer(
                                'Essentials',
                                'https://yourdomain.com/assets/images/image_3.png',
                                _essentialsScale,
                                (value) => setState(() {
                                  _essentialsScale = value;
                                }),
                              ),
                              _buildHoverableContainer(
                                'Price Alert',
                                'https://yourdomain.com/assets/images/price_alert.png',
                                _priceAlertScale,
                                (value) => setState(() {
                                  _priceAlertScale = value;
                                }),
                              ),
                              _buildHoverableContainer(
                                'Crowd Prediction',
                                'https://yourdomain.com/assets/images/crowd_prediction.png',
                                _crowdPredictionScale,
                                (value) => setState(() {
                                  _crowdPredictionScale = value;
                                }),
                              ),
                              _buildHoverableContainer(
                                'Document Management',
                                'https://yourdomain.com/assets/images/document_management.png',
                                _documentManagementScale,
                                (value) => setState(() {
                                  _documentManagementScale = value;
                                }),
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
          ],
        ),
      ),
    );
  }

  Widget _buildHoverableContainer(String title, String imageUrl, double scale,
      Function(double) onHoverChange) {
    return MouseRegion(
      onEnter: (_) => onHoverChange(1.1),
      onExit: (_) => onHoverChange(1.0),
      child: AnimatedScale(
        scale: scale,
        duration: Duration(milliseconds: 200),
        child: Container(
          width: 150,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFD9D9D9)),
            borderRadius: BorderRadius.circular(45),
            color: Color(0xFFD9D9D9),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 49,
                height: 49,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imageUrl),
                  ),
                ),
              ),
            ],
          ),
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
