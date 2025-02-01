import 'package:flutter/material.dart';
import 'package:job_platform/page/offre_page.dart';
import 'package:job_platform/widget/appbar_widget.dart';
import 'package:job_platform/widget/hamberger_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // en tête
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Trouvez ou Publiez un Travail Temporaire en Côte d'Ivoire",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Simplifiez votre recherche d'emploi ou de main-d'œuvre grâce à notre plateforme.",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => OffrePage())
                            );
                          },
                          child: Text(
                            "Voir les offres",
                            style: TextStyle(color: Colors.blue),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Bordure arrondie de 10
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Publier une offres",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Bordure arrondie de 10
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              color: Colors.blue,
              width: double.infinity,
              height: 250.0,
            ),

            //Corps
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Catégories Populaires",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
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
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                "Travaux Domestiques",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                "Trouver ou proposer des services de ménage, cuisine et plus.",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
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
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                "BTP et Construction",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                "Recrutez des professionnels pour vos projets de construction.",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
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
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                "Transport et Livraison",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                "Trouvez des chauffeurs ou livreurs disponibles rapidement.",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Première stat
                  Column(
                    children: [
                      Text(
                        '500+',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Travailleurs inscrits',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),

                  // Deuxième stat
                  Column(
                    children: [
                      Text(
                        '300+',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Offres disponibles',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  // Troisième stat
                  Column(
                    children: [
                      Text(
                        '100+',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Employeurs satisfaits',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      )),
      drawer: HambergerMenu(),
    );
  }
}
