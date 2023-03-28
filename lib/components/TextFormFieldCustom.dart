import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFieldCustom {
  static Widget create({String? hint, String? label, Color? corTexto,
    required TextEditingController tec, bool? obscureText}) {
    return TextFormField(
      controller: tec,
      obscureText: obscureText==null?false:obscureText,
      style: TextStyle(
          color: corTexto==null?Colors.black:corTexto
      ),
      decoration: InputDecoration(
        //border: InputBorder.none,
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        labelText: label,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }
}