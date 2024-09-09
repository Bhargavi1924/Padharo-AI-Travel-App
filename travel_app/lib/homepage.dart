import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/essentials.dart';
import 'package:travel_app/itinerary.dart';
import 'package:travel_app/signup.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({super.key});

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
      appBar: AppBar(
        title: const Text('Padharo'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon:
                  const Icon(Icons.menu), // Three-line widget (hamburger icon)
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Opens the Drawer
              },
            );
          },
        ),
        backgroundColor:
            Colors.transparent, // Make the AppBar background transparent
        elevation: 0, // Remove AppBar shadow
      ),
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
                Navigator.pop(context); // Close the drawer
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
                Navigator.pop(context); // Close the drawer
                // Navigate to the Home Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TravelPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_add),
              title: const Text('Sign Up'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Essentials'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const EssentialsWidget()), // Navigate to EssentialsWidget
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.price_change),
              title: const Text('Price Alert'),
              onTap: () {
                Navigator.pop(context); // Handle menu actions here
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Crowd Prediction'),
              onTap: () {
                Navigator.pop(context); // Handle menu actions here
              },
            ),
            ListTile(
              leading: const Icon(Icons.document_scanner),
              title: const Text('Document Management'),
              onTap: () {
                Navigator.pop(context); // Handle menu actions here
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
                    'assets/bg.png', // Adjust path as necessary
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top content
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(1.9, 0, 1.9, 68),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 322.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 28),
                                child: SizedBox(
                                  width: 38.2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 8),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFD9D9D9),
                                        ),
                                        width: 38.2,
                                        height: 0,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            1.1, 0, 12.9, 0),
                                        decoration: const BoxDecoration(
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
                                margin: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                                child: Container(
                                  width: 42,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
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
                      margin: const EdgeInsets.fromLTRB(0, 0, 75, 20),
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
          // Menu icon for opening the drawer

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
                            builder: (context) => const ItineraryScreen()),
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
                      image: NetworkImage(imageUrl),
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
