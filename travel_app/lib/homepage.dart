import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/essentials.dart';
import 'package:travel_app/itinerary.dart';
import 'package:travel_app/signup.dart';
import 'package:travel_app/profile.dart';
import 'package:travel_app/prices.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({super.key});

  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  double _itineraryScale = 1.0;
  double _essentialsScale = 1.0;
  double _priceAlertScale = 1.0;
  double _crowdPredictionScale = 1.0;
  double _documentManagementScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 228, 143, 90),
              ),
              child: Text(
                'Guide',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Itinerary'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ItineraryScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home Page'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TravelPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Essentials'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EssentialsWidget()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.price_change),
              title: const Text('Price Alert'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PricealertWidget()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Crowd Prediction'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.document_scanner),
              title: const Text('Document Management'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 410,
              height: 850,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/bg.png',
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 40, // Adjust the position as needed
            left: 10,
            child: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  color: const Color.fromARGB(199, 253, 253, 253),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
          ),
          Positioned(
            top: 40, // Adjust the vertical position as needed
            right: 10, // Adjust the horizontal position as needed
            child: IconButton(
              icon: const Icon(
                Icons.person, // Profile icon to represent a person
                size: 30,
              ),
              color: const Color.fromARGB(199, 253, 253, 253),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileWidget()),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 100, 5, 2),
                      child: Align(
                        alignment: Alignment.center,
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
          Positioned(
            bottom: 30,
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
                          builder: (context) => const ItineraryScreen(),
                        ),
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
                            builder: (context) => const EssentialsWidget()),
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
                            builder: (context) => const PricealertWidget()),
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
                            builder: (context) => const ItineraryScreen()),
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
                            builder: (context) => const ItineraryScreen()),
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
                            builder: (context) => const ItineraryScreen()),
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
      Function(double) onHoverChange, VoidCallback onTap) {
    return MouseRegion(
      onEnter: (_) => onHoverChange(1.1),
      onExit: (_) => onHoverChange(1.0),
      child: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 200),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: 150,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFD9D9D9)),
              borderRadius: BorderRadius.circular(45),
              color: const Color(0xFFD9D9D9),
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
                  margin: const EdgeInsets.only(top: 10),
                  width: 49,
                  height: 49,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(imageUrl),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
