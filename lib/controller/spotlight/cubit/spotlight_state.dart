import '../../../models/spotlight/spotlight_model.dart';

abstract class SpotlightState {}

class SpotlightLoading extends SpotlightState {}

class SpotlightLoaded extends SpotlightState {
  final List<SpotlightModel> items;
  SpotlightLoaded(this.items);
}

class SpotlightError extends SpotlightState {
  final String message;
  SpotlightError(this.message);
}
