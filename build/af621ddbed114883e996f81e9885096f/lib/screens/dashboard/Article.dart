import 'package:flutter/material.dart';
import 'package:gestcom/screens/dashboard/Ajout_article.dart';
import 'package:gestcom/screens/services/verif.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

SearchBar searchBar;
GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class ArticleScreen extends StatefulWidget {
  final Function(int) onChangedStep;
  const ArticleScreen({
    Key key,
    this.onChangedStep,
  }) : super(key: key);
  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  String _queryText;

  AppBar _buildAppBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: Text(
        'Liste des articles',
        style: TextStyle(color: Colors.white),
      ),
      actions: <Widget>[
        searchBar.getSearchAction(context),
        IconButton(
          icon: Icon(Icons.add),
          color: Colors.white,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Ajout_articleScreen()));
          },
        ),
      ],
      titleSpacing: 0,
      elevation: 0,
      backgroundColor: Colors.blueGrey,
    );
  }

  _ArticleScreenState() {
    searchBar = new SearchBar(
      onSubmitted: onSubmitted,
      inBar: true,
      buildDefaultAppBar: _buildAppBar,
      setState: setState,
    );
  }
  void onSubmitted(String value) {
    setState(() {
      _queryText = value;
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text('Résultat de votre recherche'),
        backgroundColor: Colors.red,
      ));
    });
  }

  final Color primaryColor = Colors.grey.shade200;
  final Color secondaryColor = Colors.white;
  final Color logoGreen = Color(0xff25bcbb);
  Color _colors = Colors.grey;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController categorieController = TextEditingController();
  final TextEditingController qteController = TextEditingController();

  _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: secondaryColor, border: Border.all(color: Colors.transparent)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),

            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }

  CollectionReference collection =
      FirebaseFirestore.instance.collection('articles');
  final Verif _auth = Verif();
  final _formKey = GlobalKey<FormState>();
  CollectionReference ref = FirebaseFirestore.instance.collection('articles');
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: searchBar.build(context),
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return _fireSearch(
                _queryText,
                nameController,
                brandController,
                priceController,
                categorieController,
                qteController,
                _buildTextField,
                primaryColor);
          } else {
            return Text('');
          }
        },
      ),
    );
  }
}

Widget _fireSearch(
    String queryText,
    nameController,
    brandController,
    priceController,
    categorieController,
    qteController,
    _buildTextField,
    primaryColor) {
  return new StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('articles')
          .where('nom', isEqualTo: queryText)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Un problème est survenu');
        }
        return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              var doc = snapshot.data.docs[index].data();
              return ListTile(
                minVerticalPadding: 16.0,
                leading: IconButton(
                    icon: Icon(Icons.edit),
                    color: Colors.grey,
                    onPressed: () {
                      nameController.text = doc['nom'];
                      brandController.text = doc['fonction'];
                      priceController.text = doc['prix'].toString();
                      categorieController.text = doc['categorie'];
                      qteController.text = doc['stock'].toString();

                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: Container(
                            color: primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView(
                                shrinkWrap: true,
                                children: <Widget>[
                                  _buildTextField(nameController, 'nom'),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  _buildTextField(brandController, 'fonction'),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  _buildTextField(priceController, 'prix'),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  _buildTextField(
                                      categorieController, 'categorie'),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  _buildTextField(qteController, 'stock'),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  TextButton(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        'Modifier l\'Article',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.blueGrey),
                                    onPressed: () {
                                      snapshot.data.docs[index].reference
                                          .update({
                                        'nom': nameController.text,
                                        'fonction': brandController.text,
                                        'prix': priceController.text,
                                        'categorie': categorieController.text,
                                        'stock': qteController.text,
                                      }).whenComplete(
                                              () => Navigator.pop(context));
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextButton(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        'Supprimer l\'Article',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    onPressed: () {
                                      snapshot.data.docs[index].reference
                                          .delete()
                                          .whenComplete(
                                              () => Navigator.pop(context));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                title: Text(
                  doc["nom"],
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: Column(
                  children: <Widget>[
                    Text(
                      doc["prix"].toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      doc["stock"].toString(),
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                //trailing: Image.network(doc['categorie'],
                //  height: 100, fit: BoxFit.cover, width: 100),
              );
            });
      });
}
