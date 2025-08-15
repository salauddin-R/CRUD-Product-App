import 'package:curd_product/Style/style.dart';
import 'package:flutter/material.dart';
import '../RestApi/RestClient.dart';
import 'ProductGreedViewScreen.dart';

class Productcreatescreen extends StatefulWidget {
  const Productcreatescreen({super.key});

  @override
  State<Productcreatescreen> createState() => _ProductcreatescreenState();
}

class _ProductcreatescreenState extends State<Productcreatescreen> {

  bool Loading = false;
  Map<String, String> FromValue = {"Img": "", "ProductCode": "",
    "ProductName": "", "Qty": "", "TotalPrice": "", "UnitPrice": ""};

  InputonChange(MapKey, MapValue) {
    setState(() {
      FromValue.update(MapKey, (value) => MapValue);
    });
  }

  FormOnSubmit() async
  {
    if (FromValue["ProductName"]!.isEmpty) {
      ErrorToast("ProductName requird");
    }
    else if (FromValue["ProductCode"]!.isEmpty) {
      ErrorToast("ProductCode requird");
    }
    else if (FromValue["Img"]!.isEmpty) {
      ErrorToast("Img url requird");
    }
    else if (FromValue["TotalPrice"]!.isEmpty) {
      ErrorToast("TotalPrice requird");
    } else if (FromValue["UnitPrice"]!.isEmpty) {
      ErrorToast("UnitPrice requird");
    } else if (FromValue["Qty"]!.isEmpty) {
      ErrorToast("Qty requird");
    }
    else {
      setState(() {
        Loading = true;
      });
      await ProductCreateRequest(FromValue);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context)=>Productgreedviewscreen()),
              (Route route)=>false
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CreateProduct", style: TextStyle(color: colorWhite),),
        centerTitle: true,
        backgroundColor: colorDarkBlue,
      ),
      body:
      Stack(
        children: [
          screenBackground(context),
          Container(
            child: Loading? Center(child: CircularProgressIndicator(color: Colors.red,),):SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(onChanged: (value) {
                    InputonChange("ProductName", value);
                  },
                    decoration: appInputDecoration("Product Name"),),
                  SizedBox(height: 20,),
                  TextFormField(onChanged: (value) {
                    InputonChange("ProductCode", value);
                  },
                    decoration: appInputDecoration("Product Code"),),
                  SizedBox(height: 20,),
                  TextFormField(onChanged: (value) {
                    InputonChange("Img", value);
                  },
                    decoration: appInputDecoration("Product Image"),),
                  SizedBox(height: 20,),
                  TextFormField(onChanged: (value) {
                    InputonChange("TotalPrice", value);
                  },
                    decoration: appInputDecoration("Total Price"),),
                  SizedBox(height: 20,),
                  TextFormField(onChanged: (value) {
                    InputonChange("UnitPrice", value);
                  },
                    decoration: appInputDecoration("Unit Price"),),
                  SizedBox(height: 20,),
                  appDropDownStyle(

                    DropdownButton(
                      value: FromValue["Qty"],
                      items: [
                        DropdownMenuItem(child: Text("Select QT"), value: "",),
                        DropdownMenuItem(child: Text("1"),
                          value: "1",),
                        DropdownMenuItem(child: Text("2"),
                          value: "2",),
                        DropdownMenuItem(child: Text("3"),
                          value: "3",),
                        DropdownMenuItem(child: Text("4"),
                          value: "4",),
                        DropdownMenuItem(child: Text("5"),
                          value: "5",),
                        DropdownMenuItem(child: Text("6"),
                          value: "6",),
                        DropdownMenuItem(child: Text("7"),
                          value: "7",),
                      ],
                      onChanged: (value) {
                        InputonChange("Qty", value.toString());
                      },
                      isExpanded: true,
                      underline: Container(),

                    ),

                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    style: appButtonStyle(),
                    onPressed: () {
                      FormOnSubmit();
                    },
                    child: successButton("Submit"),
                  )

                ],
              ),
            ), ),
        ],
      ),
    );
  }
}

