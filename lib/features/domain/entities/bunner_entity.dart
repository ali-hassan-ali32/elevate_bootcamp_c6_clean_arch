import 'package:flutter/material.dart';

class BannerEntity {
  String image;
  String title;
  Alignment alignment;

  BannerEntity({
    required this.title,
    required this.image,
    required this.alignment
  });
}