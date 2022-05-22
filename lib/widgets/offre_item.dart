import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuni_rand/pages/offres/offre_detail_page.dart';

class OffreItem extends StatelessWidget {
     final String id;
     final String titre;
     final String imageUrl;
     final String type;

     OffreItem(this.id,this.titre,this.imageUrl,this.type);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:BorderRadius.circular(10) ,
      child: GridTile(
        child: GestureDetector(
          onTap:(){
            Navigator.of(context).pushNamed(OffreDetail.routeName,arguments: id,
            );
          } ,
         child: Image.network(imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading:IconButton(icon:Icon(Icons.favorite), onPressed: () {  },),
          title: Text(titre,
          textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
