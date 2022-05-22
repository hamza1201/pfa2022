import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/offers_grid.dart';

class OffresOveriew extends StatelessWidget {
  OffresOveriew({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("my offre")),
      body: OffersGrid(),
    );
  }
}


