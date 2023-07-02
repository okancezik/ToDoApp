import 'package:flutter/material.dart';
import 'package:to_do_app/product/constants/string_constants.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      StringConstants.appName,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.orange,
        fontSize: 80,
        fontWeight: FontWeight.w200,
      ),
    );
  }
}
