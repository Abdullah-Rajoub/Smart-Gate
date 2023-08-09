import 'package:flutter/material.dart';

// class SearchTextField extends StatefulWidget {
//   final TextEditingController controller;
//
//   SearchTextField({required this.controller});
//
//   @override
//   _SearchTextFieldState createState() => _SearchTextFieldState();
// }

// class _SearchTextFieldState extends State<SearchTextField> {
//   bool _showClearButton = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: widget.controller,
//       onChanged: (value) {
//         setState(() {
//           _showClearButton = value.isNotEmpty;
//         });
//       },
//       decoration: InputDecoration(
//         hintText: 'Search',
//         hintStyle: TextStyle(color: Colors.grey),
//         prefixIcon: Icon(Icons.search, color: Colors.grey),
//         suffixIcon: _showClearButton
//             ? IconButton(
//                 icon: Icon(Icons.clear, color: Colors.grey),
//                 onPressed: () {
//                   widget.controller.clear();
//                   setState(() {
//                     _showClearButton = false;
//                   });
//                 },
//               )
//             : null,
//         filled: true,
//         fillColor: Colors.white,
//         contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30.0),
//           borderSide: BorderSide.none,
//         ),
//       ),
//     );
//   }
// }

class SearchTextField extends StatefulWidget {
  late String label;
  var onChanged;
  var currentText;

  SearchTextField({
    required this.label,
    required this.onChanged,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController = TextEditingController();
    _textEditingController.addListener(() {
      widget.currentText = _textEditingController.text;
      setState(() {});
      widget.onChanged(_textEditingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: TextField(
        style: TextStyle(color: Colors.white),
        controller: _textEditingController,
        decoration: InputDecoration(
          suffixIcon: _textEditingController.text.isEmpty
              ? Container()
              : IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _textEditingController.clear();
                  },
                ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.blue.shade300,
          prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0),
              child: Icon(
                Icons.search,
                color: Colors.white70,
              )),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
