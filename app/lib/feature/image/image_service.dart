import 'package:image_picker/image_picker.dart';

class ImageService {
  final ImagePicker _picker = ImagePicker();

  // ギャラリーから画像を選択またはカメラで写真を撮影
  Future<XFile?> pickImage({required ImageSource source}) async {
    return await _picker.pickImage(source: source);
  }
}
