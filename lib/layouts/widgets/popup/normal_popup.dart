import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/layouts/widgets/buttons/elevate_button.dart';
import 'package:marrige_app/layouts/widgets/buttons/gradiante_button.dart';

import 'popup_model.dart';

class NormalPopup extends StatelessWidget {
  final PopupModel popupModel;

  const NormalPopup({super.key, required this.popupModel});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _popupHeader(context, isDarkMode),
          _popupContent(context),
        ],
      ),
    );
  }

  String _image(bool isDarkMode) {
    final img = popupModel.imageAsset;
    if (img != null) {
      return img;
    }

    return isDarkMode
        ? 'assets/images/normal_popup_dark.png'
        : 'assets/images/normal_popup.png';
  }

  Widget _popupHeader(
    BuildContext context,
    bool isDarkMode,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(250.0),
          bottomLeft: Radius.circular(250.0),
        ),
      ),
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
              Visibility(
                visible: popupModel.showCloseIcon,
                child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/close_icon.svg',
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryLight,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
          Visibility(
            visible: popupModel.showImageAsset,
            child: Image.asset(
              _image(isDarkMode),
              width: 164,
              height: 173,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
          ),
        ],
      ),
    );
  }

  Widget _popupContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Visibility(
            visible: popupModel.title != null,
            child: Text(
              '${popupModel.title}',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              popupModel.message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 20),
          if (popupModel.button1Text != null)
            GradientButton(
              text: '${popupModel.button1Text}',
              onPressed: popupModel.button1Action,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          const SizedBox(
            height: 16,
          ),
          if (popupModel.button2Text != null)
            ElevateButton(
              text: '${popupModel.button2Text}',
              onPressed: popupModel.button2Action,
              textStyle: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: AppColors.primaryLight),
              color: Colors.white,
            ),
          const SizedBox(
            height: 18,
          ),
          if (popupModel.button3Text != null)
            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: InkWell(
                onTap: popupModel.button3Action,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    '${popupModel.button3Text}',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
