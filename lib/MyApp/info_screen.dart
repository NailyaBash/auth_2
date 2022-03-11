import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'auth_screen.dart';
import 'check.dart';
import 'user_id.dart';
import 'package:flutter122/global_theme.dart';

class InfoScreen extends StatelessWidget {
  late final UserID album;

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    album = settings.arguments as UserID;

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
        title: const Text('Информация о пользователе'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Имя: ${album.name}'),
            Text('Логин: ${album.username}'),
            Text('Почта: ${album.email}'),
            Text('Телефон: ${album.phone}'),
            Text(
                'Адрес: индекс:${album.zipcode} г.${album.city}, ул. ${album.street}, ст.${album.suite}, '),
            // Text('координаты: ${uid.lat}'),
            Text('website: ${album.website}'),
            Text('Место работы: ${album.cname}'),
            Text('Лозунг компании: ${album.catchPhrase}'),
            Text('Сфера деятельности: ${album.bs}'),
            const SizedBox(
              child: Text('Задачи:', style: TextStyle(fontStyle: FontStyle.italic)),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ViewID('${album.id}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewID extends StatefulWidget {
  final String _id;
  const ViewID(this._id, {Key? key}) : super(key: key);
  @override
  _ViewIDState createState() => _ViewIDState();
}

class _ViewIDState extends State<ViewID> {
  late Future<List<Check>> checklist;
  @override
  void initState() {
    super.initState();
    String id = widget._id;
    checklist = getCheckList(id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Check>>(
      future: checklist,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var fix = snapshot.data![index].completed as bool;
              return Card(
                color: fix ? Colors.green[50] : Colors.red[50],
                child: ListTile(
                  title: Text(
                      'Задача: ${snapshot.data![index].title}'),
                  subtitle: Row(
                    children: [
                      const Text('Отметка о выполнении ➾ '),
                      Checkbox(value: fix, onChanged: null)
                    ],
                  ),
                  leading: Text('№: ${index + 1}'),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<List<Check>> getCheckList(String id) async {
    List<Check> prodList = [];
    String url = 'https://jsonplaceholder.typicode.com/todos?userId=$id';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body);
      for (var prod in jsonList) {
        prodList.add(Check.fromJson(prod));
      }
      return prodList;
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }
}
