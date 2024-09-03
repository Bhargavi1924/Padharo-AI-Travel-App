import 'package:flutter/material.dart';

class SignupPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(223, 236, 248, 1),
      body: Center(
        child: Container(
          width: 360,
          height: 800,
          decoration: BoxDecoration(
            color: Color.fromRGBO(223, 236, 248, 1),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 104,
                left: 25,
                child: Container(
                  width: 310,
                  height: 664,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Color.fromRGBO(149, 186, 221, 0.22),
                  ),
                ),
              ),
              Positioned(
                top: 53,
                left: 111,
                child: Text(
                  'SIGN UP',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Comfortaa',
                    fontSize: 36,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Positioned(
                top: 157,
                left: 53,
                child: Text(
                  'Username',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Comfortaa',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Positioned(
                top: 190,
                left: 53,
                child: Container(
                  width: 254,
                  height: 62,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromRGBO(149, 186, 221, 1),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your username',
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 260,
                left: 53,
                child: Text(
                  'Phone No.',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Comfortaa',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Positioned(
                top: 293,
                left: 53,
                child: Container(
                  width: 254,
                  height: 62,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromRGBO(149, 186, 221, 1),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your phone number',
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 363,
                left: 53,
                child: Text(
                  'Email',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Comfortaa',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Positioned(
                top: 396,
                left: 53,
                child: Container(
                  width: 254,
                  height: 62,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromRGBO(149, 186, 221, 1),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your email',
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 466,
                left: 53,
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Comfortaa',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Positioned(
                top: 499,
                left: 53,
                child: Container(
                  width: 254,
                  height: 62,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromRGBO(149, 186, 221, 1),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your password',
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 569,
                left: 53,
                child: Text(
                  'Confirm Password',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Comfortaa',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Positioned(
                top: 602,
                left: 53,
                child: Container(
                  width: 254,
                  height: 62,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromRGBO(149, 186, 221, 1),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Confirm your password',
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 674,
                left: 109,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle sign-up action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(0, 0, 0, 0.25),
                    minimumSize: Size(154, 51),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Comfortaa',
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 735,
                left: 50,
                child: GestureDetector(
                  onTap: () {
                    // Navigate back to login page
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
