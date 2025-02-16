class ProductModel {
  final String title;
  final double price;

  ProductModel({required this.title, required this.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        title: json['title'] as String,
        price: (json['price'] as num).toDouble()
      );
  }

  Map<String,dynamic> toJson(){
    return{
      'title':title,
      'price':price,
    };  
  }

}



//* Important

//? Map<> in dart
// In Dart, a Map is a collection of key-value pairs,
//similar to a dictionary in Python or an object in JavaScript. 
//It allows you to store data in an easily accessible format, 
//where each key is unique, and each key maps to a specific value.


//? Understanding the fromJson Factory Constructor
// The fromJson method is a factory constructor that allows you to create an instance of ProductModel from a Map<String, dynamic>.
// Why a factory constructor?
// A factory constructor doesn’t always create a new instance but can return an existing one or modify how instances are created.
// Breaking it down:
// The method takes a Map<String, dynamic> named json as input.
// It extracts values from the json map using keys like 'name' and 'price'.
// Since JSON values are often dynamic, explicit type casting is done:
// json['name'] as String: Ensures that the name is a string.
// json['price'] as num: Converts price to a num type (which includes both int and double).
// .toDouble(): Ensures that price is a double.


//? Understanding the toJson Method
// This method converts a ProductModel object back into a Map<String, dynamic>, making it suitable for JSON encoding.
// The returned map contains:
// 'name': The product’s name.
// 'price': The product’s price.