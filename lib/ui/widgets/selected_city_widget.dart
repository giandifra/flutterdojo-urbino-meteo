import 'package:flutter/material.dart';

class SelectedCityWidget extends StatelessWidget {
  final String name;
  final int maxTemp;
  final int minTemp;
  final Function onRemove;
  final int id;

  const SelectedCityWidget(
      {Key key, this.name, this.maxTemp, this.minTemp, this.onRemove, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        height: 200,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(id.toString()),
                Row(
//                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      name ?? '-',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Row(
                      children: <Widget>[
                        Icon(Icons.add),
                        Text('${minTemp ?? '-'}/${maxTemp ?? '-'}',
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                RaisedButton(
                  onPressed: onRemove,
                  child: Text('remove'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
