import 'package:bookit_driver_app/constants/colors.dart';
import 'package:flutter/material.dart';


class AppbarWidget extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const AppbarWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      title: Text(
        title,
        style:
            TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: blue),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
