import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationDrawerScreen extends StatefulWidget {
  const NavigationDrawerScreen({Key? key}) : super(key: key);

  @override
  _NavigationDrawerScreenState createState() => _NavigationDrawerScreenState();
}

class _NavigationDrawerScreenState extends State<NavigationDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle=
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Демо Appbar"),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Icons.account_balance_sharp)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.face_rounded)),
            TextButton(
                onPressed: () {},
                child: const Text("Профиль"),
                style: buttonStyle,
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50.0))
                        ),
                        child: Image.network("https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png"),
                  ),
                     const Text ("Навигация во Flutter"),
                  ],
                  ),
                ),
        ),
             ListTile(
                 leading: const Icon (Icons.one_k),
                 title: const Text ("Каталог"),
                 onTap: () {
          },
        ),
              ListTile(
                   leading: const Icon (Icons.two_k),
                    title: const Text ("Корзина"),
                  onTap: () {
          },
        ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text("Профиль")
              ),
              ListTile(
                leading: const Icon (Icons.settings),
                title: const Text ("Настройки"),
                onTap: () {
                },
              ),
            ]
                ),
              ),
        body: Center(child: Text("Контент")),
      ),
          );
  }
}
