import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'pricealert.dart';
import 'homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCQnvx4GwIuYiGa_AOczFI3nPshkSoAVVA",
      authDomain: "travel-app-174f2.firebaseapp.com",
      projectId: "travel-app-174f2",
      storageBucket: "travel-app-174f2.appspot.com",
      messagingSenderId: "95831253642",
      appId: "1:95831253642:web:6e57d4b208c65f8c2f4373",
      measurementId: "G-47W6S63PWP",
    ),
  );

  // Use the Firebase Auth instance to configure persistence
  FirebaseAuth.instance.setPersistence(
      Persistence.LOCAL); // Or use Persistence.NONE for no persistence

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PricealertWidget(),
      routes: {
        '/home': (context) => const TravelPage(),
      },
    );
  }
}
