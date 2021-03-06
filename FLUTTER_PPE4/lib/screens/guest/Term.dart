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
                            "Ce document est ?? jour des nouvelles r??gles issues du R??glement n?? 2016/679 du Parlement europ??en et du Conseil (RGPD) relatif ?? la protection des donn??es ?? caract??re personnel. Une politique de confidentialit?? est un document qui d??finit de quelle mani??re les donn??es des personnes naviguant sur le site sont collect??es et trait??es. Les personnes naviguant sur le site sont nomm??es 'utilisateurs'.Ce document compl??te les Conditions G??n??rales d'Utilisation d'un site internet.Comment utiliser ce document ?Afin d'informer l'utilisateur quel est le sort r??serv?? ?? ses donn??es, cette politique de confidentialit?? doit contenir plusieurs informationTout d'abord, elle doit exposer de quelle mani??re sont collect??es et trait??es leurs donn??es ?? caract??re personnel, ?? quelles finalit??s le traitement et la collecte des donn??es r??pond (c'est-??-dire, pourquoi les donn??es sont collect??es et trait??es). Elle doit, pour chaque traitement, pr??ciser la base l??gale sur laquelle s'appuie ce dernier et la dur??e de conservation pr??vue pour les donn??es collect??es.Doivent ??tre consid??r??es comme donn??es personnelles toutes les donn??es ??tant susceptibles d'identifier un utilisateur. Il s'agit notamment du pr??nom et du nom, de l'??ge, de l'adresse postale, l'adresse mail, la localisation de l'utilisateur ou encore son adresse IP.Cette politique de confidentialit?? doit ??noncer quels sont les droits des utilisateurs concernant ces donn??es (par exemple, le droit d'acc??s aux donn??es, droit ?? la suppression de ses donn??es...), et quelles sont les proc??dures ?? suivre afin de mettre en ??uvre ces droits. L'utilisateur doit notamment ??tre inform?? de la possibilit?? qui lui est offerte d'effectuer une r??clamation aupr??s de la CNIL.La politique de confidentialit?? doit ??galement informer l'utilisateur de qui est responsable du traitement des donn??es ?? caract??re personnel collect??es et trait??es. Il s'agit de la personne qui est charg??e de d??terminer les finalit??s et les moyens mis au service du traitement de ces donn??es. Les destinataires ou cat??gories de destinataires des donn??es personnelles collect??es doivent ??tre pr??cis??s.Dans le cas o?? un D??l??gu?? ?? la Protection des Donn??es a ??t?? nomm??, il est n??cessaire d'indiquer son identit?? directement dans ce document. Le r??le du D??l??gu?? ?? la Protection des Donn??es est de s'assurer de la bonne mise en oeuvre des dispositions l??gales concernant la collecte et le traitement des donn??es ?? caract??re personnel (il est parfois appel?? 'DPO', pour Data Protection Officer).Enfin, dans le cas o?? le site utilise des fichiers 'cookies', la politique de confidentialit?? doit pr??ciser quels sont les fichiers 'cookies' utilis??s. Un 'cookie' est un fichier de petite taille (moins de 4 ko), stock?? par le site sur le disque dur de l'utilisateur, contenant des informations relatives aux habitudes de navigation de l'utilisateur. Certains cookies ne peuvent ??tre d??pos??s sur le terminal de l'utilisateur qu'apr??s avoir recueilli son consentement. Lorsque de tels cookies sont utilis??s par le site internet, il convient d'informer l'utilisateur sur la mani??re dont il peut, ?? tout moment, retirer son consentement au d??p??t de cookies.La politique de confidentialit?? doit ??tre facilement accessible aux utilisateurs sur le site : elle peut appara??tre lors de la premi??re visite de l'utilisateur, ou bien directement en bas de page sur le site internet par exemple.Le droit applicableLe r??glement europ??en 2016/679 du Parlement europ??en et du Conseil, et notamment l'article 13 La Loi n?? 2004-575 du 21 juin 2004 pour la confiance dans l'??conomie num??rique et notamment l'article 6 La Loi n?? 78-17 du 6 janvier 1978 relative ?? l'informatique, aux fichiers et aux libert??s modifi??e par la LOI n?? 2018-493 du 20 juin 2018 relative ?? la protection des donn??es personnelles pour les questions de traitement de donn??es ?? caract??re personnel. Aide d'un avocatVous pourrez choisir de consulter un avocat si vous avez besoin d'aide.L'avocat pourra r??pondre ?? vos questions ou vous aider dans vos d??marches. Cette option vous sera propos??e ?? la fin du document.Conform??ment au d??cret n??2007-451 du 25 mars 2007 pris pour l???application de la loi  ??Informatique & Libert??s??, vos demandes devront ??tre pr??sent??es par ??crit et devront ??tre sign??es et accompagn??es de la photocopie d???un titre d???identit?? portant votre signature.\n La demande devra pr??ciser l???adresse ?? laquelle devra parvenir la r??ponse. Le Groupe Bayard disposera d???un d??lai d???un (1) mois pour r??pondre suivant r??ception de votre demande.\n Pour votre parfaite information, vous disposez de la facult?? de saisir la Commission nationale de l???Informatique et des Libert??s (dont les coordonn??es figurent ?? l???adresse https://www.cnil.fr/fr/vous-souhaitez-contacter-la-cnil) dans l???hypoth??se o?? le Groupe GESTCOM n???aurait pas fait suite ?? votre demande dans le d??lai d???un mois suivant votre demande.  Au besoin, ce d??lai peut ??tre prolong?? de deux (2) mois, compte tenu de la complexit?? et du nombre de demandes."),
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
