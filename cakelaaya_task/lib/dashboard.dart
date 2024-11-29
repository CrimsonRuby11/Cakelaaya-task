
import 'dart:convert';

import 'package:cakelaaya_task/config.dart';
import 'package:cakelaaya_task/packagedelivery.dart';
import 'package:cakelaaya_task/promotions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  Map<String, dynamic> shopObj = {};

  ImagePicker picker = ImagePicker();
  // ignore: prefer_typing_uninitialized_variables
  var file;

  void openImagePicker() async {
    await picker.pickImage(source: ImageSource.gallery);
  }
    
  void initFields() async {

    var response = await http.get(
      Uri.parse("$SERVERHOST/getShop"),
      headers: {
        "Content-type": "application/json"
      },
    );

    var responseBody = jsonDecode(response.body);

    if(responseBody['ok']) {
      // SUCCESS
      setState(() {
        shopObj = responseBody['obj'];
      });
    } else {
      debugPrint("ERROR");
    }

  }

  @override
  void initState() {
    super.initState();
    initFields();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      appBar: AppBar(
        toolbarHeight: 50,
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            // Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black,),
        ),

        title: Container(
          margin: const EdgeInsets.only(top: 8), 
          child: Text("MANAGE SHOP", style: Theme.of(context).textTheme.titleMedium)
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
        
              // SHOP NAME
              const Text(
                "Shop Name: ",
              ),
        
              const SizedBox(height: 5,),
        
              Text(
                "${shopObj['shopname']}",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey
                ),
              ),
        
              const SizedBox(height: 8,),
        
              const Text(
                "FSSAI License Number: ",
              ),
              
              const SizedBox(height: 8,),
        
              Text(
                "${shopObj["license"]}",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
              ),
        
              const SizedBox(height: 10,),
        
              const Text(
                "Commission %",
              ),
        
              const SizedBox(height: 10,),
        
              Text(
                "${shopObj["commission"]}",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey
                ),
              ),
        
              const SizedBox(height: 20,),
        
              // ADD SHOP PHOTO
              const Text(
                "Add Shop Display Photo (Max 1):"
              ),
        
              GestureDetector(
                onTap: openImagePicker,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 223, 223, 223),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(0, 3)
                      )
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Add Image",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary
                    ),
                  ),
                ),
              ),
        
              const SizedBox(height: 8,),
        
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PackageDelivery(),));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 223, 223, 223),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(0, 3)
                      )
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Packaging & Delivery",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary
                    ),
                  ),
                ),
              ),
        
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Promotions(),));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 223, 223, 223),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(0, 3)
                      )
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Promotions",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary
                    ),
                  ),
                ),
              ),
        
              const SizedBox(height: 40,),
        
              const Text(
                "Note: ",
              ),
        
              const SizedBox(height: 25,),
        
              const Text("1. Shop will not be visible to customers if you have no products added!"),
              const Text("2. We recommend adding products at menu price to avoid items being delisted in the future!"),
            ],
          ),
        ),
      ),

    );

  }
}