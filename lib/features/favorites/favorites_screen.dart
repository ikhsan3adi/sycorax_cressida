import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sycorax_cressida/data/providers.dart';
import 'package:sycorax_cressida/features/home/providers/home_content_provider.dart';
import 'package:sycorax_cressida/shared/widgets/widgets.dart';
import 'package:sycorax_cressida/features/favorites/providers.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoritesListProvider);

    return favoritesAsync.when(
      data: (channels) {
        if (channels.isEmpty) {
          return const Center(child: Text('No favorites yet'));
        }
        return ListView.builder(
          itemCount: channels.length,
          itemBuilder: (context, index) {
            final channel = channels[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              child: ChannelExpansionTile(
                channel: channel,
                onChildTap: (mode) {
                  if (mode == HomeContentMode.browse) {
                    ref.read(homeContentProvider.notifier).setBrowseMode();
                  }
                  context.go('/');
                },
                trailing: FavoriteButton(
                  isFavorite: true,
                  onPressed: () async {
                    await ref
                        .read(favoritesRepositoryProvider)
                        .toggleFavorite(channel.id);
                    ref.invalidate(favoritesListProvider);
                  },
                ),
              ),
            );
          },
        );
      },
      loading: () => const LoadingWidget(message: 'Loading favorites...'),
      error: (e, _) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48),
            const SizedBox(height: 16),
            const Text('Failed to load favorites'),
            const SizedBox(height: 4),
            Text(
              e.toString(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
