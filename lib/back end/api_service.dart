import "package:http/http.dart" as http;
import 'dart:convert';
import 'api_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'api_config.dart';

class AuthService {
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

  // Remplacez par votre URL de base
  //static  ApiConfig baseUrl = ApiConfig();

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('${ApiConfig.baseUrl}/api/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        // Stockez le token pour une utilisation ultérieure
        final token = data['token'];
        // TODO: Sauvegarder le token en local avec shared_preferences
        return {'success': true, 'data': data};
      } else {
        return {'success': false, 'message': data['message']};
      }
    } catch (e) {
      return {'success': false, 'message': 'Erreur de connexion'};
    }
  }

  Future<Map<String, dynamic>> register(Map<String, dynamic> userData) async {
    try {
      final response = await http.post(
        Uri.parse('${ApiConfig.baseUrl}/api/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(userData),
      );

      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        return {'success': true, 'data': data};
      } else {
        return {'success': false, 'message': data['message']};
      }
    } catch (e) {
      return {'success': false, 'message': 'Erreur d\'inscription'};
    }
  }

  Future<Map<String, dynamic>> getUserInfo(String token) async {
    try {
      final response = await http.get(
        Uri.parse('${ApiConfig.baseUrl}/api/user/me'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        return {'success': true, 'data': data};
      } else {
        return {'success': false, 'message': data['message']};
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Erreur de récupération des informations'
      };
    }
  }
}
