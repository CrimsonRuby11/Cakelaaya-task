import 'dart:convert';
import 'dart:typed_data';

import 'package:cakelaaya_task/config.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;


class Promotions extends StatefulWidget {
  const Promotions({super.key});

  @override
  State<Promotions> createState() => _PromotionsState();
}

class _PromotionsState extends State<Promotions> {

  ImagePicker picker = ImagePicker();
  // ignore: prefer_typing_uninitialized_variables
  var file;
  var imgname = "NewImage.png";
  var imageurl = "";

  void pickImage() async {
    file = await picker.pickImage(source: ImageSource.gallery);

    if(file == null) return;
    uploadFile();
  }

  void uploadFile() async {

    Uint8List bytesList = await file.readAsBytes();
    String base64image = base64.encode(bytesList);

    var reqBody = {
      "imagestring": base64image,
      "imagename": imgname,
    };

    var response = await http.post(
      Uri.parse("$SERVERHOST/uploadImage"),
      headers: {
        "Content-type": "application/json",
      },
      body: jsonEncode(reqBody),
    );

    var responseBody = jsonDecode(response.body);

    if(responseBody['ok']) {

      getImgUrl();
      
    } else {
      debugPrint("Error uploading file");
    }

  }

  @override
  void initState() {
    super.initState();

    getImgUrl();
  }

  void getImgUrl() async {

    var response = await http.get(
      Uri.parse("$SERVERHOST/getPromImg"),
      headers: {
        "Content-type": "application/json",
      },
    );

    var responseBody = jsonDecode(response.body);

    if(responseBody['ok']) {
      setState(() {
        debugPrint(responseBody['url']);
        imageurl = responseBody['url'];
        imageurl = "$imageurl?t=${DateTime.now().millisecond}";
      });
    } else {
      debugPrint("ERROR in fetching image url");
    }

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
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black,),
        ),

        title: Container(
          margin: const EdgeInsets.only(top: 8), 
          child: Text(
            "PROMOTIONS",
            style: Theme.of(context).textTheme.titleMedium
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text("Add Promotional Banners (Max 4): "),

              const SizedBox(height: 10,),

              GestureDetector(
                onTap: pickImage,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(
                    "Add Image",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary
                    ),
                  )
                ),
              ),

              const SizedBox(height: 10,),

              imageurl == "" ? const Text("NO IMAGE", textAlign: TextAlign.center,) :  Image.network(
                imageurl,
                key: ValueKey(imageurl)
              )

            ],
          ),
        )
      ),
    );
  }
}