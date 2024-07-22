import 'package:flutter/material.dart';
import 'package:test_project/core/helper/generic_screen/generic_screen.dart';

class DeyimlerVeHikayelerScreen extends StatelessWidget {
  const DeyimlerVeHikayelerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      tableName: 'deyimler_ve_hikayeler',
    );
  }
}
