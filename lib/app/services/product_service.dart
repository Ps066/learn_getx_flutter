import 'dart:convert';

import 'package:learn_getx/app/modules/products/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final String apiUrl = 'https://fakestoreapi.com/products'; // api we are going to use

  Future<List<ProductModel>> fetchProducts() async{
    final response = await http.get(Uri.parse(apiUrl));

    if(response.statusCode == 200){
      List data = json.decode(response.body);    // stored the response into the data list
      return data.map((productJson)=> ProductModel.fromJson(productJson)).toList();
    }
    else{
      throw Exception('Failed to load Proucts');
    }
  }
}