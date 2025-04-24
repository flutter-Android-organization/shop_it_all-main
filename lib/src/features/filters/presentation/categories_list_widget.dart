import 'package:flutter/material.dart';

class CategoriesListWidget extends StatefulWidget {
  const CategoriesListWidget({super.key});

  @override
  State<CategoriesListWidget> createState() => _CategoriesListWidgetState();
}

class _CategoriesListWidgetState extends State<CategoriesListWidget> {
  List categoriesList = [
    {'name': 'All Categories', 'isChecked': true},
    {'name': 'Books', 'isChecked': false},
    {'name': 'Toys', 'isChecked': false},
    {'name': 'Games', 'isChecked': false},
    {'name': 'Tech', 'isChecked': false},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoriesList.length,
      itemBuilder: (BuildContext context, int index) =>
          CheckboxListTile(
              title: categoriesList[index]['name'],
              value: categoriesList[index]['isChecked'],
              onChanged: (bool? value) => setState(() {
                categoriesList[index]['isChecked'] = value!;
              }),),
    );
  }
}

