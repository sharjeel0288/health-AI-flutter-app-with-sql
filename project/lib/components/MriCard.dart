// ignore_for_file: depend_on_referenced_packages, camel_case_types, avoid_print, use_build_context_synchronously, file_names

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/services/model%20utils/uploadImgToFirebase.dart';

// ignore: must_be_immutable
class MriCard extends StatelessWidget {
  Icon icon;
  // final void Function() onpress;
  String headingtext, bodyText, modelCode;
  MriCard({
    super.key,
    required this.icon,
    required this.headingtext,
    required this.bodyText,
    required this.modelCode,
    // required this.onpress
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(255, 228, 224, 224), //New
              blurRadius: 10.0,
              offset: Offset(0, -1))
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Color.fromARGB(255, 250, 249, 249),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                headingtext,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                bodyText,
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                border: Border.all(color: Colors.white),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  showCupertinoModalBottomSheet(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      actions: <Widget>[
                        CupertinoActionSheetAction(
                          child: const Text("Scan with camera"),
                          onPressed: () async {
                            // ignore: no_leading_underscores_for_local_identifiers

                            // Capture a photo
                            final ImagePicker picker = ImagePicker();
                            final XFile? photo = await picker.pickImage(
                                source: ImageSource.camera);

                            // img=photo;
                            
                            final filePath = photo?.path;
                            print("filepath =  $filePath");
                            uploadImageToFirebase(photo);
                            // Navigator.pop(context);
                          },
                        ),
                        CupertinoActionSheetAction(
                          child: const Text("Selcect from images"),
                          onPressed: () async {
                            // ignore: no_leading_underscores_for_local_identifiers
                            final ImagePicker _picker = ImagePicker();

                            // Capture a photo
                            final XFile? photo = await _picker.pickImage(
                                source: ImageSource.gallery);
                            // img=photo;
                            final filePath = photo?.path;
                            print("filepath =  $filePath");
                            uploadImageToFirebase(photo);
                            // Navigator.pop(context);
                          },
                        )
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        child: const Text("Cancel"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                  print('pressed');
                },
                child: const Text(
                  'Analyze',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
