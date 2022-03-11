import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'user.dart';
import 'user_id.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late Future<List<User>> userlist;
  @override
  void initState() {
    super.initState();
    userlist = getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the next page',
            onPressed: () => Navigator.pop(context),
          ),
        ],
        title: const Text('Список пользователей'),
      ),
      body: FutureBuilder<List<User>>(
        future: userlist,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Имя: ${snapshot.data![index].name}'),
                      subtitle: Text('Email: ${snapshot.data![index].email}'),
                      leading: Text('ID: ${snapshot.data![index].id}'),
                      onTap: () async {
                        UserID uid = UserID(
                            snapshot.data![index].id,
                            '${snapshot.data![index].name}',
                            '${snapshot.data![index].username}',
                            '${snapshot.data![index].email}',
                            '${snapshot.data![index].address!.street}',
                            '${snapshot.data![index].address!.suite}',
                            '${snapshot.data![index].address!.city}',
                            '${snapshot.data![index].address!.zipcode}',
                            '${snapshot.data![index].address!.geo!.lat}',
                            '${snapshot.data![index].address!.geo!.lng}',
                            '${snapshot.data![index].phone}',
                            '${snapshot.data![index].website}',
                            '${snapshot.data![index].company!.name}',
                            '${snapshot.data![index].company!.catchPhrase}',
                            '${snapshot.data![index].company!.bs}');
                        Navigator.pushNamed(context, '/ info screen',
                            arguments: uid);
                      },
                    ),
                  );
                });
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<List<User>> getUserList() async {
    List<User> prodList = [];
    const url = 'https://jsonplaceholder.typicode.com/users';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body);
      for (var prod in jsonList) {
        prodList.add(User.fromJson(prod));
      }
      return prodList;
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }
}

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                    child: Image.network('assets/png.png'),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.input,
              color: Colors.blue,
            ),
            title: Text('Страница входа'),
            onTap: () => Navigator.pushNamed(context, '/'),
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: const Icon(
              Icons.format_align_left_rounded,
              color: Colors.blue,
            ),
            title: Text('Cписок пользователей'),
            onTap: () => Navigator.pushNamed(context, '/ auth screen'),
          ),
        ],
      ),
    );
  }
}
