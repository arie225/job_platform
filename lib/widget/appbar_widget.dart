import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);  // Hauteur standard d'une AppBar

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.blue,
      title: Text(
        "TravailTemporaire",
        style: TextStyle(
          color: Colors.white,

        ),
      ),
    );
  }
}