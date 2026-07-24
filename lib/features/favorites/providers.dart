import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sycorax_cressida/data/providers.dart';

final favoritesListProvider = FutureProvider((ref) async {
  final repo = ref.watch(favoritesRepositoryProvider);
  return repo.getFavorites();
});

final isFavoriteProvider = FutureProvider.family<bool, String>((
  ref,
  channelId,
) async {
  final repo = ref.watch(favoritesRepositoryProvider);
  return repo.isFavorite(channelId);
});
