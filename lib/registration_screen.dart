import 'package:flutter/material.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build (BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(
            color: Color (0xFFeceff1), width: 5));
    return MaterialApp(
      home: Scaffold (
        body: Container (
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: SingleChildScrollView(
              child: Column(children:  [
                const SizedBox(height: 8,),
                Text('Регистрация',
                    style: TextStyle (
                        fontSize: 20, color: Color.fromRGBO(0, 0, 0, 0.7))),
                SizedBox(height: 20,),
                const Text ('Чтобы зарегистрироваться, введите свой номер телефона и почту',
                  style: TextStyle(fontSize: 18, color: Color.fromRGBO(0, 0, 0, 0.23)),),
                Text('Телефон',
                    style: TextStyle (
                        fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6))),
                SizedBox(height: 20,),
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration (
                    filled: true,
                    fillColor: Color (0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                  ),
                ),
                Text('Почта',
                    style: TextStyle (
                        fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6))),
                SizedBox(height: 20,),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  decoration: InputDecoration (
                    filled: true,
                    fillColor: Color (0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                  ),
                ),
                SizedBox(height: 28,),
                SizedBox(width: 154, height: 42, child:
                ElevatedButton(onPressed: () {},
                  child: Text ('Отправить код'),
                  style: ElevatedButton.styleFrom(
                    primary: Color (0xFF0079D0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular (36.0),
                    ),
                  ),)
                ),
                SizedBox(height: 16,),
                Text('Вам придет четырехзначный код, который будет Вашим паролем',
                    style: TextStyle(fontSize: 18, color: Color.fromRGBO(0, 0, 0, 0.23))),
                SizedBox(height: 16,),
                Text('Изменить пароль можно будет в личном кабинете после регистрации',
                    style: TextStyle (
                        fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.23))),


              ],),
            ),
          ),
        ),
      ),
    );
  }
}



