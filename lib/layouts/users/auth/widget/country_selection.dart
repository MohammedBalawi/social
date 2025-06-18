import 'package:flutter/material.dart';
import 'package:marrige_app/layouts/users/auth/widget/country_selection_list_view.dart';
import 'package:marrige_app/models/structure/user/base_item.dart';

class CountrySelection extends StatefulWidget {
  final String buttonText;
  final void Function(List<String> selectedBaseItemIds, String mobileCode,
      List<String> selectedCountryNames) onButtonPressed;
  final List<BaseItem> countries;
  final Map<String, String>? flagsMobileCode;
  final List<String>? selectedCountryIds;

  const CountrySelection({
    super.key,
    required this.buttonText,
    required this.countries,
    required this.onButtonPressed,
    this.selectedCountryIds,
    required this.flagsMobileCode,
  });

  @override
  State<CountrySelection> createState() => _CountrySelectionState();
}

class _CountrySelectionState extends State<CountrySelection> {
  List<String> selectedBaseItemIds = [];
  List<BaseItem> filteredCountries = [];
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    selectedBaseItemIds = widget.selectedCountryIds ?? [];
    filteredCountries = widget.countries;
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  String getMobileCode() {
    return widget.flagsMobileCode?[selectedBaseItemIds.isNotEmpty
            ? selectedBaseItemIds.first
            : widget.countries.first.id] ??
        "00";
  }

  void filterCountries(String query) {
    setState(() {
      filteredCountries = widget.countries
          .where((country) =>
              country.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CountrySelectionListView(
      searchController: searchController,
      filter: filterCountries,
      items: filteredCountries,
      selectedBaseItemIds: selectedBaseItemIds,
      onChanged: _onSingleSelectionChanged,
      btnText: widget.buttonText,
      onBtnPressed: _onBtnPressed,
    );
  }

  void _onSingleSelectionChanged(String? value) {
    setState(() {
      selectedBaseItemIds = value != null ? [value] : [];
    });
  }

  void _onBtnPressed() {
    final mobileCode = getMobileCode();
    final selectedCountryNames = selectedBaseItemIds
        .map((id) => widget.countries.firstWhere((item) => item.id == id).name)
        .toList();
    widget.onButtonPressed(
        selectedBaseItemIds, mobileCode, selectedCountryNames);
  }
}
