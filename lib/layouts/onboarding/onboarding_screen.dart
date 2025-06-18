import 'package:flutter/material.dart';

import 'package:marrige_app/layouts/users/auth/widget/themed_action_button.dart';
import 'package:marrige_app/libs/connectivity/internet_connection_helper.dart';
import 'package:marrige_app/libs/lang/lang.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final _internetHelper = InternetConnectionHelper();

  @override
  Widget build(BuildContext context) {
    _internetHelper.checkConnectionAndShowError(context);

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/hearts.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const PositionedDirectional(
              start: 16,
              top: 16,
              child: BackButton(
                color: Colors.white,
              ),
            ),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    isDarkMode
                        ? 'assets/images/couple_dark.png'
                        : 'assets/images/couple.png',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    AppLocalizations.of(context)!.tr('find_your_other_half'),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    AppLocalizations.of(context)!
                        .tr('true_place_for_lifelong_partner'),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white.withOpacity(0.7)),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: _button(
                      context,
                      text: AppLocalizations.of(context)!.tr('reg_txt'),
                      onPressed: () => _navigateToRegisterScreen(context),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: _button(
                      context,
                      text: AppLocalizations.of(context)!.tr('login'),
                      onPressed: () => _navigateToLoginScreen(context),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToRegisterScreen(BuildContext context) {

  }

  Widget _button(
    BuildContext context, {
    required String text,
    required VoidCallback onPressed,
  }) {
    return ThemedActionButton(
      text: text,
      onPressed: onPressed,
      lightBtnColor: Colors.white,
      lightBtnTextStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Colors.black,
          ),
    );
  }

  void _navigateToLoginScreen(BuildContext context) {

  }
}
