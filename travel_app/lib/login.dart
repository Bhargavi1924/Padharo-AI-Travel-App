import 'package:flutter/material.dart';
import 'package:travel_app/signup.dart';

class LoginPageWidget extends StatelessWidget {
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
                  height: 667,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Color.fromRGBO(149, 186, 221, 0.22),
                  ),
                ),
              ),
              Positioned(
                top: 55,
                left: 117,
                child: Text(
                  'LOGIN',
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
                top: 172,
                left: 53,
                child: Text(
                  'Username or Email',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Comfortaa',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Positioned(
                top: 199,
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
                        hintText: 'Enter your username or email',
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 313,
                left: 53,
                child: Text(
                  'Password',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Comfortaa',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Positioned(
                top: 338,
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
                top: 485,
                left: 109,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle login action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(0, 0, 0, 0.25),
                    minimumSize: Size(154, 51),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Comfortaa',
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 555,
                left: 50,
                child: GestureDetector(
                  onTap: () {
                    // Navigate to the signup page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignupPageWidget()),
                    );
                  },
                  child: Text(
                    'Don’t have an account? Sign Up\nForgot password?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Comfortaa',
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
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

void main() => runApp(MaterialApp(home: LoginPageWidget()));
