import 'package:flutter/material.dart';

class PackageDelivery extends StatefulWidget {
  const PackageDelivery({super.key});

  @override
  State<PackageDelivery> createState() => _PackageDeliveryState();
}

class _PackageDeliveryState extends State<PackageDelivery> {
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
            "PACKAGING & DELIVERY",
            style: Theme.of(context).textTheme.titleMedium
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
        
            children: [
        
              const Text("Delivery Time: "),
        
              const SizedBox(height: 10,),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 160,
                    child: TextField(
                      textAlign: TextAlign.center,
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Enter Value",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black
                          )
                        ),
                      ),
                    ),
                  ),
        
                  SizedBox(
                    width: 160,
                    child: TextField(
                      textAlign: TextAlign.center,
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Minutes",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black
                          )
                        ),
                      ),
                    ),
                  )
                ],
              ),
        
              const SizedBox(height: 15,),
        
              const Text("Delivery Radius: "),
        
              const SizedBox(height: 10,),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 160,
                    child: TextField(
                      textAlign: TextAlign.center,
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Enter Value",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black
                          )
                        ),
                      ),
                    ),
                  ),
        
                  SizedBox(
                    width: 160,
                    child: TextField(
                      textAlign: TextAlign.center,
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(10),
                        hintText: "KM",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black
                          )
                        ),
                      ),
                    ),
                  )
                ],
              ),
        
              const SizedBox(height: 15,),
        
              const Text("Free Delivery Radius: "),
        
              const SizedBox(height: 10,),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 160,
                    child: TextField(
                      textAlign: TextAlign.center,
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Enter Value",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black
                          )
                        ),
                      ),
                    ),
                  ),
        
                  SizedBox(
                    width: 160,
                    child: TextField(
                      textAlign: TextAlign.center,
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(10),
                        hintText: "KM",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black
                          )
                        ),
                      ),
                    ),
                  )
                ],
              ),
        
              const SizedBox(height: 20,),
        
              const Text("Packaging & Delivery Fees:"),
        
              const SizedBox(height: 10,),
        
              const Text("Order Value(OV) Wise: "),
        
              const SizedBox(height: 10,),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 160,
                    child: TextField(
                      textAlign: TextAlign.center,
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(10),
                        hintText: "OV >= Rs.500",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black
                          )
                        ),
                      ),
                    ),
                  ),
        
                  SizedBox(
                    width: 160,
                    child: TextField(
                      textAlign: TextAlign.center,
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(10),
                        hintText: "0",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black
                          )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        
              const SizedBox(height: 10,),
        
              const Text("Order Value(OV) Wise: "),
        
              const SizedBox(height: 10,),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 160,
                    child: TextField(
                      textAlign: TextAlign.center,
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(10),
                        hintText: "OV >= Rs.500",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black
                          )
                        ),
                      ),
                    ),
                  ),
        
                  SizedBox(
                    width: 160,
                    child: TextField(
                      textAlign: TextAlign.center,
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Enter Price in Rs.",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black
                          )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        
              const SizedBox(height: 30,),
        
              const Text("Note: "),
        
              const SizedBox(height: 30,),
        
              const Text("1. Minimum Value Allowed: Rs.0"),
              const Text("2. Maximum Value Allowed: Rs.100"),
        
              const SizedBox(height: 60,),
        
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Save",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  )
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}