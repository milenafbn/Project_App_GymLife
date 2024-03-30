import 'package:flutter/material.dart';
import 'package:gymlife/core/colors.dart';

InputDecoration getInputDecoration(String labelText, {Icon? icon}) {
  return InputDecoration(
    icon: icon,
    hintText: labelText,
    fillColor: Colors.white,
    filled: true ,
    contentPadding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: const BorderSide(
        color: Cores.primarydark,
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 2,
      ),
    ),
  
  );
}