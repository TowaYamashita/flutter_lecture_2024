import 'package:flutter/material.dart';
import 'package:flutter_lecture_2024/page/breed_detail_page.dart';
import 'package:flutter_lecture_2024/page/menu_page.dart';

Route buildRoutes(RouteSettings settings) {
  switch (settings.name) {
    case BreedDetailPage.routeName:
      final args = settings.arguments as BreedDetailArgs;
      return MaterialPageRoute(
        builder: (context) {
          return BreedDetailPage(
            args: args,
          );
        },
      );
    case MenuPage.routeName:
      return MaterialPageRoute(
        builder: (context) {
          return const MenuPage();
        },
        fullscreenDialog: true,
      );
    default:
      throw Exception('未定義のルートへ遷移しようとしています。');
  }
}
