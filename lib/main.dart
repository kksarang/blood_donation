import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'project/add.dart';
import 'project/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      routes: {'/': (context) => HomePage(), '/add': (context) => AddUser()},
      initialRoute: '/',
    );
  }
}
