import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 360,
        height: 800,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(
          children: <Widget>[
            // Top background decoration
            Positioned(
              top: -292,
              left: -18,
              child: Container(
                width: 397,
                height: 584,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Color.fromRGBO(245, 219, 189, 0.5),
                ),
              ),
            ),
            // Bottom background decoration
            Positioned(
              top: 720,
              left: -18,
              child: Container(
                width: 397,
                height: 204,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Color.fromRGBO(245, 219, 189, 0.5),
                ),
              ),
            ),
            // Profile title
            Positioned(
              top: 77,
              left: 118,
              child: Text(
                'Profile',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Inter',
                  fontSize: 36,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            // Profile image container
            Positioned(
              top: 132,
              left: 118,
              child: Container(
                width: 109,
                height: 104,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(217, 217, 217, 1),
                ),
              ),
            ),
            // Profile image
            Positioned(
              top: 142,
              left: 136,
              child: Container(
                width: 74,
                height: 84,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/People1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Information boxes (Name, Email, Log out)
            Positioned(
              top: 346,
              left: 57,
              child: Container(
                width: 258,
                height: 54,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(223, 236, 248, 1),
                ),
              ),
            ),
            Positioned(
              top: 422,
              left: 57,
              child: Container(
                width: 258,
                height: 54,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(223, 236, 248, 1),
                ),
              ),
            ),
            Positioned(
              top: 502,
              left: 57,
              child: Container(
                width: 258,
                height: 54,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(223, 236, 248, 1),
                ),
              ),
            ),
            Positioned(
              top: 582,
              left: 57,
              child: Container(
                width: 258,
                height: 54,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(223, 236, 248, 1),
                ),
              ),
            ),
            // Labels
            Positioned(
              top: 514,
              left: 138,
              child: Text(
                'Contact',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Inter',
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            Positioned(
              top: 359,
              left: 145,
              child: Text(
                'Name',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Inter',
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            Positioned(
              top: 434,
              left: 150,
              child: Text(
                'Email',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Inter',
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            Positioned(
              top: 592,
              left: 141,
              child: Text(
                'Log out',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Inter',
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            // Back to Home Page Button
            Positioned(
              bottom: 20, // Adjust the position as needed
              left: 57,
              child: SizedBox(
                width: 258,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName('/home'));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color.fromRGBO(14, 14, 14, 1), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Back to Home Page',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 249, 247, 247),
                      fontFamily: 'Inter',
                      fontSize: 18,
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
