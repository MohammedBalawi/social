import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/my_photos/my_photos_model.dart';
import 'my_photo_state.dart';

class PhotoCubit extends Cubit<PhotoState> {
  PhotoCubit() : super(PhotoInitial());

  List<PhotoItemModel> _photos = [];

  List<PhotoItemModel> get photos => _photos;

  Future<void> loadPhotosFromJson() async {
    emit(PhotoLoading());
    try {
      final String response = await rootBundle.loadString('assets/json/photos_data.json');
      final List<dynamic> data = jsonDecode(response);
      _photos = data.map((e) => PhotoItemModel.fromJson(e)).toList();
      emit(PhotoLoaded(_photos));
    } catch (e) {
      emit(PhotoError('Failed to load photos'));
    }
  }

  void deletePhoto(int index) {
    _photos.removeAt(index);
    emit(PhotoLoaded(List.from(_photos)));
  }

  void togglePhotoVisibility(int index) {
    _photos[index].hidden = !_photos[index].hidden;
    emit(PhotoLoaded(List.from(_photos)));
  }

  void addPhoto(PhotoItemModel photo) {
    _photos.insert(_photos.length - 1, photo);
    emit(PhotoLoaded(List.from(_photos)));
  }
}
