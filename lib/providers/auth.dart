import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tuni_rand/models/user_model.dart';
import 'package:tuni_rand/pages/auth/sign_in_page.dart';


class Auth with ChangeNotifier {

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get authStateChanges => _auth.idTokenChanges();

  static signInWithEmail({required String email,required String password}) async{
    final res = await _auth.signInWithEmailAndPassword(email: email, password: password);
    final User? user = res.user;
    return user;
  }

 static   signUpWithEmail({required String email,required String password,String? role}) async{
  await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) async {
    User? user = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance.collection("users").doc(user?.uid).set({
      'uid': user?.uid,
      'email': email,
      'password': password,
      'role': role
    });
  });


  }

  /*static signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    final acc = await googleSignIn.signIn();
    final auth = await acc?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: auth?.accessToken,
      idToken: auth?.idToken
    );
    final res = await _auth.signInWithCredential(credential);
    return res.user;
  }

   */

  static logOut(){
    return _auth.signOut();
    
  }

}
