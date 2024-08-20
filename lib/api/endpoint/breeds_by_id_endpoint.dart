
import 'package:dio/dio.dart';
import 'package:flutter_lecture_2024/api/api_client.dart';
import 'package:flutter_lecture_2024/api/model/breed.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final breedsByIdEndpointProvider = Provider<BreedsByIdEndpoint>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return BreedsByIdEndpoint(apiClient: apiClient);
});

class BreedsByIdEndpoint {
  const BreedsByIdEndpoint({
    required this.apiClient,
  });

  final Dio apiClient;

  Future<Breed> $get({required String id}) async{
    final result = await apiClient.get("/breeds/$id");
    return Breed.fromJson(result.data['data']);
  }
}
