import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/essentials.dart';
import 'package:travel_app/homepage.dart';
import 'package:travel_app/itinerary.dart';
import 'package:travel_app/prices.dart';
import 'package:travel_app/profile.dart';

class CustomizeWidget extends StatefulWidget {
  const CustomizeWidget({super.key});

  @override
  _CustomizeWidgetState createState() => _CustomizeWidgetState();
}

class _CustomizeWidgetState extends State<CustomizeWidget> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _daysController = TextEditingController();
  String _itinerary =
      'Your Itinerary will be displayed here.'; // Itinerary result
  String? _savedItinerary; // To save the generated itinerary
  bool _isLoading = false; // Flag to track loading state
  GenerativeModel? _model;
  ChatSession? _chat;

  final String _context =
      "You are an expert itinerary planner. You need to read the given location and days in the Itinerary page and then change the previous itinerary based on the preferences added by the user or something that is deleted from the previous itinerary when clicked on the modify itinerary.";

  final RegExp boldExp =
      RegExp(r'\*\*(.*?)\*\*'); // Regex for bold text between **
  final RegExp bulletExp = RegExp(
      r'(^|\n)-\s*(.*?)(?=\n|$)'); // Regex for bullet points starting with -

  @override
  void initState() {
    super.initState();
    _initializeGeminiAPI();
  }

  void _initializeGeminiAPI() {
    try {
      const apiKey =
          'AIzaSyD4Lhqt6RGEfZ2Zszztg3s_lqgaJ3dVtnU'; // Replace this API key with your own if needed
      _model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
      _chat = _model?.startChat(history: [Content.text(_context)]);
      print('Gemini API initialized successfully for Itinerary');
    } catch (e) {
      print('Error initializing Gemini API: $e');
    }
  }

  Future<void> _generateItinerary() async {
    final location = _locationController.text;
    final days = _daysController.text;

    if (location.isEmpty || days.isEmpty) {
      setState(() {
        _itinerary = 'Please enter location and number of days.';
      });
      return;
    }

    if (_chat == null) {
      print('Chat session is null. Trying to reinitialize...');
      _initializeGeminiAPI();
      if (_chat == null) {
        setState(() {
          _itinerary = 'Unable to process request. Please try again later.';
        });
        return;
      }
    }

    try {
      setState(() {
        _isLoading = true;
        _itinerary = 'Loading...';
      });

      final response = await _chat!.sendMessage(Content.text(
          'Generate a detailed $days-day itinerary for $location in India.'));
      final botResponse = response.text;

      if (botResponse != null && botResponse.isNotEmpty) {
        setState(() {
          _savedItinerary = botResponse; // Save the generated itinerary
          _itinerary = _formatMessage(botResponse);
        });
      } else {
        setState(() {
          _itinerary =
              'Unable to generate itinerary. Please ensure your inputs are correct.';
        });
      }
    } catch (e) {
      print('Error generating itinerary: $e');
      setState(() {
        _itinerary = 'Error processing request. Please try again later.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _modifyItinerary() async {
    final preferences = _locationController.text;

    if (_savedItinerary == null) {
      setState(() {
        _itinerary =
            'No itinerary to modify. Please generate an itinerary first.';
      });
      return;
    }

    if (preferences.isEmpty) {
      setState(() {
        _itinerary = 'Please enter preferences to modify the itinerary.';
      });
      return;
    }

    if (_chat == null) {
      print('Chat session is null. Trying to reinitialize...');
      _initializeGeminiAPI();
      if (_chat == null) {
        setState(() {
          _itinerary = 'Unable to process request. Please try again later.';
        });
        return;
      }
    }

    try {
      setState(() {
        _isLoading = true;
        _itinerary = 'Modifying...';
      });

      final response = await _chat!.sendMessage(Content.text(
          'Modify the saved itinerary based on the new preferences: "$preferences". Current itinerary: $_savedItinerary'));
      final botResponse = response.text;

      if (botResponse != null && botResponse.isNotEmpty) {
        setState(() {
          _itinerary = _formatMessage(botResponse);
        });
      } else {
        setState(() {
          _itinerary =
              'Unable to modify itinerary. Please ensure your inputs are correct.';
        });
      }
    } catch (e) {
      print('Error modifying itinerary: $e');
      setState(() {
        _itinerary = 'Error processing request. Please try again later.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  List<TextSpan> _parseMessage(String message) {
    final List<TextSpan> spans = [];
    int lastIndex = 0;

    // Match for bold text
    for (Match match in boldExp.allMatches(message)) {
      if (match.start > lastIndex) {
        spans.add(TextSpan(text: message.substring(lastIndex, match.start)));
      }
      spans.add(TextSpan(
        text: match.group(1),
        style: GoogleFonts.inter(fontWeight: FontWeight.bold),
      ));
      lastIndex = match.end;
    }

    // Handle any remaining text
    if (lastIndex < message.length) {
      spans.add(TextSpan(text: message.substring(lastIndex)));
    }

    return spans;
  }

  String _formatMessage(String message) {
    // Replace bullet points
    String formattedMessage = message.replaceAllMapped(bulletExp, (match) {
      return '\n• ${match.group(2)}';
    });

    return formattedMessage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 211, 94, 44),
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
                Navigator.pop(context); // Close the drawer
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
                Navigator.pop(context); // Handle menu actions here
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
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 242, 232, 205),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/india.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Builder(
                  builder: (context) => Positioned(
                    top: 20,
                    left: 16,
                    child: IconButton(
                      icon: const Icon(Icons.menu, color: Colors.black),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 16,
                  child: CircleAvatar(
                    radius: 20, // Smaller circle
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.person, color: Colors.black),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileWidget()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Itinerary',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Georgia',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 38.0), // Add left padding
              child: Text(
                'CUSTOMIZE',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Georgia',
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextField(
                            controller: _locationController,
                            decoration: const InputDecoration(
                              labelText: 'Add preferences',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextField(
                            controller: _daysController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Number of days',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 242, 232, 205),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _isLoading
                        ? const Center(
                            child:
                                CircularProgressIndicator(), // Loading indicator
                          )
                        : RichText(
                            text: TextSpan(
                              children: _parseMessage(_itinerary),
                            ),
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _generateItinerary,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(223, 236, 249, 1),
                        side: const BorderSide(color: Colors.black),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                      child: const Text(
                        'Generate Itinerary',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _modifyItinerary,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(223, 236, 249, 1),
                        side: const BorderSide(color: Colors.black),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                      child: const Text(
                        'Modify Itinerary',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
