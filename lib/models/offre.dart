class Offre {
  final String id;
  final DateTime dateD;
  final DateTime dateF;
  final String titre;
  final String imageUrl;
  final String location;
  final String description;
  final String type;
  final double prix;

  Offre({required this.id,required this.dateD,required this.dateF, required this.titre,required this.imageUrl,required this.location,required this.description,required this.type,required this.prix});
}