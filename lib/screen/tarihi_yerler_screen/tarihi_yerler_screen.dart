import 'package:flutter/material.dart';
import 'package:test_project/core/helper/generic_screen/generic_screen.dart';

class TarihiYerlerScreen extends StatelessWidget {
  const TarihiYerlerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericScreen(tableName: 'tarihi_yerler');
  }
}
