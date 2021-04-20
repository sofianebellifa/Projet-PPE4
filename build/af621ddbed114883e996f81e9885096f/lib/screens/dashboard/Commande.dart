import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:gestcom/screens/dashboard/Ajout_article.dart';
import 'package:gestcom/screens/dashboard/Article.dart';

SearchBar searchBar;
GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class CommandeScreen extends StatefulWidget {
  @override
  _CommandeScreenState createState() => new _CommandeScreenState();
}

AppBar _buildAppBar(BuildContext context) {
  return new AppBar(
    title: new Text("liste des articles"),
    centerTitle: true,
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
  );
}

class _CommandeScreenState extends State<CommandeScreen> {
  String _queryText;

  _CommandeScreenState() {
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

  CollectionReference collection =
      FirebaseFirestore.instance.collection('articles');
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: searchBar.build(context),
      backgroundColor: Colors.white,
      body: _fireSearch(_queryText),
    );
  }
}

Widget _fireSearch(String queryText) {
  return new StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection('articles')
        .where('categorie', isEqualTo: queryText)
        .snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return Text('Un problème est survenu');
      }

      return new ListView(
        padding: const EdgeInsets.all(30),
        children: snapshot.data.docs.map((docs) {
          return (Column(children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticleScreen(),
                      settings: RouteSettings(
                          arguments: docs.data()['id'].toString()),
                    ));
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                side: BorderSide(width: 1.0, color: Colors.black),
              ),
              child: Row(
                children: <Widget>[
                  Text(docs.data()['categorie'],
                      style: TextStyle(color: Colors.black, fontSize: 15.0)),
                  Container(padding: const EdgeInsets.all(8)),
                  Text(
                    docs.data()['fonction'],
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                  Container(padding: const EdgeInsets.all(8)),
                ],
              ),
            ),
          ]));
        }).toList(),
      );
    },
  );
}
