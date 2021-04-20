import 'package:flutter/material.dart';

class AccScreen extends StatefulWidget {
  final Function(int) onChangedStep;

  const AccScreen({
    Key key,
    this.onChangedStep,
  }) : super(key: key);

  @override
  _AccScreenState createState() => _AccScreenState();
}

class _AccScreenState extends State<AccScreen> {
  bool _auth = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[Icon(Icons.more_vert)],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('img/appli.png', height: 200.0, width: 300.0),
                RichText(
                  text: TextSpan(
                    text: 'Bienvenue dans\n'.toUpperCase(),
                    style: TextStyle(color: Colors.black, fontSize: 30.0),
                    children: [
                      TextSpan(
                        text: "l'application\n".toUpperCase(),
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
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Veuillez-acceder à la page de connexion",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Form(
                  child: Column(
                    children: [
                      RaisedButton(
                          padding: EdgeInsets.symmetric(
                            vertical: 15.0,
                          ),
                          color: Theme.of(context).primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          onPressed:
                              _auth ? null : () => widget.onChangedStep(1),
                          child: Text(
                            "Se connecter".toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        "Créer un nouveau compte",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                      OutlineButton(
                          padding: EdgeInsets.symmetric(
                            vertical: 15.0,
                          ),
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          onPressed:
                              _auth ? null : () => widget.onChangedStep(3),
                          child: Text(
                            "S'inscrire".toUpperCase(),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
