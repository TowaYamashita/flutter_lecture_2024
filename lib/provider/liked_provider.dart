import 'package:flutter_riverpod/flutter_riverpod.dart';

final likedNotifierProvider = StateNotifierProvider<LikedNotifier, Set<String>>((ref) {
  return LikedNotifier();
});

class LikedNotifier extends StateNotifier<Set<String>> {
  LikedNotifier() : super({});

  void toggle(String id){
    if(state.contains(id)){
      _unregister(id);
    }else{
      _register(id);
    }
  }

  void _register(String id) {
    state.add(id);
    state = {...state};
  }

  void _unregister(String id) {
    state.remove(id);
    state = {...state};
  }
}
