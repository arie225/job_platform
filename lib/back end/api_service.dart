import "package:http/http.dart" as http;
import 'dart:convert';
import 'api_config.dart';

class ApiService {
  // Méthode simple pour tester la connexion
  Future<bool> testConnection() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiConfig.baseUrl}/test'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('Connexion réussie !');
        return true;
      } else {
        print('Erreur de connexion: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Erreur de connexion: $e');
      return false;
    }
  }
}