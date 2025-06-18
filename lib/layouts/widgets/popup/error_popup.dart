import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/layouts/widgets/buttons/elevate_button.dart';

import 'popup_model.dart';

class ErrorPopup extends StatelessWidget {
  final PopupModel popupModel;

  const ErrorPopup({super.key, required this.popupModel});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      child: Column(
        children: [
          _popupHeader(context, isDarkMode),
          _popupContent(context),
        ],
      ),
    );
  }

  BoxDecoration _decoration(bool isDarkMode) {
    const radius = BorderRadius.only(
      topLeft: Radius.circular(30.0),
      topRight: Radius.circular(30.0),
      bottomRight: Radius.circular(120.0),
      bottomLeft: Radius.circular(120.0),
    );
    if (isDarkMode) {
      return const BoxDecoration(
        color: AppColors.errorDialogContainerDarkBackground,
        borderRadius: radius,
      );
    }

    return BoxDecoration(
      gradient: LinearGradient(
        begin: AlignmentDirectional.topCenter,
        end: AlignmentDirectional.bottomCenter,
        colors: [
          AppColors.errorDialogContainerLightBackground,
          Colors.white.withOpacity(0.75)
        ],
      ),
      borderRadius: radius,
    );
  }

  Widget _popupHeader(BuildContext context, bool isDarkMode) {
    return Container(
      decoration: _decoration(isDarkMode),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10,
              ),
              IconButton(
                icon: SvgPicture.asset('assets/icons/close_icon.svg'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          Visibility(
            visible: popupModel.showImageAsset,
            child: Image.asset(
              'assets/images/error_popup.png',
              width: 131,
              height: 117,
            ),
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }

  Widget _popupContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 12,
          ),
          Visibility(
            visible: popupModel.title != null,
            child: Text(
              '${popupModel.title}',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              popupModel.message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 20),
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
            height: 18,
          ),
        ],
      ),
    );
  }
}
