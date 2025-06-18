import 'package:flutter/material.dart';
import 'package:marrige_app/layouts/users/auth/widget/country_selection_list_view.dart';
 import 'package:marrige_app/layouts/users/auth/widget/header_widget.dart';
import 'package:marrige_app/layouts/widgets/keyboard_dismiss.dart';
import 'package:marrige_app/models/structure/user/base_item.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({
    super.key,
    required this.countries,
    this.flagsMobileCode,
    this.title = 'country_n',
    this.isSingleSelect = true,
    this.selectedCountryIds,
  });

  final List<BaseItem> countries;
  final List<String>? selectedCountryIds;

  final Map<String, String>? flagsMobileCode;
  final String title;
  final bool isSingleSelect;

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  List<String> selectedBaseItemIds = [];
  List<BaseItem> filteredCountries = [];
  bool _isSelectAll = false;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    selectedBaseItemIds = List<String>.from(widget.selectedCountryIds ?? []);

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
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: HeaderWidget(
          widget: _content(context),
          title: widget.title,
          isSelectAll: _isSelectAll,
          showSelectAllButton: widget.isSingleSelect ? false : true,
          selectAllBtnObPressed: selectAllCountries,
        ),
      ),
    );
  }

  void selectAllCountries() {
    setState(() {
      if (selectedBaseItemIds.length == widget.countries.length) {
        _isSelectAll = false;
        selectedBaseItemIds.clear();
      } else {
        selectedBaseItemIds = widget.countries.map((e) => e.id).toList();
        _isSelectAll = true;
      }
    });
  }

  Widget _content(BuildContext context) {
    return CountrySelectionListView(
        searchController: searchController,
        filter: filterCountries,
        isSingleSelect: widget.isSingleSelect,
        items: filteredCountries,
        selectedBaseItemIds: selectedBaseItemIds,
        onChanged: _onSingleSelectionChanged,
        onChangedMultiSelect: _onMultiSelectChanged,
        btnText: 'save',
        onBtnPressed: _onBtnPressed,

    );
  }

  void _onSingleSelectionChanged(String? value) {
    setState(() {
      selectedBaseItemIds = value != null ? [value] : [];
    });
  }

  void _onMultiSelectChanged(bool? selected, BaseItem country) {
    setState(() {
      if (selected != null && selected) {
        selectedBaseItemIds.add(country.id);
      } else {
        selectedBaseItemIds.remove(country.id);
      }
    });
  }

  void _onBtnPressed() {
    final selectedCountryNames = selectedBaseItemIds
        .map((id) => widget.countries.firstWhere((item) => item.id == id).name)
        .toList();
    Navigator.pop(
      context,
      CountrySelectionResult(
        selectedBaseItemIds,
        selectedCountryNames,
        _isSelectAll,
      ),
    );
  }
}

class CountrySelectionResult {
  final List<String> selectedIds;
  final List<String> selectedNames;
  final bool isSelectAll;

  CountrySelectionResult(
    this.selectedIds,
    this.selectedNames,
    this.isSelectAll,
  );
}
