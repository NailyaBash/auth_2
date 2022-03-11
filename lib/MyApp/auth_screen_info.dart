import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == '272272' && password == '123'){
      errorText = null;
      Navigator.of(context).pushNamed('/ auth screen');
    } else {
      errorText = 'Неверный логин или пароль';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {const borderStyle= OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(36)),
      borderSide: BorderSide(
          color: const Color(0xFFbbbbbb), width: 2));
  final errorText = this.errorText;
  return MaterialApp(
    home: Scaffold(
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 74),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 181,),
              Text('ВХОД',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, color: Color.fromRGBO(0, 0, 0, 0.6)),),
              SizedBox(height: 20,),
              if (errorText != null) Text(errorText,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.red)),
              SizedBox(height: 20,),
              SizedBox(width: 244, height: 34,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  controller: _loginTextController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: ('Логин'),
                  ),
                ),
              ),
              SizedBox(height: 40,),
              SizedBox(width: 244, height: 34,
                child: TextField(
                  obscureText: true,
                  controller: _passwordTextController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: ('Пароль'),
                  ),
                ),
              ),
              SizedBox(height: 40,),
              SizedBox(width:154, height: 42, child:
              ElevatedButton(onPressed: _auth,
                child: Text('Вход'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0079D0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.0),
                  ),
                ),
              )
              ),
            ],),
          ),
        )
    ),
  );
  }
}

