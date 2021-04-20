import 'package:flutter/material.dart';
import 'package:gestcom/screens/services/verif.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Ajout_clientScreen extends StatefulWidget {
  final Function(int, String) onChangedStep;
  const Ajout_clientScreen({
    Key key,
    this.onChangedStep,
  }) : super(key: key);

  @override
  _Ajout_clientScreenState createState() => _Ajout_clientScreenState();
}

class _Ajout_clientScreenState extends State<Ajout_clientScreen> {
  final Verif _cli = Verif();
  final _formKey = GlobalKey<FormState>();
  bool chargement = false;
  String nom = '';
  String prenom = '';
  String email = '';
  String telephone = '';
  String adresse = '';
  String postal = '';
  String ville = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference client =
        FirebaseFirestore.instance.collection('client');
    Future<void> addClient() {
      // Call the user's CollectionReference to add a new user
      return client.add({
        'nom': nom,
        'prenom': prenom,
        'email': email,
        'telephone': telephone,
        'adresse': adresse,
        'postal': postal,
        'ville': ville,
        'id': '',
      }).then((value) {
        client.doc(value.id).update({"id": value.id});
      });
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          titleSpacing: 0.0,
          elevation: 0,
          title: Text(
            "Formulaire d'ajout de client",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        Text(
                          "Veuillez ajouter un nouveau client",
                          style: TextStyle(color: Colors.black, fontSize: 30.0),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Entrez le NOM:',
                            border: OutlineInputBorder(),
                          ),
                          validator: (val) => val.isEmpty ? "Champ vide" : null,
                          onChanged: (val) {
                            setState(() => nom = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Entrez le Prénom:',
                            border: OutlineInputBorder(),
                          ),
                          validator: (val) => val.isEmpty ? "Champ vide" : null,
                          onChanged: (val) {
                            setState(() => prenom = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Entrez un e-mail:',
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
                            labelText: 'Entrez le numéro de téléphone:',
                            border: OutlineInputBorder(),
                          ),
                          validator: (val) => val.isEmpty ? "Champ vide" : null,
                          onChanged: (val) {
                            setState(() => telephone = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Entrez l'adresse:",
                            border: OutlineInputBorder(),
                          ),
                          validator: (val) => val.isEmpty ? "Champ vide" : null,
                          onChanged: (val) {
                            setState(() => adresse = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Entrez le code postal:',
                            border: OutlineInputBorder(),
                          ),
                          validator: (val) => val.isEmpty ? "Champ vide" : null,
                          onChanged: (val) {
                            setState(() => postal = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Entrez la ville:',
                            border: OutlineInputBorder(),
                          ),
                          validator: (val) => val.isEmpty ? "Champ vide" : null,
                          onChanged: (val) {
                            setState(() => ville = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        SizedBox(height: 20.0),
                        TextButton(
                          onPressed: addClient,
                          child: Text(
                            "Ajouté un client",
                          ),
                        ),
                      ]),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
