import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../core/colors/app_colors.dart';


class TrackingModel {
  final String title;
  final String description;
  final String color;
  final bool leftAligned;
  final bool shownToClient;
  final String status;
  final String? uploadPath;
  final String time;

  const TrackingModel({
    required this.title,
    required this.description,
    required this.color,
    required this.leftAligned,
    required this.shownToClient,
    required this.status,
    this.uploadPath,
    required this.time,
  });
}
