import 'package:flutter/material.dart';
import 'package:job_platform/page/home.dart';
import 'package:job_platform/page/login/connexion_page.dart';
import 'package:job_platform/page/login/inscription_page.dart';

import 'back end/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/*class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final ApiService _api = ApiService();

  void _testerConnexion() async {
    bool connecte = await _api.testConnection();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(connecte ? 'Connecté au serveur!' : 'Erreur de connexion'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Connexion'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _testerConnexion,
          child: Text('Tester la connexion'),
        ),
      ),
    );
  }
}*/