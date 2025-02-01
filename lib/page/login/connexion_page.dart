import 'package:flutter/material.dart';
import 'package:job_platform/page/login/inscription_page.dart';

import '../../back end/api_service.dart';
import '../home.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _isLoading = false;

  // Contrôleurs pour les champs de texte
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Instance du service d'authentification
  final AuthService _authService = AuthService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Fonction de connexion
  Future<void> _handleLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);

      try {
        final result = await _authService.login(
          _emailController.text,
          _passwordController.text,
        );

        setState(() => _isLoading = false);

        if (result['success']) {
          // Connexion réussie
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Connexion réussie!')),
          );
           //TODO: Naviguer vers la page d'accueil
           Navigator.of(context).pushReplacement(
             MaterialPageRoute(builder: (context) => HomePage()),
           );
        } else {
          // Afficher le message d'erreur
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(result['message'] ?? 'Erreur de connexion')),
          );
        }
      } catch (e) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erreur de connexion au serveur')),
        );
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  // Logo ou icône
                  const Icon(
                    Icons.lock_outlined,
                    size: 80,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 24),
                  // Titre
                  Text(
                    "CONNEXION",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Sous-titre
                  Text(
                    "Connectez-vous à votre compte",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 48),
                  // Champ Email
                  TextFormField(
                    controller: _emailController,  // Ajouter le contrôleur
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Entrez votre email",
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: Colors.blue, width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade50,
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) return "L'email est requis";
                      if (!value!.contains('@')) return "Email invalide";
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  // Champ Mot de passe
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: "Mot de passe",
                      hintText: "Entrez votre mot de passe",
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: Colors.blue, width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade50,
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) return "Le mot de passe est requis";
                      if (value!.length < 6) return "Le mot de passe doit contenir au moins 6 caractères";
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  // Lien Mot de passe oublié
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Action pour mot de passe oublié
                      },
                      child: Text(
                        "Mot de passe oublié ?",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Bouton de connexion
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                        "SE CONNECTER",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Lien d'inscription
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Vous n'avez pas de compte ? ",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigation vers la page d'inscription
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=>LoginPage())
                          );
                        },
                        child: const Text(
                          "S'inscrire",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}