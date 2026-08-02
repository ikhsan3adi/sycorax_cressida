import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sycorax_cressida/features/home/providers/channel_filter_provider.dart';
import 'package:sycorax_cressida/features/home/providers/channel_list_provider.dart';

class BrowseFilters extends ConsumerWidget {
  const BrowseFilters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoryListProvider);
    final countriesAsync = ref.watch(countryListProvider);
    // final languagesAsync = ref.watch(languageListProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider).value;
    final selectedCountry = ref.watch(selectedCountryProvider).value;
    // final selectedLanguage = ref.watch(selectedLanguageProvider).value;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        spacing: 8,
        children: [
          Expanded(
            child: _buildDropdown(
              context: context,
              label: 'Category',
              value: selectedCategory,
              itemsAsync: categoriesAsync,
              labelBuilder: (c) => c.name,
              valueBuilder: (c) => c.id,
              onSelected: (String? value) {
                ref.read(selectedCategoryProvider.notifier).set(value);
                ref.read(channelListProvider.notifier).refresh();
              },
            ),
          ),
          // Expanded(
          //   child: _buildDropdown(
          //     context: context,
          //     label: 'Language',
          //     value: selectedLanguage,
          //     itemsAsync: languagesAsync,
          //     labelBuilder: (l) => l.name,
          //     valueBuilder: (l) => l.code,
          //     onSelected: (String? value) {
          //       ref.read(selectedLanguageProvider.notifier).update(value);
          //       ref.read(channelListProvider.notifier).refresh();
          //     },
          //   ),
          // ),
          Expanded(
            child: _buildDropdown(
              context: context,
              label: 'Country',
              value: selectedCountry,
              itemsAsync: countriesAsync,
              labelBuilder: (c) => c.name,
              valueBuilder: (c) => c.code,
              onSelected: (String? value) {
                ref.read(selectedCountryProvider.notifier).set(value);
                ref.read(channelListProvider.notifier).refresh();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown<T>({
    required BuildContext context,
    required String label,
    required String? value,
    required AsyncValue<List<T>> itemsAsync,
    required String Function(T) labelBuilder,
    required String Function(T) valueBuilder,
    required void Function(String?) onSelected,
  }) {
    final theme = Theme.of(context);

    return itemsAsync.when(
      data: (items) {
        if (value != null &&
            items.indexWhere((e) => valueBuilder(e) == value) == -1) {
          value = null;
          Future(() => onSelected(null));
        }
        return DropdownButtonFormField<String>(
          initialValue: value,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            isDense: true,
          ),
          style: theme.textTheme.labelLarge,
          items: [
            const DropdownMenuItem<String>(value: null, child: Text('All')),
            ...items.map(
              (item) => DropdownMenuItem<String>(
                value: valueBuilder(item),
                child: Text(labelBuilder(item)),
              ),
            ),
          ],
          onChanged: onSelected,
          isExpanded: true,
        );
      },
      loading: () =>
          const SizedBox(height: 48, child: Center(child: Text('Loading...'))),
      error: (e, _) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          height: 48,
          child: Center(
            child: Text(
              'Failed',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ),
      ),
    );
  }
}
