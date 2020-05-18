
import 'package:flutter/material.dart';

class ZynColorManager {

   static Color changeAppColors(Color color,BuildContext context){
      if(Theme.of(context).brightness == Brightness.light){
        return color;
      }
      return null;
  }
}
