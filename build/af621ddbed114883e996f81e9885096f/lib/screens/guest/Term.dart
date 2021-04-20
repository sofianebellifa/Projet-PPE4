import 'package:flutter/material.dart';

class TermScreen extends StatefulWidget {
  final Function(int) onChangedStep;

  const TermScreen({
    Key key,
    this.onChangedStep,
  }) : super(key: key);
  @override
  _TermScreenState createState() => _TermScreenState();
}

class _TermScreenState extends State<TermScreen> {
  ScrollController _scrollController;
  bool _lectureTerm = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() => _lectureTerm = true);
      }
    });
  }

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0.0,
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text(
              'Termes et Conditions:',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () => widget.onChangedStep(0),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            "Ce document est à jour des nouvelles règles issues du Règlement n° 2016/679 du Parlement européen et du Conseil (RGPD) relatif à la protection des données à caractère personnel. Une politique de confidentialité est un document qui définit de quelle manière les données des personnes naviguant sur le site sont collectées et traitées. Les personnes naviguant sur le site sont nommées 'utilisateurs'.Ce document complète les Conditions Générales d'Utilisation d'un site internet.Comment utiliser ce document ?Afin d'informer l'utilisateur quel est le sort réservé à ses données, cette politique de confidentialité doit contenir plusieurs informationTout d'abord, elle doit exposer de quelle manière sont collectées et traitées leurs données à caractère personnel, à quelles finalités le traitement et la collecte des données répond (c'est-à-dire, pourquoi les données sont collectées et traitées). Elle doit, pour chaque traitement, préciser la base légale sur laquelle s'appuie ce dernier et la durée de conservation prévue pour les données collectées.Doivent être considérées comme données personnelles toutes les données étant susceptibles d'identifier un utilisateur. Il s'agit notamment du prénom et du nom, de l'âge, de l'adresse postale, l'adresse mail, la localisation de l'utilisateur ou encore son adresse IP.Cette politique de confidentialité doit énoncer quels sont les droits des utilisateurs concernant ces données (par exemple, le droit d'accès aux données, droit à la suppression de ses données...), et quelles sont les procédures à suivre afin de mettre en œuvre ces droits. L'utilisateur doit notamment être informé de la possibilité qui lui est offerte d'effectuer une réclamation auprès de la CNIL.La politique de confidentialité doit également informer l'utilisateur de qui est responsable du traitement des données à caractère personnel collectées et traitées. Il s'agit de la personne qui est chargée de déterminer les finalités et les moyens mis au service du traitement de ces données. Les destinataires ou catégories de destinataires des données personnelles collectées doivent être précisés.Dans le cas où un Délégué à la Protection des Données a été nommé, il est nécessaire d'indiquer son identité directement dans ce document. Le rôle du Délégué à la Protection des Données est de s'assurer de la bonne mise en oeuvre des dispositions légales concernant la collecte et le traitement des données à caractère personnel (il est parfois appelé 'DPO', pour Data Protection Officer).Enfin, dans le cas où le site utilise des fichiers 'cookies', la politique de confidentialité doit préciser quels sont les fichiers 'cookies' utilisés. Un 'cookie' est un fichier de petite taille (moins de 4 ko), stocké par le site sur le disque dur de l'utilisateur, contenant des informations relatives aux habitudes de navigation de l'utilisateur. Certains cookies ne peuvent être déposés sur le terminal de l'utilisateur qu'après avoir recueilli son consentement. Lorsque de tels cookies sont utilisés par le site internet, il convient d'informer l'utilisateur sur la manière dont il peut, à tout moment, retirer son consentement au dépôt de cookies.La politique de confidentialité doit être facilement accessible aux utilisateurs sur le site : elle peut apparaître lors de la première visite de l'utilisateur, ou bien directement en bas de page sur le site internet par exemple.Le droit applicableLe règlement européen 2016/679 du Parlement européen et du Conseil, et notamment l'article 13 La Loi n° 2004-575 du 21 juin 2004 pour la confiance dans l'économie numérique et notamment l'article 6 La Loi n° 78-17 du 6 janvier 1978 relative à l'informatique, aux fichiers et aux libertés modifiée par la LOI n° 2018-493 du 20 juin 2018 relative à la protection des données personnelles pour les questions de traitement de données à caractère personnel. Aide d'un avocatVous pourrez choisir de consulter un avocat si vous avez besoin d'aide.L'avocat pourra répondre à vos questions ou vous aider dans vos démarches. Cette option vous sera proposée à la fin du document.Conformément au décret n°2007-451 du 25 mars 2007 pris pour l’application de la loi  «Informatique & Libertés», vos demandes devront être présentées par écrit et devront être signées et accompagnées de la photocopie d’un titre d’identité portant votre signature.\n La demande devra préciser l’adresse à laquelle devra parvenir la réponse. Le Groupe Bayard disposera d’un délai d’un (1) mois pour répondre suivant réception de votre demande.\n Pour votre parfaite information, vous disposez de la faculté de saisir la Commission nationale de l’Informatique et des Libertés (dont les coordonnées figurent à l’adresse https://www.cnil.fr/fr/vous-souhaitez-contacter-la-cnil) dans l’hypothèse où le Groupe GESTCOM n’aurait pas fait suite à votre demande dans le délai d’un mois suivant votre demande.  Au besoin, ce délai peut être prolongé de deux (2) mois, compte tenu de la complexité et du nombre de demandes."),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
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
                        !_lectureTerm ? null : () => widget.onChangedStep(2),
                    child: Text(
                      "Accepter & continuer".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
