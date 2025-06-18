import 'package:flutter/material.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/manager_font_size.dart';
import 'package:marrige_app/config/manager_width.dart';

import '../../../config/responsive/screen_util_new.dart';

class FeatureComparisonCard extends StatelessWidget {
  const FeatureComparisonCard({super.key});

  final List<String> plans = const ['Free', 'Silver', 'Golden', 'Diamond'];

  final List<String> features = const [
    '- View album photos for members.',
    'Show other contact methods such as "WhatsApp, Facebook, Twitter ..etc"',
    'Show other contact methods such as "WhatsApp, Facebook, Twitter ..etc"',
  ];

  final List<List<bool>> accessMatrix = const [
    [false, false, true, true],
    [false, true, true, true],
    [false, true, true, true],
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode? AppColors.backgroundDark:AppColors.white, // نفس لون الخلفية
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Features and Differences",
            style: TextStyle(
              color: AppColors.vibrantPink, // لون وردي واضح
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Expanded(flex: 2, child: SizedBox()),
              ...plans.map(
                    (plan) => Expanded(
                  child: Center(
                    child: Text(
                      plan,
                      style:  TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isDarkMode?AppColors.white:AppColors.black,
                        fontSize: ManagerFontSize.s12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...List.generate(features.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      features[index],
                      style:  TextStyle(
                        color: isDarkMode?AppColors.white:AppColors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  ...accessMatrix[index].map(
                        (hasAccess) => Expanded(
                      child: Center(
                        child: Icon(
                          hasAccess ? Icons.check_box_rounded : Icons.cancel_rounded,
                          color: hasAccess ? Colors.green : Colors.red,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
