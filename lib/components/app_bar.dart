  import 'package:flutter/material.dart';

import '../constant.dart';

AppBar appBar({required String title}) {
    return AppBar(iconTheme: IconThemeData(color: Color(0xffeeeeee) ),
     title: Text(title,style: TextStyle(color: Color(0xffeeeeee)),),
       backgroundColor:primaryColor,
    );
  }