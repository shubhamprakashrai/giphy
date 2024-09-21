import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphyapp/app/utils/app_constant/app_colors.dart';

class SearchPage extends StatefulWidget {
  final void Function(String)? onSearch;

  const SearchPage({
    super.key,
    required this.onSearch,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  final InputBorder borderDecoration = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: AppColors.white),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ]
      ),
      child: TextField(
        controller: _searchController,
        cursorColor: AppColors.purpleColors,
        onChanged: widget.onSearch,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          hintText: 'Search GIFs',
          hintStyle: const TextStyle(
            color: Color(0xFFB7B7B7),
            fontSize: 14,
          ),
          fillColor: AppColors.white,
          filled: true,
          isDense: true,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
            child: const Icon(Icons.search),
          ),
          enabledBorder: borderDecoration,
          focusedBorder: borderDecoration,
          border: borderDecoration,
        ),
      ).marginSymmetric(horizontal: 16),
    );
  }
}
