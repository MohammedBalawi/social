
import '../../../models/upgrade_model/upgrade_plan_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpgradeState {
  final bool isLoading;
  final List<UpgradePlanModel> plans;
  final UpgradePlanModel? userActivePlan;
  final int? userDaysRemaining;

  UpgradeState({
    required this.isLoading,
    required this.plans,
    this.userActivePlan,
    this.userDaysRemaining,
  });

  UpgradeState copyWith({
    bool? isLoading,
    List<UpgradePlanModel>? plans,
    UpgradePlanModel? userActivePlan,
    int? userDaysRemaining,
  }) {
    return UpgradeState(
      isLoading: isLoading ?? this.isLoading,
      plans: plans ?? this.plans,
      userActivePlan: userActivePlan ?? this.userActivePlan,
      userDaysRemaining: userDaysRemaining ?? this.userDaysRemaining,
    );
  }
}


class UpgradeCubit extends Cubit<UpgradeState> {
  UpgradeCubit() : super(UpgradeState(isLoading: true, plans: []));

  Future<void> loadUpgradePlans() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 2));

    final String response = await rootBundle.loadString('assets/json/upgrade_offers.json');
    final data = json.decode(response);

    final plansJson = data['plans'] as List;
    final plans = plansJson.map((e) => UpgradePlanModel.fromJson(e)).toList();

    final userPlanJson = data['userPlan'];
    final String planName = userPlanJson['planName'];
    final int daysRemaining = int.tryParse(userPlanJson['daysRemaining'].toString()) ?? 0;

    final UpgradePlanModel? activePlan =
    plans.firstWhere((plan) => plan.title == planName, orElse: () => plans.first);

    emit(UpgradeState(
      isLoading: false,
      plans: plans,
      userActivePlan: activePlan,
      userDaysRemaining: daysRemaining,
    ));
  }
}
