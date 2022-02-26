import 'package:flutter/material.dart';

class ThemesDemoApp extends StatefulWidget {
  const ThemesDemoApp({Key? key}) : super(key: key);

  @override
  _ThemesDemoAppState createState() => _ThemesDemoAppState();
}

class _ThemesDemoAppState extends State<ThemesDemoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Georgia',
        splashColor: Colors.yellow,

        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
          primarySwatch: Colors.orange,
        ).copyWith(
          secondary: Colors.green,
        ),
        textTheme: const TextTheme(
          headline6: TextStyle(fontSize: 24.0, color: Colors.red, fontWeight: FontWeight.bold),
          button: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 32.0, color: Colors.brown, fontFamily: 'Hind'),
        ),
      ),
      home: ThemesDemoScreen(),
    );
  }
}

class ThemesDemoScreen extends StatefulWidget {
  const ThemesDemoScreen({Key? key}) : super(key: key);

  @override
  _ThemesDemoScreenState createState() => _ThemesDemoScreenState();
}

class _ThemesDemoScreenState extends State<ThemesDemoScreen> {

  @override
  Widget build(BuildContext context) {const borderStyle= OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(36)),
      borderSide: BorderSide(
          color: Color(0xFFbbbbbb), width: 2));
  const linkTextStyle= TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Color(0xFF0079D0));
  return Scaffold(
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 74),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 81,),
              SizedBox(width: 103,height: 80,child: Image(image: AssetImage('assets/images/dart-logo1.png'),),),
              SizedBox(height: 19,),
              Text('Введите логин в виде 10 цифр номера телефона',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6),
              SizedBox(height: 20,),
              SizedBox(width: 244, height: 34,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: ('Телефон'),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(width: 244, height: 34,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: ('Пароль'),
                  ),
                ),
              ),
              SizedBox(height: 28,),
              SizedBox(width:154, height: 42, child:
              ElevatedButton(onPressed: () {},
                child: Text('Войти'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.0),
                  ),
                ),
              )
              ),
              SizedBox(height: 62,),
              InkWell(child: Text('Регистрация'), onTap: () {}),
              SizedBox(height: 19,),
              InkWell(child: Text('Забыли пароль?', style: linkTextStyle), onTap: () {})
            ],),
          ),
        ),
        );
  }
}

