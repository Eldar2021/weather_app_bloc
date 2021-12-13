import 'package:flutter/material.dart';

class InterNetDisConnectedWidget extends StatelessWidget {
  const InterNetDisConnectedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 7, bottom: 7),
      decoration: const BoxDecoration(
        color: Colors.red,
      ),
      child: const Center(
        child: Text("Интернет байланышында ката бар"),
      ),
    );
  }
}
