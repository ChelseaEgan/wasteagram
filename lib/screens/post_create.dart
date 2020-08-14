import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:wasteagram/services/image_select_service.dart';
import 'package:wasteagram/widgets/post_create_form_widget.dart';
import '../firebase/post_entry_dto.dart';
import '../firebase/data_storage.dart';
import '../screens/posts_list.dart';
import '../services/location_service.dart';

class PostCreate extends StatefulWidget {
  static const route = 'post-create';

  @override
  _PostCreateState createState() => _PostCreateState();
}

class _PostCreateState extends State<PostCreate> {
  ImageSelectService imageSelect = ImageSelectService();
  final formKey = GlobalKey<FormState>();
  final postEntryFields = PostEntryDTO();

  @override
  Widget build(BuildContext context) {
    if (imageSelect.url == null) {
      getNewImage();
      return Center(child: CircularProgressIndicator());
    }
    return PostCreateForm(
      imageSelect: imageSelect,
      formKey: formKey,
      saveForm: saveForm,
      saveAmount: saveAmount,
    );
  }

  void getNewImage() async {
    var result = await imageSelect.getImage();
    if (result == null) {
      Navigator.of(context).pop();
    } else {
      setState(() {});
    }
  }

  void saveForm() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      postEntryFields.date = DateTime.now();
      postEntryFields.imageURL = imageSelect.url;
      Map<String, double> locationData = await getLocationData();
      postEntryFields.latitude = locationData['latitude'];
      postEntryFields.longitude = locationData['longitude'];
      DataStorage.uploadData(dto: postEntryFields);
      formKey.currentState.reset();
      Navigator.of(context).pushNamed(PostsList.route);
    }
  }

  void saveAmount(int amount) => postEntryFields.quantity = amount;

  Future<Map<String, double>> getLocationData() async {
    LocationService location = LocationService();
    LocationData data = await location.getLocation();
    return {
      'latitude': data.latitude ?? 0,
      'longitude': data.longitude ?? 0,
    };
  }
}
