import 'package:flutter/material.dart';

class FormatListWidget extends StatefulWidget {
  const FormatListWidget({super.key});

  @override
  State<FormatListWidget> createState() => _FState();
}

class _FState extends State<FormatListWidget> {
  List<Map<String, dynamic>> formatList = [
    {'name': 'All Formats', 'isChecked': true},
    {'name': 'Hardcover', 'isChecked': false},
    {'name': 'Digital', 'isChecked': false},
    {'name': 'Paperback', 'isChecked': false},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: formatList.length,
      itemBuilder: (BuildContext context, int index) =>
          CheckboxListTile(
            title: Text(formatList[index]['name']),
              value: formatList[index]['isChecked'],
              onChanged: (bool? value) {
              setState(() {
                formatList[index]['isChecked'] = value!;
              });
              }),
    );
  }
}



