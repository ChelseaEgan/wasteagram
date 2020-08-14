import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wasteagram/services/image_select_service.dart';
import 'package:wasteagram/widgets/scroll_view_layout.dart';

class PostCreateForm extends StatefulWidget {
  final ImageSelectService imageSelect;
  final GlobalKey formKey;
  final saveForm;
  final saveAmount;

  PostCreateForm(
      {Key key, this.imageSelect, this.formKey, this.saveForm, this.saveAmount})
      : super(key: key);

  @override
  _PostCreateFormState createState() => _PostCreateFormState();
}

class _PostCreateFormState extends State<PostCreateForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Wasteagram'),
        ),
        bottomNavigationBar: BottomAppBar(child: saveButton()),
        body: scrollViewLayout(context, formLayout(context)));
  }

  Widget saveButton() => Semantics(
        button: true,
        label: 'Save Button',
        onTapHint: 'Save the wasted food information',
        child: FlatButton(
          onPressed: () => widget.saveForm(),
          child: Icon(
            Icons.cloud_upload,
            size: 48,
          ),
          color: Colors.teal,
          padding: EdgeInsets.all(10),
        ),
      );

  Widget formLayout(BuildContext context) => Form(
        key: widget.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            postImage(context),
            SizedBox(height: 10),
            amountOfWasteInput(context),
          ],
        ),
      );

  Widget postImage(BuildContext context) => Semantics(
        image: true,
        label: 'Wasted food',
        child: Container(
          height: pictureHeight(context),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: FileImage(widget.imageSelect.image),
              fit: BoxFit.fill,
            ),
          ),
        ),
      );

  Widget amountOfWasteInput(BuildContext context) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Semantics(
          focusable: true,
          label: 'Number of wasted items input field',
          textField: true,
          hint: 'Enter the number of wasted items',
          child: TextFormField(
            autofocus: false,
            decoration: InputDecoration(
                labelText: 'Number of Wasted Items',
                border: UnderlineInputBorder()),
            keyboardType: TextInputType.number,
            onSaved: (value) => widget.saveAmount(int.parse(value)),
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            validator: (value) => numberValidator(value),
          ),
        ),
      );

  dynamic numberValidator(String value) {
    if (int.tryParse(value) != null) {
      final intVal = int.parse(value);
      if (intVal > 0) {
        return null;
      }
    }
    return 'Please enter a positive number';
  }

  double pictureHeight(BuildContext context) =>
      MediaQuery.of(context).size.height * .33;
}
