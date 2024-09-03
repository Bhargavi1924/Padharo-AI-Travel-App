import 'package:flutter/material.dart';

class ItineraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top bar with sun, plane, and user icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.sunny),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.flight),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {},
                ),
              ],
            ),

            // Title and search bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Itinerary',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter location',
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),

            // Day-wise itinerary sections
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildDaySection(1),
                  _buildDaySection(2),
                  _buildDaySection(3),
                  _buildDaySection(4),
                  _buildDaySection(5),
                ],
              ),
            ),

            // Customize button
            ElevatedButton(
              onPressed: () {},
              child: Text('Customize'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDaySection(int dayNumber) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Day $dayNumber:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'Add activities',
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
