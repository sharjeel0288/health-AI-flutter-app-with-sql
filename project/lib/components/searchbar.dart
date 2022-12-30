// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sticky_headers/sticky_headers.dart';
// import 'package:searchbar_animation/searchbar_animation.dart';

// class SearchBar extends StatelessWidget {
//   final myController = TextEditingController();
//   Widget contentWidget;
//   SearchBar({required this.contentWidget});
//   @override
//   Widget build(BuildContext context) {
//     return StickyHeader(
//       header: Container(
//         alignment: Alignment.centerLeft,
//         child: SearchBarAnimation(
//           isOriginalAnimation: false,
//           buttonBorderColour: Colors.black45,
//           buttonIcon: Icons.search,
//           onFieldSubmitted: (String value) {
//             debugPrint('onFieldSubmitted value $value');
//           },
//           textEditingController: myController,
//         ),
//       ),
//       content: contentWidget,
//     );
//   }
// }
