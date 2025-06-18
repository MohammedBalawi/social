import 'package:flutter/material.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/libs/lang/localization_helper.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.widget,
    required this.title,
    this.showSelectAllButton = false,
    this.selectAllBtnObPressed,
    this.isSelectAll = false,
    this.showBackBtn = true,
  });
  final Widget widget;
  final String title;
  final bool showSelectAllButton;
  final VoidCallback? selectAllBtnObPressed;
  final bool isSelectAll;
  final bool showBackBtn;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _header(context),
            Visibility(
              visible: showBackBtn,
              child: PositionedDirectional(
                start: 32,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: Colors.white,
                  onPressed: Navigator.of(context).pop,
                ),
              ),
            ),
            if (showSelectAllButton)
              PositionedDirectional(
                end: 10,
                child: TextButton(
                  onPressed: selectAllBtnObPressed,
                  child: Text(
                    !isSelectAll
                        ? AppLocalizations.of(context)!.tr('select_all')
                        : AppLocalizations.of(context)!.tr('deselect_all'),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                AppLocalizations.of(context)!.tr(title),
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        _space,
        widget,
      ],
    );
  }

  Widget _header(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        gradient: isDarkMode
            ? null
            : const LinearGradient(
                colors: [
                  AppColors.primaryLight,
                  AppColors.headerPurple,
                  AppColors.backgroundLight,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.955, 1.0],
              ),
      ),
    );
  }

  Widget get _space => const SizedBox(
        height: 20,
      );
}
