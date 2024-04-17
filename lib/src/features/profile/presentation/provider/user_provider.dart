import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/services/user_service.dart';

final userServiceProvider = StateProvider<UserService>(
  (ref) => UserService(),
);

final getUserProvider = FutureProvider((ref) {
  final user = ref.watch(userServiceProvider);

  return user.getUserProfile();
});


final updateUserProfileProvider = StateNotifierProvider<UserService, bool>(
      (ref) => UserService(),
);


final getFavoritesProvider = FutureProvider((ref) {
  final user = ref.watch(userServiceProvider);

  return user.getFavorites();
});

