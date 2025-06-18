import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/app_config.dart';
import 'package:marrige_app/layouts/onboarding/onboarding_screen.dart';
import 'package:marrige_app/layouts/widgets/buttons/gradiante_button.dart';
import 'package:marrige_app/libs/lang/lang.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      extendBodyBehindAppBar: true,
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
            _contentView(context),
          ],
        ),
      ),
    );
  }

  Widget _contentView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.tr('languageWord'),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AppConfig.supportedLocales.length,
                itemBuilder: (context, index) {
                  var language = AppConfig.supportedLocales[index];
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white, // White background for the container
                      borderRadius: BorderRadius.circular(
                        12,
                      ), // Rounded corners for the container
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                            0.1,
                          ), // Slight shadow for the container
                          blurRadius: 6,
                          offset: const Offset(0, 3), // Shadow position
                        ),
                      ],
                    ),
                    child: RadioListTile<Locale>(
                      value: language['locale'],
                      groupValue: state.locale,
                      onChanged: (Locale? value) {
                        if (value != null) {
                          context.read<LanguageBloc>().add(SetLanguage(value));
                        }
                      },
                      title: Text(language['name'],
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: Colors.black)),
                      activeColor: AppColors.primaryLight,
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 16,
                ),
              );
            },
          ),
          const SizedBox(
            height: 50,
          ),
          GradientButton(
            text: AppLocalizations.of(context)!.tr('continue_b'),
            onPressed: () => _navigateToBoardingScreen(context),
            style: Theme.of(context).textTheme.labelLarge,
          )
        ],
      ),
    );
  }

  void _navigateToBoardingScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OnboardingScreen(),
        settings: const RouteSettings(name: '/onboarding'),
      ),
    );
  }
}
