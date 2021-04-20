import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  final Function(int, String) onChangedStep;

  const PasswordScreen({
    Key key,
    this.onChangedStep,
  }) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSecret = true;
  String _password = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => widget.onChangedStep(2, null),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: Column(
                children: [
                  Text(
                    'Mot de passe'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text("Veuillez entrer votre mot de passe:"),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          onChanged: (value) =>
                              setState(() => _password = value),
                          validator: (value) => value.length < 6
                              ? 'Entrez un mot de passe de 6 caractères minimum.'
                              : null,
                          obscureText: _isSecret,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () =>
                                  setState(() => _isSecret = !_isSecret),
                              child: Icon(
                                !_isSecret
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            hintText: "Ex: 0123456",
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
                          onPressed: _password.length < 6
                              ? null
                              : () {
                                  if (_formKey.currentState.validate()) {
                                    widget.onChangedStep(null, _password);
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
              )),
        ),
      ),
    );
  }
}
