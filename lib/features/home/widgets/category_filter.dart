import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sycorax_cressida/features/home/providers/channel_filter_provider.dart';
import 'package:sycorax_cressida/features/home/providers/channel_list_provider.dart';

class CategoryFilter extends ConsumerWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoryListProvider);
    final selected = ref.watch(selectedCategoryProvider);
    final theme = Theme.of(context);

    return categoriesAsync.when(
      data: (categories) {
        final all = [null, ...categories.map((c) => c.id)];
        final labels = ['All', ...categories.map((c) => c.name)];

        return SizedBox(
          height: 48,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: all.length,
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final isSelected = selected == all[index];
              return FilterChip(
                label: Text(labels[index]),
                selected: isSelected,
                onSelected: (_) {
                  ref
                      .read(selectedCategoryProvider.notifier)
                      .update(all[index]);
                  ref.read(channelListProvider.notifier).refresh();
                },
                selectedColor: theme.colorScheme.primaryContainer,
                checkmarkColor: theme.colorScheme.onPrimaryContainer,
                labelStyle: TextStyle(
                  color: isSelected
                      ? theme.colorScheme.onPrimaryContainer
                      : null,
                ),
              );
            },
          ),
        );
      },
      loading: () => const SizedBox(height: 48),
      error: (e, _) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          height: 48,
          child: Center(
            child: Text(
              'Failed categories',
              style: TextStyle(color: theme.colorScheme.error),
            ),
          ),
        ),
      ),
    );
  }
}
