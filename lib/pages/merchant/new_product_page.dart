import 'package:ammar/widgets/button.dart';
import 'package:flutter/material.dart';

enum ProductCategory {
  Men,
  Women,
  Kids,
}

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
  ProductCategory productCategory;

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
                      value: ProductCategory.Men,
                    ),
                    DropdownMenuItem(
                      child: Text('Women'),
                      value: ProductCategory.Women,
                    ),
                    DropdownMenuItem(
                      child: Text('Kids'),
                      value: ProductCategory.Kids,
                    ),
                  ],
                  isExpanded: true,
                ),
                SizedBox(height: 32),
                Button(
                  text: 'Pick Image',
                  onTap: () {},
                ),
                SizedBox(height: 32),
                Button(
                  text: 'Add Product',
                  onTap: () {
                    _formKey.currentState.validate();
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
