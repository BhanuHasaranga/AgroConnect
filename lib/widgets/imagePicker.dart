import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatelessWidget {
  final Function(XFile?) onImageSelected;

  const CustomImagePicker({Key? key, required this.onImageSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }

  static const Color iconColor = Color(0x7F373737);

  static Future<XFile?> showImagePickerDialog(
    BuildContext context,
    Function(XFile? image) onImageSelected,
  ) async {
    return showDialog<XFile?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          contentPadding: const EdgeInsets.all(16),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () =>
                    _pickImage(context, ImageSource.camera, onImageSelected),
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: Color(0x7F373737),
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () =>
                    _pickImage(context, ImageSource.gallery, onImageSelected),
                icon: const Icon(
                  Icons.photo_outlined,
                  color: Color(0x7F373737),
                  size: 30,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> _pickImage(BuildContext context, ImageSource source,
      Function(XFile?) onImageSelected) async {
    XFile? image = await ImagePicker().pickImage(source: source);
    onImageSelected(image); // Call the callback with the selected image
    Navigator.of(context).pop(image);
  }
}
