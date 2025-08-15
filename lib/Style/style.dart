import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

const colorRed=Color.fromRGBO(231,28,36,1);
const colorGreen=Color.fromRGBO(33,191,115,1);
const colorWhite=Color.fromRGBO(255,255,255,1);
const colorDarkBlue=Color.fromRGBO(44,62,80,1);

screenBackground(context){
  return Image.asset(
    "assets/images/rony.jpg",
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}

InputDecoration  appInputDecoration(lebel){
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: colorGreen,width: 1)
    ),
    fillColor: colorWhite,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    enabledBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color:colorWhite,width: 0)
    ),
    labelText: lebel
  );
}

DecoratedBox appDropDownStyle(child)
{
  return DecoratedBox(
      decoration: BoxDecoration(
        color: colorWhite,border: Border.all(color: colorWhite,width: 1),
        borderRadius: BorderRadius.circular(4)
      ),
    child:Padding(
        padding: EdgeInsets.only(left: 30,right:30),
    child: child,
    )
  );
}

ButtonStyle appButtonStyle(){
  return ElevatedButton.styleFrom(
    elevation: 1,
    backgroundColor: Colors.transparent,
    padding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(6))
  );
}

Ink successButton(buttondata)
{
  return Ink(
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(6),

    ),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(buttondata,style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 35
      ),),
    ),
  );
}


void SuccessToast(String msg){
  Fluttertoast.cancel();
    Fluttertoast.showToast(
     msg: msg,
     toastLength: Toast.LENGTH_SHORT,
     gravity: ToastGravity.BOTTOM,
     timeInSecForIosWeb: 1,
     backgroundColor: Colors.green,
     textColor: Colors.white,
     fontSize: 16.0
 );
}

void ErrorToast(String msg){
  Fluttertoast.cancel();
    Fluttertoast.showToast(
     msg: msg,
     toastLength: Toast.LENGTH_SHORT,
     gravity: ToastGravity.BOTTOM,
     timeInSecForIosWeb: 1,
     backgroundColor: Colors.red,
     textColor: Colors.white,
     fontSize: 16.0
 );
}


SliverGridDelegateWithFixedCrossAxisCount ProductGreedViewStyle(){
return SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount:2,
  mainAxisSpacing: 2,
  mainAxisExtent: 250
);
}

