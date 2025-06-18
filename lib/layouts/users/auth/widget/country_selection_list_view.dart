import 'package:flutter/material.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/layouts/widgets/buttons/gradiante_button.dart';
import 'package:marrige_app/layouts/widgets/search_text_field.dart';
import 'package:marrige_app/libs/lang/localization_helper.dart';
import 'package:marrige_app/models/structure/user/base_item.dart';

class CountrySelectionListView extends StatelessWidget {
  const CountrySelectionListView({
    super.key,
    required this.searchController,
    required this.filter,
    required this.items,
    required this.selectedBaseItemIds,
    this.isSingleSelect = true,
    required this.onChanged,
    this.onChangedMultiSelect,
    required this.btnText,
    required this.onBtnPressed,
  });
  final TextEditingController searchController;
  final void Function(String query) filter;
  final List<BaseItem> items;
  final List<String> selectedBaseItemIds;
  final bool isSingleSelect;
  final ValueChanged<String?> onChanged;
  final void Function(bool? selected, BaseItem country)? onChangedMultiSelect;
  final String btnText;
  final VoidCallback onBtnPressed;
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Search Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SearchTextField(
              searchController: searchController,
              hintText: AppLocalizations.of(context)!.tr('search_for'),
              onChanged: filter,
            ),
          ),

          SizedBox(
            height: isLandscape
                ? MediaQuery.of(context).size.height * 0.1
                : MediaQuery.of(context).size.height * 0.55,
            child: ListView.builder(
              itemCount: items.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                final baseItem = items[index];
                bool isSelected = selectedBaseItemIds.contains(baseItem.id);

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: isSingleSelect
                      ? RadioListTile<String>(
                          value: baseItem.id,
                          groupValue: selectedBaseItemIds.isNotEmpty
                              ? selectedBaseItemIds.first
                              : null,
                          onChanged: onChanged,
                          title: _title(context, baseItem.name, isSelected),
                          controlAffinity: ListTileControlAffinity.leading,
                        )
                      : CheckboxListTile(
                          value: isSelected,
                          onChanged: (select) =>
                              onChangedMultiSelect?.call(select, baseItem),
                          title: _title(context, baseItem.name, isSelected),
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: isLandscape
                ? MediaQuery.of(context).size.height * 0.08
                : MediaQuery.of(context).size.height * 0.05,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42.0),
              child: GradientButton(
                text: AppLocalizations.of(context)!.tr(btnText),
                onPressed: onBtnPressed,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _title(BuildContext context, String name, bool isSelected) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Text(
      name,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: isSelected
                ? (isDarkMode
                    ? AppColors.mediumLavender
                    : Theme.of(context).primaryColor)
                : (isDarkMode ? Colors.white : AppColors.deepPurpleBlack),
          ),
    );
  }
}
