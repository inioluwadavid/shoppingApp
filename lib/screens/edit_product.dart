import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products_provider.dart';

import '../providers/product.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);



  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionNode = FocusNode();
  final _imageControl = TextEditingController();
  final _imageUrlFocus = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    id: 'null',
    title: '',
    price: 0,
    description: '',
    imageUrl: ''
  );
  var _initValues = {
    'title': '',
    'description': '',
    'prie': '',
    'image' : '',
  };

  @override
  void initState() {
    // TODO: implement initState
    _imageUrlFocus.addListener(_updateImage);
    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _imageUrlFocus.removeListener(_updateImage);
    _priceFocusNode.dispose();
    _descriptionNode.dispose();
    _imageControl.dispose();
    _imageUrlFocus.dispose();
    super.dispose();
  }

  void _updateImage (){
    if(!_imageUrlFocus.hasFocus){
      setState(() {

      });
    }
  }

  void _save(){
    final isValid = _form.currentState!.validate();
    if(!isValid){
      return;
    }
    _form.currentState!.save();
    if(_editedProduct.id != 'null'){

    }else{
      Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    }

    Navigator.of(context).pop();
  }
  var _isInit = true;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(_isInit){
      final productId = ModalRoute.of(context)!.settings.arguments as String;
      //use to get aruguement passed with a push
      if(productId != null){
        final product= Provider.of<Products>(context, listen: false).findBy(productId);
        _editedProduct = product;
        _initValues ={
          'title': _editedProduct.title,
          'description': _editedProduct.description,
          'price': _editedProduct.price.toString(),
          // 'imageUrl': _editedProduct.imageUrl
          'imageUrl' : ''
        };
        _imageControl.text = _editedProduct.imageUrl;
      }

    }
    _isInit = false;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Product'),
        actions: [
          IconButton(onPressed: (){
            _save();
          },
              icon: Icon(Icons.save))
        ],
      ),
      body: Padding(

        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _initValues['title'],

                decoration: InputDecoration(
                labelText: 'Title',
              ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_){
                FocusScope.of(context).requestFocus(_priceFocusNode);

                },
                validator: (value){
                if(value!.isEmpty){
                  return 'Please provide value';
                }
                return null;
                },
                onSaved: (value){
                _editedProduct = Product(id: '', title: value!, description:_editedProduct.description, imageUrl: _editedProduct.imageUrl, price: _editedProduct.price);
                },
              ),
              TextFormField(
                initialValue: _initValues['price'],
                decoration: InputDecoration(
                labelText: 'Price',
              ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_){
                FocusScope.of(context).requestFocus(_descriptionNode);
                },
                validator: (value){
                if(value!.isEmpty){
                  return 'Please enter a price.';
                }
                if(double.tryParse(value) == null){
                  return 'Please enter a valid number';
                }
                if(double.parse(value) <=0){
                  return 'Please enter a number greater than zero';
                }
                return null;
                },
                onSaved: (value){
                  _editedProduct = Product( title: _editedProduct.title,
                      description:_editedProduct.description,
                      imageUrl: _editedProduct.imageUrl,
                      price: double.parse(value!),
                      id: _editedProduct.id,
                      isFavorite: _editedProduct.isFavorite,
                  );
                },
              ),
              TextFormField(
                initialValue:_initValues['description'],
                decoration: InputDecoration(
                labelText: 'Description',
              ),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionNode,
                onSaved: (value){
                  _editedProduct = Product( id: _editedProduct.id,
                      isFavorite: _editedProduct.isFavorite, title: _editedProduct.title, description: value!, imageUrl: _editedProduct.imageUrl, price: _editedProduct.price);
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                        
                      )
                    ),
                    child: _imageControl.text.isEmpty ? Text('Enter a Url') : FittedBox(child: Image.network(_imageControl.text),),
                  ),
                  Expanded(
                    child: TextFormField(

                      decoration: InputDecoration(
                        labelText: 'Image Url',
                      ),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageControl,
                      focusNode: _imageUrlFocus,
                      onFieldSubmitted: (_){
                        _save();
                      },
                      onSaved: (value){
                        _editedProduct = Product( id: _editedProduct.id,
                            isFavorite: _editedProduct.isFavorite, title: _editedProduct.title, description:_editedProduct.description, imageUrl: value!, price: _editedProduct.price);
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
