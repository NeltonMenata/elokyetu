import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final String pais; // so para exemplificar
  final String url;
  final Color color;

  const Category({
    required this.id,
    required this.title,
    required this.pais, // so para exemplificar
    required this.url,
    this.color = Colors.orange,
  });
}
