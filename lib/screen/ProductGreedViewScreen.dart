import 'package:curd_product/screen/ProductCreateScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../RestApi/RestClient.dart';
import '../Style/style.dart';
import 'ProductUpdateScreen.dart';


class Productgreedviewscreen extends StatefulWidget {
  const Productgreedviewscreen({super.key});

  @override
  State<Productgreedviewscreen> createState() => _ProductgreedviewscreenState();
}

class _ProductgreedviewscreenState extends State<Productgreedviewscreen> {
  List ProductList=[];
  bool Loading=true;
  @override
  void initState(){
    CallData();
    super.initState();
  }

  CallData() async {
    try {
      setState(() => Loading = true);
      var data = await ProductGreedViewListRequest();
      print(data); // Debugging
      setState(() {
        ProductList = data;
        Loading = false;
      });
    } catch(e){
      print("Error: $e");
      ErrorToast("data fetching failed");
    }

  }

  GoToUpdate(context,productItem){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>Productupdatescreen(productItem: productItem,))
    );
  }

  DeleteItem(id){
    showDialog(context: context,
        builder:(context){
       return AlertDialog(
         title: Text("Delete!"),
         content: Text("Once delete, You can't get it back!"),
         actions: [
           OutlinedButton(onPressed: ()async{
             Navigator.pop(context);
             setState(() => Loading = true);
            await ProductDeleteRequest(id);
            await CallData();
           }
             , child:Text("Yes")
    ),
           OutlinedButton(onPressed: (){
             Navigator.pop(context);
           }
             , child:Text("No")
    ),
         ],
       );
        }
    );
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
            Loading? Center(child: CircularProgressIndicator(),):RefreshIndicator (
             onRefresh:()async{await CallData();},
                child: SingleChildScrollView(
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: ProductGreedViewStyle(),
                  itemCount: ProductList.length,
                  itemBuilder:(context,index){
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(child:Image.network(ProductList[index]["Img"],fit: BoxFit.cover,)  ),
                          Container(
                            color: Colors.white10,
                            padding: EdgeInsets.fromLTRB(5,5,5,5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(ProductList[index]["ProductName"]),
                                SizedBox(height: 7,),
                                Text("Price: "+ProductList[index]["UnitPrice"]+" BDT"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    OutlinedButton(onPressed:(){
                                      GoToUpdate(context,ProductList[index]);
                                    },
                                      child:Icon(CupertinoIcons.ellipsis_vertical_circle,size: 18,color: colorGreen,),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    OutlinedButton(onPressed:(){
                                      DeleteItem(ProductList[index]["_id"]);
                                    },
                                        child:Icon(CupertinoIcons.delete,size: 18,color: colorRed,)
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }
              ),
            )
         )
      ]
      ),
      floatingActionButton: FloatingActionButton(onPressed:(){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>Productcreatescreen())
        );
      },
      child: Icon(Icons.add),
      ),
    );
  }
}
