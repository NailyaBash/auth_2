
import 'package:flutter/material.dart';
class AuthDrawerScreen extends StatefulWidget {
  const AuthDrawerScreen({Key? key}) : super(key: key);

  @override
  _AuthDrawerScreenState createState() => _AuthDrawerScreenState();
}

class _AuthDrawerScreenState extends State<AuthDrawerScreen> {
  //String? _email;
  //String? _password;
  final _messengerKey=GlobalKey <ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(
            color: Color (0xFFeceff1), width: 5));
        return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold (
        appBar: AppBar (),
        body: const Center(child: Text('Главный экран'),),
        drawer: Drawer (
          child: Column (
            children: [
              SizedBox(height: 150,),
              const SizedBox(width: 110, height: 84,
                child: Image(image: AssetImage('assets/png.png')),),
              SizedBox(height: 20,),
              Text ('Введите логин в виде 10 цифр номера телефона',
                  style: Theme.of(context).textTheme.headline6),
              const Text('Телефон', style: TextStyle (
                  fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.9))),
              SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration (
                  filled: true,
                  fillColor: Color (0xFFeceff1),
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle,
                  //labelText: 'Телефон',
                ),
              ),
              const Text('Пароль', style: TextStyle (
                  fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.9))),
              SizedBox(height: 20,),
              TextField(
                obscureText: true,
                decoration: InputDecoration (
                  filled: true,
                  fillColor: Color (0xFFeceff1),
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle,
                  //onSaved: (val) => _email = val,
                  //if (val) =>
                  //!val.contains("@") ? 'Неверный email.' : null,
                  //labelText: 'Пароль',
                ),
              ),
              SizedBox(height: 28,),
              SizedBox(width: 154, height: 42, child:
              ElevatedButton(onPressed: () {},
                child: Text ('Войти'),
                style: ElevatedButton.styleFrom(
                  primary: Color (0xFF0079D0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular (36.0),
                  ),
                ),              )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
