import 'package:flutter/material.dart';
import 'package:job_platform/widget/appbar_widget.dart';
import 'package:job_platform/widget/hamberger_menu.dart';

class DetailOffrePage extends StatefulWidget {
  const DetailOffrePage({super.key});

  @override
  State<DetailOffrePage> createState() => _DetailOffrePageState();
}

class _DetailOffrePageState extends State<DetailOffrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Titre de l'offre: Offre de maçon",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Catégorie: maçonnerie",
                    style: TextStyle(
                      fontSize: 18
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Text(
                  "Description",
                )
              ],
            ),
          )
      ),
      drawer: HambergerMenu(),
    );
  }
}
