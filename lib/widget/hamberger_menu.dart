import 'package:flutter/material.dart';

import '../page/offre_page.dart';

class HambergerMenu extends StatefulWidget {
  const HambergerMenu({super.key});

  @override
  State<HambergerMenu> createState() => _HambergerMenuState();
}

class _HambergerMenuState extends State<HambergerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // En-tête du drawer
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person),
                ),
                SizedBox(height: 10),
                Text(
                  'Nom Utilisateur',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'utilisateur@email.com',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Elements du menu
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Accueil'),
            onTap: () {
              // Action quand on clique sur Accueil
              Navigator.pop(context); // Ferme le drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.work),
            title: Text('Offres'),
            onTap: () {
              // Naviguer vers la page offres
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OffrePage())
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Connexion'),
            onTap: () {
              Navigator.pop(context);
              // Naviguer vers la page favoris
            },
          ),
          Divider(), // Ligne de séparation

          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Déconnexion'),
            onTap: () {
              Navigator.pop(context);
              // Action de déconnexion
            },
          ),
        ],
      ),
    );
  }
}
