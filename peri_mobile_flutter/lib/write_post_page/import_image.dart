import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImportImageBtn extends StatefulWidget {
  const ImportImageBtn({super.key});

  @override
  State<ImportImageBtn> createState() => _ImportImageBtnState();
}

class _ImportImageBtnState extends State<ImportImageBtn> {
  late PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.red[400],
        onPressed: () {
          takePhoto(ImageSource.gallery);
        },
        child: Icon(
          Icons.add_a_photo,
          color: Colors.white,
        ));
  }

  void takePhoto(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = pickedFile as PickedFile;
    });
  }
}
