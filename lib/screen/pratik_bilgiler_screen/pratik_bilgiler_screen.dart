import 'package:flutter/material.dart';
import 'package:test_project/core/helper/generic_screen/generic_screen.dart';

class PratikBilgilerScreen extends StatelessWidget {
  const PratikBilgilerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      tableName: 'pratik_bilgiler',
    );
  }
}
