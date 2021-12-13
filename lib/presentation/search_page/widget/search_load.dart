import 'package:flutter/material.dart';

class SearchLoad extends StatelessWidget {
  const SearchLoad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
