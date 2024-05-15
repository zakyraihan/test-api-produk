// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class KategoriWidget extends StatefulWidget {
  KategoriWidget({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  void Function()? onTap;

  @override
  State<KategoriWidget> createState() => _KategoriWidgetState();
}

class _KategoriWidgetState extends State<KategoriWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          widget.title,
        ),
      ),
    );
  }
}
