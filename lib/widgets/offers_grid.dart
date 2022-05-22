import 'package:flutter/cupertino.dart';
import 'package:tuni_rand/providers/offers_provider.dart';
import 'offre_item.dart';
import 'package:provider/provider.dart';
class OffersGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final offersData = Provider.of<Offers>(context);
    final offers = offersData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: offers.length,
      itemBuilder: (BuildContext context, int index) => OffreItem(
          offers[index].id,
          offers[index].titre,
          offers[index].imageUrl,
          offers[index].type),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}