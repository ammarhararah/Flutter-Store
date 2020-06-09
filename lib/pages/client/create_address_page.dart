import 'package:ammar/widgets/button.dart';
import 'package:flutter/material.dart';

class CreateAddressPage extends StatefulWidget {
  @override
  _CreateAddressPageState createState() => _CreateAddressPageState();
}

class _CreateAddressPageState extends State<CreateAddressPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final FocusNode nameNode = FocusNode();
  final FocusNode addressNode = FocusNode();
  final FocusNode cityNode = FocusNode();
  final FocusNode postalCodeNode = FocusNode();
  final FocusNode phoneNumberNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 32),
                Text(
                  'Create Address',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 32),
                TextFormField(
                  controller: nameController,
                  focusNode: nameNode,
                  decoration: InputDecoration(labelText: 'Name'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    nameNode.unfocus();
                    addressNode.requestFocus();
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
                  controller: addressController,
                  focusNode: addressNode,
                  decoration: InputDecoration(labelText: 'Address Lane'),
                  onFieldSubmitted: (_) {
                    addressNode.unfocus();
                    cityNode.requestFocus();
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter a valid address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: cityController,
                  focusNode: cityNode,
                  decoration: InputDecoration(labelText: 'City'),
                  onFieldSubmitted: (_) {
                    cityNode.unfocus();
                    postalCodeNode.requestFocus();
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter a valid city';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: postalCodeController,
                  focusNode: postalCodeNode,
                  decoration: InputDecoration(labelText: 'Postal Code'),
                  onFieldSubmitted: (_) {
                    postalCodeNode.unfocus();
                    phoneNumberNode.requestFocus();
                  },
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter a valid Postal Code';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: phoneNumberController,
                  focusNode: phoneNumberNode,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  onFieldSubmitted: (_) {
                    phoneNumberNode.unfocus();
                    _formKey.currentState.validate();
                  },
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter a valid Phone Number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32),
                Button(
                  text: 'Add Address',
                  onTap: () {
                    _formKey.currentState.validate();
                  },
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
