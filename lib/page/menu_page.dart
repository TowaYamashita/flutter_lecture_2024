import 'package:flutter/material.dart';
import 'package:flutter_lecture_2024/widget/credit_notation.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  static const routeName = '/menu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('メニュー'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: ListTile(
            leading: const Icon(Icons.note),
            title: const Text('ライセンスを確認'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              showLicensePage(context: context);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CreditNotation(),
    );
  }
}
