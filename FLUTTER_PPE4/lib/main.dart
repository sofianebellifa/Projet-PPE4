import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gestcom/screens/Guest.dart';
import 'package:gestcom/screens/dashboard/Home.dart';
import 'package:gestcom/screens/services/UsersService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      title: 'GESTCOM',
      home: StreamBuilder(
        stream: _userService.user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return HomeScreen();
            }
            return GuestScreen();
          }
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: Text("En attente..."),
              ),
            ),
          );
        },
      ),
    );
  }
}
