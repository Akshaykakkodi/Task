import 'package:flutter/material.dart';

class Snack_bar{
  static SnackBar snackBar= SnackBar(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  backgroundColor: Colors.blueGrey[100],
  content:
  const Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  Text("New comment was added",style: TextStyle(color: Colors.black),),
  Icon(Icons.done)
  ],
  ));
}