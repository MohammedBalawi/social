import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marrige_app/config/app_colors.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController searchController;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final void Function()? onClearPressed;
  final void Function(String)? onChanged;
  final String hintText;
  final bool clear;
  final Color? fillColor, borderColor;

  const SearchTextField({
    super.key,
    required this.searchController,
    this.onFieldSubmitted,
    this.onTap,
    this.onChanged,
    this.fillColor,
    required this.hintText,
    this.clear = true,
    this.borderColor,
    this.onClearPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      foregroundDecoration: BoxDecoration(
        border: Border.all(
          color: AppColors.borderColor,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(13),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: TextFormField(
        textInputAction: TextInputAction.search,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.secondaryTextGray,
            ),
        onFieldSubmitted: onFieldSubmitted,
        controller: searchController,
        onTap: onTap,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
          border: InputBorder.none,
          hintStyle: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: AppColors.black20Opacity),
          fillColor: Colors.white,
          hintText: hintText,
          filled: true,
          suffixIcon: clear
              ? IconButton(
                  color: Colors.black,
                  onPressed: searchController.clear,
                  icon: const Icon(
                    Icons.clear,
                  ),
                )
              : null,
          prefixIcon: Column(
            children: [
              const Spacer(),
              SvgPicture.asset(
                'assets/icons/search_icon.svg',
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
