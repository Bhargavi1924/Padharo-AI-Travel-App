import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/customize.dart';
import 'package:travel_app/essentials.dart';
import 'package:travel_app/homepage.dart';
import 'package:travel_app/model/itinerary_model.dart';
import 'package:travel_app/services/itinerary_services.dart';
import 'package:travel_app/signup.dart';
import 'package:travel_app/profile.dart'; // Ensure you import Profile

class ItineraryScreen extends StatefulWidget {
  const ItineraryScreen({super.key});

  @override
  _ItineraryScreenState createState() => _ItineraryScreenState();
}

class _ItineraryScreenState extends State<ItineraryScreen> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _daysController = TextEditingController();
  String _itinerary = 'Your Itinerary will be displayed here.';
  bool _isLoading = false;
  GenerativeModel? _model;
  ChatSession? _chat;

  final String _context =
      "You are an expert itinerary planner. Given a location in India and a number of days, generate a detailed itinerary for that location. Also provide restaurant and hotel suggestions";

  final RegExp boldExp = RegExp(r'\*\*(.*?)\*\*');
  final RegExp bulletExp = RegExp(r'(^|\n)-\s*(.*?)(?=\n|$)');
  final ItineraryService _itineraryService = ItineraryService();

  @override
  void initState() {
    super.initState();
    _initializeGeminiAPI();
  }

  void _initializeGeminiAPI() {
    try {
      const apiKey = 'AIzaSyB3ViKQEbbD-ajd8aTDoQoTZtDqNIxcq60';
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
        _itinerary = 'Your Itinerary will be displayed here.';
      });
      return;
    }

    if (_chat == null) {
      print('Chat session is null. Trying to reinitialize...');
      _initializeGeminiAPI();
      if (_chat == null) {
        setState(() {
          _itinerary =
              'I apologize, I am unable to process your request at the moment. Please try again later.';
        });
        return;
      }
    }

    try {
      setState(() {
        _isLoading = true;
        _itinerary = 'Loading...';
      });

      print('Sending location and days to Gemini API: $location, $days');
      final response = await _chat!.sendMessage(Content.text(
          'Generate a detailed $days-day itinerary for $location in India.'));
      final botResponse = response.text;

      if (botResponse != null && botResponse.isNotEmpty) {
        setState(() {
          _itinerary = _formatMessage(botResponse);
        });
        await _addItinerary(botResponse);
      } else {
        setState(() {
          _itinerary =
              'I apologize, I couldn’t generate an itinerary for that location. Please ensure it is a valid location in India.';
        });
      }
    } catch (e) {
      print('Error generating itinerary via Gemini API: $e');
      setState(() {
        _itinerary =
            'I encountered an error processing your request. Please try again later or rephrase your query.';
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

    if (lastIndex < message.length) {
      spans.add(TextSpan(text: message.substring(lastIndex)));
    }

    return spans;
  }

  String _formatMessage(String message) {
    String formattedMessage = message.replaceAllMapped(bulletExp, (match) {
      return '\n• ${match.group(2)}';
    });

    return formattedMessage;
  }

  Future<void> _addItinerary(String description) async {
    final itinerary = Itinerary(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: 'My Itinerary',
      description: description,
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 5)),
    );

    try {
      await _itineraryService.addItinerary(itinerary);
      print('Itinerary added successfully!');
    } catch (e) {
      print('Error adding itinerary: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 212, 147, 81),
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
              leading: Icon(Icons.calendar_today),
              title: Text('Itinerary'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItineraryScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home Page'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TravelPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Essentials'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EssentialsWidget()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.price_change),
              title: Text('Price Alert'),
              onTap: () {
                Navigator.pop(context); // Handle menu actions here
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Crowd Prediction'),
              onTap: () {
                Navigator.pop(context); // Handle menu actions here
              },
            ),
            ListTile(
              leading: Icon(Icons.document_scanner),
              title: Text('Document Management'),
              onTap: () {
                Navigator.pop(context); // Handle menu actions here
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey[50],
      body: Builder(
        builder: (context) => Container(
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
                  Positioned(
                    top: 20,
                    left: 16,
                    child: IconButton(
                      icon: const Icon(Icons.menu, color: Colors.black),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 16,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.person, color: Colors.black),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileWidget()),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _locationController,
                        decoration: InputDecoration(
                          hintText: 'Enter location',
                          hintStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                        onSubmitted: (_) => _generateItinerary(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _daysController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'No. of days',
                          hintStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                        onSubmitted: (_) => _generateItinerary(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: _generateItinerary,
                      color: Colors.black,
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
                              child: CircularProgressIndicator(),
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
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomizeWidget(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(223, 236, 249, 1),
                      side: const BorderSide(color: Colors.black),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 24.0),
                    ),
                    child: const Text(
                      'Customize',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
