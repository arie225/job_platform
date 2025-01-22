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
                        color: Colors.white,
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Offre de maçon",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
      ),
      drawer: HambergerMenu(),
    );
  }
}
