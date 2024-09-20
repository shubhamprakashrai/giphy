import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphyapp/app/resource/app_colors.dart';

class SearchPage extends StatefulWidget {
  final void Function(String) onSearch;
  final VoidCallback? onClear;

  const SearchPage({
    super.key,
    required this.onSearch,
    this.onClear,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchTextChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged() {
    final query = _searchController.text;
    widget.onSearch(query);
  }

  void _clearSearch() {
    _searchController.clear();
    if (widget.onClear != null) {
      widget.onClear!();
    }
  }

  final InputBorder borderDecoration = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: TextField(
        controller: _searchController,
        cursorColor: AppColors.purplecolors,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          hintText: 'Search GIFs',
          hintStyle: const TextStyle(
            color: Color(0xFFB7B7B7),
            fontFamily: 'PacaembuMedium',
            fontSize: 14,
          ),
          fillColor: Colors.white,
          filled: true,
          isDense: true,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
            child: const Icon(Icons.search),
          ),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: _clearSearch,
                )
              : null,
          enabledBorder: borderDecoration,
          focusedBorder: borderDecoration,
          border: borderDecoration,
        ),
      ).marginSymmetric(horizontal: 16),
    );
  }
}
