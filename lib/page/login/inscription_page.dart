import 'package:flutter/material.dart';
import 'package:job_platform/page/login/connexion_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? selectedValue;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // En-tête
                  Center(
                    child: Column(
                      children: [
                        const Icon(Icons.person_add, size: 64, color: Colors.blue),
                        const SizedBox(height: 16),
                        Text(
                          "INSCRIPTION",
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Créez votre compte pour commencer",
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Informations personnelles
                  Text(
                    "Informations personnelles",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Champs du formulaire
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: _buildInputDecoration("Nom", Icons.person),
                          validator: (value) {
                            if (value?.isEmpty ?? true) return "Champ requis";
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          decoration: _buildInputDecoration("Prénom", Icons.person_outline),
                          validator: (value) {
                            if (value?.isEmpty ?? true) return "Champ requis";
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: _buildInputDecoration("Email", Icons.email),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value?.isEmpty ?? true) return "Champ requis";
                      if (!value!.contains('@')) return "Email invalide";
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: _buildInputDecoration("Téléphone", Icons.phone),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value?.isEmpty ?? true) return "Champ requis";
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  // Type de compte
                  Text(
                    "Type de compte",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildRadioTile(
                            "employeur",
                            "Employeur",
                            "Publiez des offres d'emploi",
                            Icons.business,
                          ),
                          const Divider(),
                          _buildRadioTile(
                            "travailleur",
                            "Travailleur",
                            "Trouvez des opportunités",
                            Icons.work,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Informations professionnelles
                  Text(
                    "Informations professionnelles",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: _buildInputDecoration("Ville", Icons.location_city),
                    validator: (value) {
                      if (value?.isEmpty ?? true) return "Champ requis";
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: _buildInputDecoration("Métier", Icons.work),
                    validator: (value) {
                      if (value?.isEmpty ?? true) return "Champ requis";
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: _buildInputDecoration("Disponibilité", Icons.access_time),
                    validator: (value) {
                      if (value?.isEmpty ?? true) return "Champ requis";
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),

                  // Bouton d'inscription
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Logique d'inscription
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "S'INSCRIRE",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
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
                              MaterialPageRoute(builder: (context)=>ConnexionPage())
                          );
                        },
                        child: const Text(
                          "Se connecter",
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

  Widget _buildRadioTile(String value, String title, String subtitle, IconData icon) {
    return RadioListTile<String>(
      value: value,
      groupValue: selectedValue,
      onChanged: (String? value) {
        setState(() {
          selectedValue = value;
        });
      },
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      secondary: Icon(icon, color: Colors.blue),
      contentPadding: EdgeInsets.zero,
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.blue, width: 2),
      ),
      filled: true,
      fillColor: Colors.grey.shade50,
    );
  }
}