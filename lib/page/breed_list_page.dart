import 'package:flutter/material.dart';
import 'package:flutter_lecture_2024/api/endpoint/breeds_endpoint.dart';
import 'package:flutter_lecture_2024/api/model/breeds.dart';
import 'package:flutter_lecture_2024/page/breed_detail_page.dart';
import 'package:flutter_lecture_2024/page/menu_page.dart';
import 'package:flutter_lecture_2024/widget/credit_notation.dart';
import 'package:flutter_lecture_2024/widget/error_dialog.dart';
import 'package:flutter_lecture_2024/widget/like_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BreedListPage extends ConsumerStatefulWidget {
  const BreedListPage({super.key});

  static const routeName = '/dogs';

  @override
  ConsumerState<BreedListPage> createState() => _BreedListPageState();
}

class _BreedListPageState extends ConsumerState<BreedListPage> {
  late Future<Breeds> _future;

  @override
  void initState() {
    super.initState();
    _future = ref.read(breedsEndpointProvider).$get();
  }

  void reload() {
    setState(() {
      _future = ref.read(breedsEndpointProvider).$get();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('犬種一覧'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MenuPage.routeName);
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _future,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (snapshot.hasError) {
            Future.microtask(
              () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return ErrorDialog(
                      errorText: snapshot.error.toString(),
                      resolve: () {
                        reload();
                      },
                    );
                  },
                );
              },
            );
            return const SizedBox.shrink();
          }

          final breeds = snapshot.requireData.data;
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
              itemBuilder: (_, index) {
                final breed = breeds.elementAt(index);
                return ListTile(
                  leading: LikeButton(id: breed.id),
                  title: Text(breed.attributes.name),
                  subtitle: Text(
                    breed.attributes.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      BreedDetailPage.routeName,
                      arguments: BreedDetailArgs(breedId: breed.id),
                    );
                  },
                  tileColor: Theme.of(context).primaryColor.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.all(5.0),
                );
              },
              itemCount: breeds.length,
              separatorBuilder: (_, __) {
                return const SizedBox(height: 5);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: const CreditNotation(),
    );
  }
}
