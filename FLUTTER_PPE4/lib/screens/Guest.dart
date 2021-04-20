import 'package:flutter/material.dart';
import 'package:gestcom/screens/guest/Connexion.dart';
import 'package:gestcom/screens/guest/accueil.dart';
import 'package:gestcom/screens/guest/Term.dart';
import 'package:gestcom/screens/guest/login.dart';
import 'package:gestcom/screens/guest/password.dart';
import 'package:gestcom/screens/services/UsersService.dart';
import 'package:gestcom/models/UserModel.dart';
import 'package:gestcom/screens/dashboard/Home.dart';
import 'inscription/Inscription_auth.dart';

class GuestScreen extends StatefulWidget {
  GuestScreen({Key key}) : super(key: key);

  @override
  _GuestScreenState createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  UserService _userService = UserService();
  List<Widget> _widgets = [];
  int _indexSelected = 0;

  String _email;
String _password;

  @override
  void initState() {
    super.initState();

    _widgets.addAll([
      AccScreen(
        onChangedStep: (index) => setState(() => _indexSelected = index),
      ),
      TermScreen(
        onChangedStep: (index) => setState(() => _indexSelected = index),
      ),
      LoginScreen(
         onChangedStep: (index) => setState(() => _indexSelected = index),
      ),
      InscriptionScreen(
        onChangedStep: (index, value) => setState(() => _indexSelected = index),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widgets.elementAt(_indexSelected),
    );
  }
}
