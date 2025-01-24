import 'package:flutter/material.dart';
import 'package:job_platform/widget/appbar_widget.dart';
import 'package:job_platform/widget/hamberger_menu.dart';

class OffrePage extends StatefulWidget {
  const OffrePage({super.key});

  @override
  State<OffrePage> createState() => _OffrePageState();
}

class _OffrePageState extends State<OffrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.0,),
                Center(
                  child: Text(
                    "Liste des offres d'emploi",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold
                    ),

                  ),
                ),
                // Une barre de recherche simple
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Rechercher par titre',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      // Mettre votre logique de recherche ici
                      print('Recherche: $value');
                    },
                  ),
                ),
                //afficher les offres
                Column(
                  children: [
                    SizedBox(
                      width: 350.0,
                      height: 100.0,
                      child: Card(
                        child: ListTile(
                          title: Text('Offre de maçon'),
                          subtitle: Text('Abidjan - 50,000 CFA'),
                          trailing: TextButton(
                            onPressed: () {},
                            child: Text('Voir plus'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 350,
                      height: 100,
                      child:   Card(
                        child: ListTile(
                          title: Text('Offre de ménage'),
                          subtitle: Text('Yamoussoukro - 30,000 CFA'),
                          trailing: TextButton(
                            onPressed: () {},
                            child: Text('Voir plus'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 350,
                      height: 100,
                      child:   Card(
                        child: ListTile(
                          title: Text('Offre de ménage'),
                          subtitle: Text('Yamoussoukro - 30,000 CFA'),
                          trailing: TextButton(
                            onPressed: () {},
                            child: Text('Voir plus'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 350,
                      height: 100,
                      child:   Card(
                        child: ListTile(
                          title: Text('Offre de ménage'),
                          subtitle: Text('Yamoussoukro - 30,000 CFA'),
                          trailing: TextButton(
                            onPressed: () {},
                            child: Text('Voir plus'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 350,
                      height: 100,
                      child:   Card(
                        child: ListTile(
                          title: Text('Offre de ménage'),
                          subtitle: Text('Yamoussoukro - 30,000 CFA'),
                          trailing: TextButton(
                            onPressed: () {},
                            child: Text('Voir plus'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 350,
                      height: 100,
                      child:   Card(
                        child: ListTile(
                          title: Text('Offre de ménage'),
                          subtitle: Text('Yamoussoukro - 30,000 CFA'),
                          trailing: TextButton(
                            onPressed: () {},
                            child: Text('Voir plus'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  color: Color(0xFF1F2937),
                  child: Center(
                    child: Text(
                      "© 2024 TravailTemporaire. Tous droits réservés.",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          )
      ),
      drawer: HambergerMenu(),
    );
  }
}
