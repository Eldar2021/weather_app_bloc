import 'package:flutter/material.dart';
import '/presentation/search_page/search_page.dart';

class Search {
  static void sourceBottomSheetRespond(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      backgroundColor: Colors.black,
      barrierColor: Colors.transparent,
      isDismissible: true,
      context: context,
      isScrollControlled: true,
      builder: (context) => const SearchPage(),
    );
  }
}
