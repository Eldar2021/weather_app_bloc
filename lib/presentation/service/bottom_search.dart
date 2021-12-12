import 'package:flutter/material.dart';

class Search {
  static void sourceBottomSheetRespond(
    BuildContext context, {
    Function? search,
    required Function onChanged,
    Function? select,
  }) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      backgroundColor: Colors.black,
      barrierColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Enter city name',
                  ),
                  // controller: textEditingController,
                  autofocus: true,
                  onChanged: (val) {
                    onChanged(val);
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
