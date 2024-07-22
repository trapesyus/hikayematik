import 'package:flutter/material.dart';
import 'package:test_project/core/helper/generic_screen/generic_screen.dart';

class BiografiScreen extends StatelessWidget {
  const BiografiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      tableName: 'biografi',
    );
  }
}
