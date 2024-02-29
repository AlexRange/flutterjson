import 'dart:convert';
import 'package:flutter/material.dart';
import 'Item.dart';

class JsonListViewScreen extends StatefulWidget {
  @override
  _JsonListViewScreenState createState() => _JsonListViewScreenState();
}

class _JsonListViewScreenState extends State<JsonListViewScreen> {
  late List<Item> items;

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  Future<void> loadItems() async {
    // Carga el JSON desde el archivo assets
    String jsonString =
        await DefaultAssetBundle.of(context).loadString('assets/data.json');
    List<dynamic> jsonList = json.decode(jsonString);

    // Convierte el JSON en objetos Dart
    setState(() {
      items = jsonList.map((item) => Item.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON ListView Example'),
      ),
      backgroundColor: Color.fromARGB(255, 53, 180, 180),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 4, // Añade sombra a la tarjeta
            margin: EdgeInsets.all(9), // Márgenes alrededor de la tarjeta
            color:
                Color.fromARGB(255, 12, 194, 21), // Color de fondo suave azul

            // Contenido de la tarjeta
            child: ListTile(
              title: Text(
                items[index].name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Color de texto azul oscuro
                ),
              ),
              subtitle: Text(
                'ID: ${items[index].id}',
                style: TextStyle(
                  color: Color.fromARGB(
                      255, 59, 50, 50), // Color de texto azul medio
                ),
              ),
              leading: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://f4.bcbits.com/img/a1924344540_10.jpg'),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
