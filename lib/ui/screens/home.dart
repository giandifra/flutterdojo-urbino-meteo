import 'package:flutter/material.dart';
import 'package:flutterdojo_urbino_meteo/ui/widgets/selected_city_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> cities = ['Roma', 'Urbino', 'Venezia'];

  void _addCity() {
    showDialog(
      context: context,
      builder: (context) {
        final controller = TextEditingController();
        return Center(
          child: Card(
            child: Container(
              color: Colors.orange,
              height: 200,
              width: 200,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text('Aggiungi una città'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  RaisedButton(
                    child: Text('Aggiungi'),
                    onPressed: () {
                      if (controller.text.isEmpty) return;
                      _addCityToList(controller.text);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _addCityToList(String city) {
    setState(() {
      cities.add(city);
    });
  }

  void _removeCity(int index) {
    setState(() {
      cities.removeAt(index);
    });
  }

  void _removeLastCity() {
    if (cities.isEmpty) return;
    setState(() {
      cities.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                _removeLastCity();
              }),
        ],
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (BuildContext context, int index) {
          return SelectedCityWidget(
            id: index,
            name: cities[index],
            onRemove: () {
              _removeCity(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCity,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
