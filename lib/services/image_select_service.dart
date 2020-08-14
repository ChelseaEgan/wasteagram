import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageSelectService {
  File image;
  String url;
  final ImagePicker imagePicker = new ImagePicker();

  Future<dynamic> getImage() async {
    var pickedImage = await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedImage == null) return null;
    image = File(pickedImage.path);
    var fileName = DateTime.now().millisecondsSinceEpoch.toString();
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('$fileName.jpg');
    StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete;
    url = await storageReference.getDownloadURL();
    return url;
  }
}
