import 'package:flutter/material.dart';
InputDecoration mFeildDecor({required String hint, required String label}) {
  return InputDecoration(
  hintText: hint,
  labelText: label,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(21),
      ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(21),
        borderSide: BorderSide(
            color: Colors.pink.shade100,
            width: 2
    )
  ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(21),
    )
  );
}