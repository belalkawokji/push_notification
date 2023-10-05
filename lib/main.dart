import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'empty_page.dart';
import 'home_page.dart';
final GlobalKey <NavigatorState> navigatorkey = GlobalKey();
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.instance.getToken().then((value) {
    print("get token :$value");
  });
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
print("on massege open: $message");
Navigator.pushNamed(navigatorkey.currentState!.context, '/push-page',
  arguments:{'message':json.encode(message.data)},); },);

FirebaseMessaging.instance.getInitialMessage().then(
    (RemoteMessage? message){
      if(message!=null){
        Navigator.pushNamed(
          navigatorkey.currentState!.context
          , '/push-page',
          arguments:{'message':json.encode(message.data)},
        );}
    },
);
FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async{
  await Firebase.initializeApp();
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: const Empty_page(),
      navigatorKey: navigatorkey,
      routes:{
        '':((context)=> const Empty_page()),
        '/push-page':((context)=> const HomePage())
      }

    );
  }
}
