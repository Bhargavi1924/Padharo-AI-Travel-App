import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/homepage.dart';
import 'package:travel_app/itinerary.dart';
import 'package:travel_app/signup.dart';
import 'package:travel_app/profile.dart';

class EssentialsWidget extends StatefulWidget {
  @override
  _EssentialsWidgetState createState() => _EssentialsWidgetState();
}

class _EssentialsWidgetState extends State<EssentialsWidget> {
  List<bool> _isChecked = List.generate(
      11, (index) => false); // List to keep track of clicked items

  @override
  void initState() {
    super.initState();
    _loadCheckedItems(); // Load saved checked items on initialization
  }

  Future<void> _loadCheckedItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? checkedItems = prefs.getStringList('checkedItems');

    if (checkedItems != null) {
      setState(() {
        _isChecked = checkedItems.map((item) => item == 'true').toList();
      });
    }
  }

  Future<void> _saveCheckedItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> checkedItems =
        _isChecked.map((item) => item.toString()).toList();
    await prefs.setStringList('checkedItems', checkedItems);
  }

  @override
  Widget build(BuildContext context) {
    List<String> labels = [
      'Socks',
      'Tooth Brush',
      'Comb',
      'Charger',
      'Clothes',
      'Toothpaste',
      'Shampoo',
      'Towel',
      'Make-up',
      'Sunscreen',
      'Sunglasses',
    ];

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
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
              leading: Icon(Icons.calendar_today),
              title: Text('Itinerary'),
              onTap: () {
                Navigator.pop(context);
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
                Navigator.pop(context);
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
                Navigator.pop(context);
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Crowd Prediction'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.document_scanner),
              title: Text('Document Management'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Builder(
        builder: (context) => Stack(
          children: <Widget>[
            Positioned(
              top: 26,
              left: 299,
              child: Container(
                width: 42,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(217, 217, 217, 1),
                ),
                child: IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileWidget()),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: 24,
              left: 18.9,
              child: Divider(color: Color.fromRGBO(0, 0, 0, 1), thickness: 3),
            ),
            Positioned(
              top: 35,
              left: 20,
              child: Transform.rotate(
                angle: -7.95e-16 * (math.pi / 180),
                child: Divider(color: Color.fromRGBO(0, 0, 0, 1), thickness: 3),
              ),
            ),
            Positioned(
              top: 29,
              left: 303,
              child: Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/People1.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 136,
              left: 0,
              child: Container(
                width: 360,
                height: 726,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(54),
                  color: Color.fromRGBO(245, 219, 188, 1),
                ),
              ),
            ),
            Positioned(
              top: 88,
              left: 38,
              child: Text(
                'ESSENTIALS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Comfortaa',
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            // Generate the list items dynamically
            for (int i = 0; i < labels.length; i++)
              Positioned(
                top: 203 + i * 47,
                left: 29,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isChecked[i] = !_isChecked[i]; // Toggle check status
                      _saveCheckedItems(); // Save the state to preferences
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: _isChecked[i] ? Colors.green : Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            width: 1,
                          ),
                        ),
                        child: _isChecked[i]
                            ? Icon(Icons.check, color: Colors.white, size: 20)
                            : null,
                      ),
                      SizedBox(width: 10),
                      Text(
                        labels[i],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          height: 1,
                        ),
                      ),
                    ],
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
          ],
        ),
      ),
    );
  }
}
