import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? uid;
  String? email;
  String? role;
  String? name;
  String? phone;
  String? ville;
  String? genre;

  UserModel({this.uid,this.email,this.role,this.name,this.phone,this.ville,this.genre});

  //receiving data

factory UserModel.fromMap(map) {
  return UserModel(
    uid: map['uid'],
    email: map['email'],
    role: map['role'],
    name: map['name'],
    phone: map['phone'],
    ville: map['ville'],
    genre: map['genre'],
  );

}

//sending data
Map<String,dynamic> toMap(){
  return{
    'uid':uid ,
    'email': email,
    'role':role,
    'name':name,
    'phone': phone,
    'ville': ville,
    'genre': genre,
  };
  }

}

