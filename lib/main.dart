import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_notes/firebase_options.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override


  //const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FirebaseFirestore firestore;
  void initState() {
    // TODO: implement initState
    firestore=FirebaseFirestore.instance;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("firebase notes"),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          var collref=firestore.collection("notes");
          collref.add({
            "title": "new note add in firestore",
            "desc" : "start from today firebase",
          }).then((value) => "note added $value").catchError((e){
            return "note note added";
          });
        },
      ),
    );
  }
}

