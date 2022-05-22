import 'package:flutter/cupertino.dart';
import 'package:tuni_rand/models/offre.dart';

class Offers with ChangeNotifier {
  List<Offre> _items = [

    Offre(
        id: 'p1',
        dateD: DateTime.now(),
        dateF: DateTime.now(),
        titre: 'camping',
        imageUrl:
        'https://www.tourmag.com/photo/art/default/63205891-45615337.jpg?v=1647950753',
        location: 'bizert',
        description: "good camping",
        type: "camping",
        prix: 25.0),

    Offre(
        id: 'p1',
        dateD: DateTime.now(),
        dateF: DateTime.now(),
        titre: 'voyage',
        imageUrl:
        'https://iresizer.devops.arabiaweather.com/resize?url=https://adminassets.devops.arabiaweather.com/sites/default/files/field/image/traveling.jpg&size=850x478&force_jpg=1',
        location: 'sousse',
        description: "good voyage",
        type: "voyage",
        prix:50.0),
    Offre(
        id: 'p1',
        dateD: DateTime.now(),
        dateF: DateTime.now(),
        titre: 'randonne',
        imageUrl:
        'https://images.frandroid.com/wp-content/uploads/2019/07/toomas-tartes-yizrl9n-eda-unsplash-scaled.jpg',
        location: 'nabel',
        description: "good randonne",
        type: "randonne",
        prix: 70.0)
  ];

  List<Offre> get items {
    return [..._items];
  }

  Offre findById (String id ) {
    return _items.firstWhere((off) => off.id==id);
  }

  void addOffre() {
    //_items.add(value);
    notifyListeners();
  }

}