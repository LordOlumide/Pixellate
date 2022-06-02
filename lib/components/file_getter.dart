import 'dart:io';
import 'package:image_picker/image_picker.dart';

final ImagePicker _picker = ImagePicker();

/// Opens the file picker to get a single image and returns the File object
Future<List<File>?> getNewImageFiles() async {
  List<XFile>? images = [];
  images = await _picker.pickMultiImage();
  if (images != []) {
    return [for (XFile image in images!) File(image.path)];
  }
  return null;
}
