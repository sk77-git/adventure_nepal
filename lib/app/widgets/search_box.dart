import 'package:flutter/material.dart';

class StaticTextField extends StatelessWidget {
  const StaticTextField({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          fillColor: Colors.white,
          filled: true,
          labelText: 'Search PDFs',
          labelStyle: const TextStyle(color: Colors.black54),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.indigo, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.indigo.shade300.withOpacity(0.2), width: 1),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.indigo.shade300.withOpacity(0.2), width: 1),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}