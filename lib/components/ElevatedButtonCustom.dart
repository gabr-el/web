import 'package:flutter/material.dart';

class ElevatedButtonCustom {
  static ElevatedButton create({required VoidCallback onPressed, required String texto}) {
    return ElevatedButton(onPressed: onPressed, child: Text(texto));
  }

  static ElevatedButton createGenerico({required VoidCallback onPressed, required Widget child}) {
    return ElevatedButton(onPressed: onPressed, child: child);
  }

}