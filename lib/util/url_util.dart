import 'package:flutter_lecture_2024/env/env.dart';

String getBaseApiUrl(){
  return Env.apiBaseUrl;
}

String buildImageUrl({
  required String id,
  int width = 500,
  int height = 280,
}){
  final converted = id.hashCode % 237;
  return '${Env.imageBaseUrl}/$width/$height?id=$converted';
}
