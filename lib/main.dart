import 'package:drivers_app/pages/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'authentication/login_screen.dart';


Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyBZ2XV4A8wn-qTTOGQLnPu5cAuXdIXiHeQ',
        appId: '1:832713560007:android:8cd12b1b74fba1478953e2',
        messagingSenderId: '832713560007',
        projectId: 'be-right-there-f7e78',
        databaseURL: 'https://be-right-there-f7e78-default-rtdb.asia-southeast1.firebasedatabase.app',
        storageBucket: 'gs://be-right-there-f7e78.appspot.com',
      )
  );

  await Permission.locationWhenInUse.isDenied.then((valueOfPermission)
  {
    if(valueOfPermission)
    {
      Permission.locationWhenInUse.request();
    }
  });

  await Permission.notification.isDenied.then((valueOfPermission)
  {
    if(valueOfPermission)
    {
      Permission.notification.request();
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Drivers App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: FirebaseAuth.instance.currentUser == null ? const LoginScreen() : const Dashboard(),
    );
  }
}
