import 'package:flutter/material.dart';
import 'package:gestcom/screens/services/verif.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Ajout_articleScreen extends StatefulWidget {
  final Function(int, String) onChangedStep;
  const Ajout_articleScreen({
    Key key,
    this.onChangedStep,
  }) : super(key: key);

  @override
  _Ajout_articleScreenState createState() => _Ajout_articleScreenState();
}

class _Ajout_articleScreenState extends State<Ajout_articleScreen> {
  final Verif _art = Verif();
  final _formKey = GlobalKey<FormState>();
  bool chargement = false;
  String nom = '';
  String fonction = '';
  String categorie = '';
  double prix;
  double stock;
  String error = '';
  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference articles =
        FirebaseFirestore.instance.collection('articles');
    Future<void> addArticle() {
      // Call the user's CollectionReference to add a new user
      return articles.add({
        'nom': nom,
        'fonction': fonction,
        'categorie': categorie,
        'stock': stock,
        'prix': prix,
      }).then((value) {
        articles.doc(value.id).update({"id": value.id});
      });
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          titleSpacing: 0.0,
          elevation: 0,
          title: Text(
            "Formulaire d'ajout d'article",
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
                          "Veuillez ajouter un nouvel article",
                          style: TextStyle(color: Colors.black, fontSize: 30.0),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Entrez le nom de l'article:",
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
                            labelText: "Entrez la fonction de l'article:",
                            border: OutlineInputBorder(),
                          ),
                          validator: (val) => val.isEmpty ? "Champ vide" : null,
                          onChanged: (val) {
                            setState(() => fonction = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Entrez la catégorie de l'article:",
                            border: OutlineInputBorder(),
                          ),
                          validator: (val) =>
                              val.isEmpty ? "Entrer un e-mail valide" : null,
                          onChanged: (val) {
                            setState(() => categorie = val);
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Entrez la quantité en stock:",
                            border: OutlineInputBorder(),
                          ),
                          validator: (val) => val.isEmpty
                              ? "Entrer la quantité de stock"
                              : null,
                          onChanged: (val) {
                            setState(
                              () => stock = double.tryParse(val),
                            );
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Entrez le prix de l'article",
                            border: OutlineInputBorder(),
                          ),
                          validator: (val) => val.isEmpty ? "Champ vide" : null,
                          onChanged: (val) {
                            setState(
                              () => prix = double.tryParse(val),
                            );
                          },
                        ),
                        SizedBox(height: 20.0),
                        SizedBox(height: 20.0),
                        TextButton(
                          onPressed: addArticle,
                          child: Text(
                            "Ajouté un article",
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
