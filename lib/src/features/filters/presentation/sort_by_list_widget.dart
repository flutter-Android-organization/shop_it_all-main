import 'package:flutter/material.dart';

class SortByListWidget extends StatefulWidget {
  const SortByListWidget({super.key});

  @override
  State<SortByListWidget> createState() => _SortByListWidgetState();
}

class _SortByListWidgetState extends State<SortByListWidget> {
  List<Map<String, dynamic>> sortByList = [
    {'name': 'Price: Low to High', 'isChecked': false},
    {'name': 'Price: High to Low', 'isChecked': false},
    {'name': 'Reviews', 'isChecked': false},
    {'name': 'Newest', 'isChecked': false},
    {'name': 'Just for you', 'isChecked': false},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sortByList.length,
      itemBuilder: (BuildContext context, int index) => CheckboxListTile(
          title: sortByList[index]['name'],
          value: sortByList[index]['isChecked'],
          onChanged: (bool? value) => setState(() {
            sortByList[index]['isChecked'];
          })
      ),
    );
  }
}
