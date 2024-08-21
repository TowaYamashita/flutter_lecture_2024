import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lecture_2024/api/endpoint/breeds_by_id_endpoint.dart';
import 'package:flutter_lecture_2024/api/model/breed.dart';
import 'package:flutter_lecture_2024/page/menu_page.dart';
import 'package:flutter_lecture_2024/util/url_util.dart';
import 'package:flutter_lecture_2024/widget/credit_notation.dart';
import 'package:flutter_lecture_2024/widget/like_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BreedDetailArgs {
  const BreedDetailArgs({
    required this.breedId,
  });

  final String breedId;
}

class BreedDetailPage extends ConsumerStatefulWidget {
  const BreedDetailPage({
    super.key,
    required this.args,
  });

  final BreedDetailArgs args;

  static const routeName = '/dog';

  @override
  ConsumerState<BreedDetailPage> createState() => _BreedDetailPageState();
}

class _BreedDetailPageState extends ConsumerState<BreedDetailPage> {
  late Future<Breed> _future;

  @override
  void initState() {
    super.initState();
    _future =
        ref.read(breedsByIdEndpointProvider).$get(id: widget.args.breedId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('犬種詳細'),
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
            return Center(
              child: Text("error: ${snapshot.error.toString()}"),
            );
          }

          final breed = snapshot.requireData;

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: buildImageUrl(id: breed.id),
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    placeholder: (_, __) {
                      return const CircularProgressIndicator.adaptive();
                    },
                    imageBuilder: (_, imageProvider) {
                      return Stack(
                        children: [
                          Image(
                            image: imageProvider,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: LikeButton(id: breed.id),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: "id: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: breed.id),
                            ],
                          ),
                        ),
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "犬種名: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: 'TODO'),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: "説明: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: breed.attributes.description),
                            ],
                          ),
                        ),
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "寿命(目安): ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "TODO",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const CreditNotation(),
    );
  }
}
