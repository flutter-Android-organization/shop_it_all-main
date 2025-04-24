import 'package:flutter/material.dart';
import 'package:shop_it_all/src/constants/color_constants.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.searchController,
    required this.searchText,
    this.onChanged,
    this.suffixIcon, });

  final TextEditingController searchController;
  final String searchText;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        fillColor: btnColor.withAlpha(60),
        filled: true,
        hintText: searchText,
        contentPadding: pd1All0,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withAlpha(60),
          ),
            borderRadius: BorderRadius.circular(5)
        ),
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
    );
  }
}


class SearchButton extends StatelessWidget {
  const SearchButton({super.key, required this.onSearch});

  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onSearch,
        icon: const Icon(Icons.search)
    );
  }
}
