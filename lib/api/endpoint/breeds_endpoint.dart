import 'package:dio/dio.dart';
import 'package:flutter_lecture_2024/api/api_client.dart';
import 'package:flutter_lecture_2024/api/model/breeds.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final breedsEndpointProvider = Provider<BreedsEndpoint>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return BreedsEndpoint(apiClient: apiClient);
});

class BreedsEndpoint {
  const BreedsEndpoint({
    required this.apiClient,
  });

  final Dio apiClient;

  Future<Breeds> $get() async{
    final result = await apiClient.get('/breeds');
    return Breeds.fromJson(result.data);
  }
}
