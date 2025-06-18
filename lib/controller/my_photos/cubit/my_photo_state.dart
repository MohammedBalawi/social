import '../../../models/my_photos/my_photos_model.dart';

abstract class PhotoState {}

class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

class PhotoLoaded extends PhotoState {
  final List<PhotoItemModel> photos;
  PhotoLoaded(this.photos);
}

class PhotoError extends PhotoState {
  final String message;
  PhotoError(this.message);
}