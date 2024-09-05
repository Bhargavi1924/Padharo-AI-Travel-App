import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

class ItineraryScreen extends StatefulWidget {
  @override
  _ItineraryScreenState createState() => _ItineraryScreenState();
}

class _ItineraryScreenState extends State<ItineraryScreen> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _daysController = TextEditingController();
  String _itinerary =
      'Your Itinerary will be displayed here.'; // Itinerary result
  bool _isLoading = false; // Flag to track loading state
  GenerativeModel? _model;
  ChatSession? _chat;

  final String _context =
      "You are an expert itinerary planner. Given a location in India and a number of days, generate a detailed itinerary for that location.";

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
      final apiKey =
          'AIzaSyB3ViKQEbbD-ajd8aTDoQoTZtDqNIxcq60'; // Replace this API key with your own if needed
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
        _isLoading = true; // Set loading flag to true
        _itinerary = 'Loading...'; // Display loading text
      });

      print('Sending location and days to Gemini API: $location, $days');
      final response = await _chat!.sendMessage(Content.text(
          'Generate a detailed $days-day itinerary for $location in India.'));
      final botResponse = response.text;

      if (botResponse != null && botResponse.isNotEmpty) {
        setState(() {
          _itinerary = _formatMessage(botResponse);
        });
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
        _isLoading = false; // Set loading flag to false
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
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 242, 232, 205),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
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
                    icon: Icon(Icons.menu, color: Colors.black),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 16,
                  child: CircleAvatar(
                    radius: 20, // Smaller circle
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(Icons.person, color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Itinerary',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Georgia',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _locationController,
                      decoration: InputDecoration(
                        hintText: 'Enter location',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      onSubmitted: (_) => _generateItinerary(),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _daysController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'No. of days',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      onSubmitted: (_) => _generateItinerary(),
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: _generateItinerary,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
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
                        ? Center(
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
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(223, 236, 249, 1),
                    side: BorderSide(color: Colors.black),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  child: Text(
                    'CUSTOMIZE',
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
    );
  }
}
