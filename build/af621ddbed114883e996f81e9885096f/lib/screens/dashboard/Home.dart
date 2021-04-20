import 'package:flutter/material.dart';
import 'package:gestcom/screens/Guest.dart';
import 'package:gestcom/screens/dashboard/Article.dart';
import 'package:gestcom/screens/dashboard/Client.dart';
import 'package:gestcom/screens/dashboard/Commande.dart';
import 'package:gestcom/screens/services/UsersService.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserService _userService = UserService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: 0.0,
        elevation: 0,
        title: Text(
          "Bienvenue dans l'espace membre",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('img/accueil.jpg', height: 200.0, width: 300.0),
              RichText(
                text: TextSpan(
                  text: 'Bienvenue sur\n'.toUpperCase(),
                  style: TextStyle(color: Colors.black, fontSize: 30.0),
                  children: [
                    TextSpan(
                      text: "le compte Admin de\n".toUpperCase(),
                    ),
                    TextSpan(
                        text: "GESTCOM\n",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                        )),
                  ],
                ),
              ),
              RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ClientScreen()),
                    );
                  },
                  child: Text("Page client")),
              RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ArticleScreen()),
                    );
                  },
                  child: Text("Page Article")),
              // ignore: missing_required_param
              RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CommandeScreen()),
                    );
                  },
                  child: Text("Page commande")),
              RaisedButton(
                onPressed: () async {
                  await _userService.logout();

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GuestScreen(),
                      ),
                      (route) => false);
                },
                child: Text("Deconnexion"),
              ),
            ]),
      ),
    ));
  }
}
