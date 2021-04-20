import 'package:flutter/material.dart';

class ConnexionScreen extends StatefulWidget {
  final Function(int, String) onChangedStep;

  const ConnexionScreen({
    Key key,
    this.onChangedStep,
  }) : super(key: key);

  @override
  _ConnexionScreenState createState() => _ConnexionScreenState();
}

class _ConnexionScreenState extends State<ConnexionScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");

  String _email = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => widget.onChangedStep(1, null),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Entrez ci-dessous\n'.toUpperCase(),
                    style: TextStyle(color: Colors.black, fontSize: 30.0),
                    children: [
                      TextSpan(
                        text: "vos Identifiants:\n",
                        style: TextStyle(color: Colors.black, fontSize: 30.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Veuillez-vous connectez",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text("Veuillez entrer votre adresse e-mail:"),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        onChanged: (value) => setState(() => _email = value),
                        validator: (value) =>
                            value.isEmpty || !emailRegex.hasMatch(value)
                                ? 'Entrez une adresse valide'
                                : null,
                        decoration: InputDecoration(
                          hintText: "Ex: GESTCOM@hotmail.com",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(
                          vertical: 15.0,
                        ),
                        onPressed: !emailRegex.hasMatch(_email)
                            ? null
                            : () {
                                if (_formKey.currentState.validate()) {
                                  print(_email);
                                  widget.onChangedStep(4, _email);
                                }
                              },
                        child: Text(
                          'Continuer'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
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
