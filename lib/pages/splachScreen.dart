import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuni_rand/pages/admin_page.dart';
import 'package:tuni_rand/pages/home_page.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  String role = "user";
  void initState() {
    super.initState();
    _checkRole();
  }

  void _checkRole () async {
     User? user = FirebaseAuth.instance.currentUser;
     final DocumentSnapshot snap = await FirebaseFirestore.instance.collection("users").doc(user?.uid).get();
     setState(() {
       role=snap['role'];
     });
     if (role=="user"){
        navigateNext(HomePage());
     }else if (role=="admin"){
       navigateNext(AdminPage());
     }
  }


  void navigateNext(Widget route) {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>route));
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
