import 'dart:convert';
import 'dart:io';

import 'package:ammar/models/product.dart';
import 'package:ammar/state/auth_provider.dart';
import 'package:ammar/state/merchant_provider.dart';
import 'package:ammar/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class NewProductPage extends StatefulWidget {
  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final FocusNode nameNode = FocusNode();
  final FocusNode priceNode = FocusNode();
  final FocusNode descriptionNode = FocusNode();
  String productCategory;
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'New Product',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 32),
                TextFormField(
                  controller: nameController,
                  focusNode: nameNode,
                  decoration: InputDecoration(labelText: 'Product Name'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    nameNode.unfocus();
                    priceNode.requestFocus();
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter a valid name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: priceController,
                  focusNode: priceNode,
                  decoration: InputDecoration(labelText: 'Product Price'),
                  onFieldSubmitted: (_) {
                    priceNode.unfocus();
                    descriptionNode.requestFocus();
                  },
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter a valid price';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: descriptionController,
                  focusNode: descriptionNode,
                  decoration: InputDecoration(labelText: 'Description'),
                  onFieldSubmitted: (_) {
                    descriptionNode.unfocus();
                    _formKey.currentState.validate();
                  },
                ),
                SizedBox(height: 8),
                DropdownButton(
                  hint: Text('Product Category'),
                  icon: Icon(Icons.keyboard_arrow_down),
                  value: productCategory,
                  onChanged: (value) {
                    setState(() {
                      productCategory = value;
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      child: Text('Men'),
                      value: 'Men',
                    ),
                    DropdownMenuItem(
                      child: Text('Women'),
                      value: 'Women',
                    ),
                    DropdownMenuItem(
                      child: Text('Kids'),
                      value: 'Kids',
                    ),
                  ],
                  isExpanded: true,
                ),
                SizedBox(height: 16),
                if (_image != null)
                  Center(
                    child: Image.file(
                      _image,
                      width: 100,
                      height: 100,
                    ),
                  ),
                SizedBox(height: 8),
                Button(
                  text: 'Pick Image',
                  onTap: () async {
                    final pickedFile = await ImagePicker()
                        .getImage(source: ImageSource.gallery);
                    setState(() {
                      _image = File(pickedFile.path);
                    });
                  },
                ),
                SizedBox(height: 32),
                Button(
                  text: 'Add Product',
                  onTap: () async {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    await Provider.of<MerchantProvider>(context, listen: false)
                        .newProduct(Product(
                      name: nameController.text,
                      price: double.parse(priceController.text),
                      description: descriptionController.text,
                      category: productCategory,
                      userId: Provider.of<AuthProvider>(context, listen: false)
                          .user
                          .id,
                      image: base64Encode(_image.readAsBytesSync()),
                    ));
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
