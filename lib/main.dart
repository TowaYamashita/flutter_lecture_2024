import 'package:flutter/material.dart';
import 'package:flutter_lecture_2024/api/api_client.dart';
import 'package:flutter_lecture_2024/page/breed_list_page.dart';
import 'package:flutter_lecture_2024/routes.dart';
import 'package:flutter_lecture_2024/util/url_util.dart';
import 'package:flutter_lecture_2024/widget/credit_notation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        apiClientProvider.overrideWithValue(
          createDioInstance(
            baseUrl: getBaseApiUrl(),
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: buildRoutes,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed(BreedListPage.routeName);
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text('犬種を見る'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CreditNotation(),
    );
  }
}
