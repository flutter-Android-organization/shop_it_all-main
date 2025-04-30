import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it_all/src/common_widgets/search_field.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import 'package:shop_it_all/src/features/search/presentation/search_controller.dart';
import 'package:shop_it_all/src/features/search/presentation/search_page.dart';

import '../../account/presentation/controller/current_user_controller.dart';


class SearchSection extends ConsumerStatefulWidget {
  const SearchSection({super.key});

  @override
  ConsumerState<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends ConsumerState<SearchSection> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.removeListener(_onTextChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref
          .read(searchControllerProvider.notifier)
          .search(_searchController.text);
    });
    setState(() {}); // Trigger rebuild when text changes
  }

  @override
  Widget build(BuildContext context) {
    final isAuth = ref.watch(currentUserControllerProvider).value != null;
    return Container(
      padding: pd1All0, // Assuming this is a constant defined elsewhere
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(
            searchController: _searchController,
            searchText: 'Find your favourite product',
            onChanged: (text) {
              // This will trigger _onTextChanged via the listener
            },
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SearchPage(searchedItem: _searchController.text),
                        ),
                      );
                    },
                  )
                : null,
          ),
          gbHt20, // Assuming this is a constant defined elsewhere
          Text(
            isAuth ? 'Hello Samuel!' : 'Hello Guest!',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Text(
            'We have some recommendation for you.',
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}

