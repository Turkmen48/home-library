import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kitapkayit/Controllers/database_service.dart';
import 'package:kitapkayit/Models/book.dart';

import '../consts.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  bool _isLoading = false;
  DatabaseService _databaseService = DatabaseService();
  final _key = GlobalKey<ExpandableFabState>();
  List<SelectedListItem> categories = Consts().categories;
  String? selectedCategory = '';
  String _imageUrl = '';
 late File _image;
 final _picker = ImagePicker();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _authorController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _publisherController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();


  void _close (){
  final state = _key.currentState;
  if (state != null) {
    debugPrint('isOpen:${state.isOpen}');
    state.toggle();
  }
}
Future<File> GetImage(ImageSource source) async {
  final pickedFile = await _picker.pickImage(source: source);
  if (pickedFile != null) {
    _image = File(pickedFile.path);
    setState(() {
      _imageUrl = pickedFile.path;
    });
  }
  return _image;
}
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.bottomSlide,
          title: 'Uyarı',
          desc: 'Kitap ekleme işlemini iptal etmek istediğinize emin misiniz?',
          btnCancelText: 'İptal',
          btnOkText: 'Evet',
          btnCancelOnPress: () {},
          btnOkOnPress: () {
            Navigator.of(context).pop();
          },
        )..show();
        return true;
      },
      child: Scaffold(
          floatingActionButtonLocation: ExpandableFab.location,
          appBar: AppBar(
            title: const Text('Kitap Ekle'),
          ),
          body: Stack(
            children: [Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: _imageUrl==""?Icon(Icons.camera_alt):Image.file(_image),
                  )
                ]),
                Expanded(
                    child: ListView(
                  children: [
                    buildPadding(
                        controller: _nameController, labelText: 'Kitap Adı'),
                    buildPadding(
                        controller: _authorController, labelText: 'Yazar'),
                    buildPadding(
                        controller: _publisherController, labelText: 'Yayıncı'),
                    buildPadding(
                        controller: _descriptionController,
                        labelText: 'Açıklama'),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: TextField(
                        controller: _categoryController,
                        onTap: () {
                          DropDownState(
                            DropDown(
                              data: categories,
                              bottomSheetTitle: Text('Kategori Seçiniz'),
                              enableMultipleSelection: false,
                              selectedItems: (List<dynamic> selectedList) {

                                for (var item in selectedList) {
                                  if (item is SelectedListItem) {
                                    setState(() {
                                      _categoryController.text =
                                          item.value as String;
                                    });
                                  }
                                }
                              },
                            ),
                          ).showModal(context);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelText: "Kategori",
                        ),
                      ),
                    ),
                    ElevatedButton(

                        onPressed: () async {

                          setState(() {
                            _isLoading = true;
                          });

                            await _databaseService.addBookImage(_image).then((value) => _imageUrl=value);
                              print("indirmelinki: $_imageUrl");
                              Book book = Book(
                                  Name: _nameController.text,
                                  Author: _authorController.text,
                                  Publisher: _publisherController.text,
                                  Category: _categoryController.text,
                                  Description: _descriptionController.text,
                                  ImageUrl: _imageUrl);
                              await _databaseService.addBook(book);

                              setState(() {
                                _isLoading = false;
                              });
                              Navigator.pop(context);




                        },

                        child: Text('Ekle')),
                  ],
                )),
              ],
            ),
              if (_isLoading) Center(child: CircularProgressIndicator())
            ],

          ),

          floatingActionButton: ExpandableFab(
            key: _key,
            distance: 75.0,
            children: [
              FloatingActionButton.small(
                heroTag: 'camera',
                  onPressed: () async {
                   _close();
                   _image= await GetImage(ImageSource.camera);




                  },
                  child: const Icon(Icons.camera_alt)),
              FloatingActionButton.small(
                heroTag: 'gallery',
                  onPressed: () async {
                  _close();
                  _image= await GetImage(ImageSource.gallery);
                  }, child: const Icon(Icons.photo)),
            ],
          )),
    );
  }

  Padding buildPadding(
      {required TextEditingController controller, required String labelText}) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}
