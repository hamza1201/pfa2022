import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuni_rand/providers/offers_provider.dart';
class OffreDetail extends StatelessWidget {
 //final String titre;
 //final double prix;
//OffreDetail(this.titre,this.prix);
   static const routeName='/offre-detail';
  @override
  Widget build(BuildContext context) {
    final offreId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedOffers = Provider.of<Offers>(context,listen: false).findById(offreId);
    return Scaffold(
      appBar: AppBar(
            title: Text(loadedOffers.titre),
      ),
    );
  }
}
