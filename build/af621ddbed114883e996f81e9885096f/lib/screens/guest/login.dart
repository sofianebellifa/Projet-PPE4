import 'package:flutter/material.dart';
import 'package:gestcom/screens/chargment/chargement.dart';
import 'package:gestcom/screens/services/verif.dart';
import 'package:gestcom/screens/dashboard/Home.dart';

class LoginScreen extends StatefulWidget {
  final Function(int) onChangedStep;
  const LoginScreen({
    Key key,
    this.onChangedStep,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Verif _auth = Verif();
  final _formKey = GlobalKey<FormState>();
  bool chargement = false;
  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(context) {
    return chargement
        ? Chargement()
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              titleSpacing: 0.0,
              elevation: 0,
              title: Text(
                "Connexion a l'espace membre",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: () => widget.onChangedStep(0),
              ),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Text(
                      "Veuillez-vous connectez",
                      style: TextStyle(color: Colors.black, fontSize: 30.0),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Entrez votre e-mail:',
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) =>
                          val.isEmpty ? "Entrer un e-mail valide" : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Entrez votre mot de passe',
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) =>
                          val.length < 6 ? "Mot de passe trop court" : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextButton(
                        style: TextButton.styleFrom(primary: Colors.blueGrey),
                        child: Text(
                          'Se connecter',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => chargement = true);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );

                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = "Vous n'êtes pas connecter";
                                chargement = false;
                              });
                              if (result = false) {
                                setState(() {
                                  error =
                                      "Mauvais identifiant ou mot de passe ";
                                  chargement = false;
                                });
                              }
                            }
                          }
                        }),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
