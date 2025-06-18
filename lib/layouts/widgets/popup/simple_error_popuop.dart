import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/layouts/widgets/buttons/elevate_button.dart';
import 'package:marrige_app/layouts/widgets/popup/popup.dart';

class SimpleErrorPopup extends StatelessWidget {
  const SimpleErrorPopup({
    super.key,
    required this.popupModel,
  });
  final PopupModel popupModel;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Visibility(
                  visible: popupModel.showCloseIcon,
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/close_icon.svg',
                      colorFilter: ColorFilter.mode(
                        isDarkMode ? Colors.white : Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: popupModel.title != null,
              child: Text(
                '${popupModel.title}',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: isDarkMode
                        ? Colors.white
                        : AppColors.inputFieldDarkBackground),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 4.0),
              child: Text(
                popupModel.message,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: isDarkMode ? Colors.white : Colors.black),
              ),
            ),
            if (popupModel.button1Text != null ||
                popupModel.button2Text != null)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
            if (popupModel.button1Text != null)
              ElevateButton(
                text: '${popupModel.button1Text}',
                onPressed: popupModel.button1Action,
                textStyle: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: Colors.black),
                color: Colors.white,
              ),
            if (popupModel.button1Text != null)
              const SizedBox(
                height: 20,
              ),
            if (popupModel.button2Text != null)
              ElevateButton(
                text: '${popupModel.button2Text}',
                onPressed: popupModel.button2Action,
                textStyle: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: Colors.black),
                color: Colors.white,
              ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
