import 'package:flutter/material.dart';
import 'dart:ui';

const kHeight = SizedBox(height: 10);
const kHeight20 = SizedBox(height: 20);
const kHeight5 = SizedBox(height: 5);
const kHeight15 = SizedBox(height: 15);
const kHeight100 = SizedBox(height: 100);

const kWidth = SizedBox(width: 10);
const kWidth15 = SizedBox(width: 15);
const kWidth5 = SizedBox(width: 5);

class ItemModel {
  String label;
  Color color;
  bool isSelected;

  ItemModel(this.label, this.color, this.isSelected);
}
