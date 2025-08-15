import'package:http/http.dart'as http;
import'dart:convert';

import '../Style/style.dart';


Future<List>ProductGreedViewListRequest()async{
  var url=Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');
  var PostHeader={"Content-Type":"application/json"};
  var response=await http.get(url,headers:PostHeader );
  var resultCode=response.statusCode;
  var resultBody = json.decode(response.body);
  if(resultCode==200 && resultBody["status"]== "success"){
    SuccessToast("Read Successfull");
    return resultBody["data"];
  }
  else
  {
    ErrorToast("Read fail");
    return [];
  }
}

Future<bool>ProductCreateRequest(FormValue)async{
  var url=Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var PostBody=json.encode(FormValue);
  var PostHeader={"Content-Type":"application/json"};
   var response=await http.post(url,headers:PostHeader,body:PostBody);
  var resultCode=response.statusCode;
  var resultBody = json.decode(response.body);
  if(resultCode==200 && resultBody["status"]== "success"){
    SuccessToast("Post Successfull");
    return true;
  }
  else
    {
        ErrorToast("Post fail");
        return false;
    }
}

Future<bool>ProductDeleteRequest(id)async{
var uri=Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/"+id);
var PostHeader={"Content-Type":"application/json"};
var response=await http.get(uri,headers: PostHeader);
var resultCode=response.statusCode;
var resultBody = json.decode(response.body);
if(resultCode==200 && resultBody["status"]== "success"){
  SuccessToast("Request Successfull");
  return true;
}
else
{
  ErrorToast("Request fail ! try again");
  return false;
}

}

Future<bool>ProductUpdateRequest(FormValue,id)async{
  var url=Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/"+id);
  var PostBody=json.encode(FormValue);
  var PostHeader={"Content-Type":"application/json"};
  var response=await http.post(url,headers:PostHeader,body:PostBody);
  var resultCode=response.statusCode;
  var resultBody = json.decode(response.body);
  if(resultCode==200 && resultBody["status"]== "success"){
    SuccessToast("Post Successfull");
    return true;
  }
  else
  {
    ErrorToast("Post fail");
    return false;
  }
}