import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/essentials.dart';
import 'package:travel_app/itinerary.dart';

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
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 410,
              height: 850,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/bg.png', // Adjust path as necessary
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top content
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(1.9, 0, 1.9, 68),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 322.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 28),
                                child: SizedBox(
                                  width: 38.2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
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
                                      image: AssetImage(
                                        'assets/user.png',
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
                  ],
                ),
              ],
            ),
          ),
          // Bottom scrollable row
          Positioned(
            bottom:
                30, // Adjust this value to control how much above the bottom edge it appears
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildHoverableContainer(
                    'Itinerary',
                    'assets/itinry.png',
                    _itineraryScale,
                    (value) => setState(() {
                      _itineraryScale = value;
                    }),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ItineraryScreen()),
                      );
                    },
                  ),
                  _buildHoverableContainer(
                    'Essentials',
                    'assets/to-do-list.png',
                    _essentialsScale,
                    (value) => setState(() {
                      _essentialsScale = value;
                    }),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EssentialsWidget()),
                      );
                    },
                  ),
                  _buildHoverableContainer(
                    'Price Alert',
                    'assets/price-list.png',
                    _priceAlertScale,
                    (value) => setState(() {
                      _priceAlertScale = value;
                    }),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ItineraryScreen()),
                      );
                    },
                  ),
                  _buildHoverableContainer(
                    'Crowd Prediction',
                    'assets/people .png',
                    _crowdPredictionScale,
                    (value) => setState(() {
                      _crowdPredictionScale = value;
                    }),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ItineraryScreen()),
                      );
                    },
                  ),
                  _buildHoverableContainer(
                    'Document Management',
                    'assets/documents.png',
                    _documentManagementScale,
                    (value) => setState(() {
                      _documentManagementScale = value;
                    }),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ItineraryScreen()),
                      );
                    },
                  ),
                  _buildHoverableContainer(
                    'AR-VR',
                    'assets/virtual-tour.png',
                    _documentManagementScale,
                    (value) => setState(() {
                      _documentManagementScale = value;
                    }),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ItineraryScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHoverableContainer(String title, String imageUrl, double scale,
      Function(double) onHoverChange, Null Function() param4,) {
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
