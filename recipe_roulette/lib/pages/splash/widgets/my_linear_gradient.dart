// ignore: file_names
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
LinearGradient MyLinearGradient(Color color, Color color1) {
    return LinearGradient(
              colors: [
                // Color(0xffee4540),
                // Color(0xffc72c41),
                // Color(0xff801336),
                // Color(0xff2d132c),
                color,
                color1,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.2, 0.8],
            );
  }