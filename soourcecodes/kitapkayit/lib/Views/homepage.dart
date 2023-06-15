import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kitapkayit/Controllers/database_service.dart';

import '../Models/book.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseService _databaseService = DatabaseService();
  TextEditingController _searchController = TextEditingController();
  FocusNode _searchFocusNode = FocusNode();
  List<Book> _books = [];
  List<Book> _filteredBooks = [];
  void _dissmissKeyboard() {
    _searchFocusNode.unfocus();
  }
  @override
  void initState() {
    super.initState();
    _subscribeToBooks();
  }
  void _subscribeToBooks() {
    _databaseService.getBooksStreamFromFirestore().listen((List<Book> books) {
      books.sort((a, b) => a.Name.compareTo(b.Name));
      setState(() {
        _books = books;
        _filteredBooks = books;
      });
    });
  }
  void _filterBooks(String query) {
    List<Book> filteredList = _books.where((book) {
      return book.Name.toLowerCase().contains(query.toLowerCase()) ||
          book.Author.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      _filteredBooks = filteredList;
    });
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Book>>(
      stream: _databaseService.getBooksStreamFromFirestore(),
      builder: (context,snapshot){
        if(snapshot.hasData)
          {

            return Scaffold(
              appBar: AppBar(
                title: const Text('Ev Kütüphanesi'),
              ),
              body: GestureDetector(
                onTap: () {
                  _dissmissKeyboard();
                },
                child: Column(

                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: TextField(
                        focusNode: _searchFocusNode,
                        controller: _searchController,
                        onTap: () {
                          _searchFocusNode.requestFocus();

                        },
                        onChanged: (value) {
                          _filterBooks(value);

                        },
                        decoration: InputDecoration(
                          labelText: 'İsme veya Yazara Göre Kitap Ara',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),

                    Scrollbar(
                      //TODO: Dissmissible widget kullanılacak

                      child: ListView.builder(itemCount: _filteredBooks.length,
                        shrinkWrap: true,

                        itemBuilder: (context,index)
                        {
                          final book = _filteredBooks[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/show-book',arguments: book);
                              print("${book.Id},tıklandı");
                            },
                            child: Card(
                              child: Slidable(
                                key: ValueKey(book.Id),
                                direction: Axis.horizontal,
                                startActionPane: ActionPane(

                                  motion:  const ScrollMotion(),
                                  children: [
                                    SlidableAction(onPressed: (value){
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.error,
                                        animType: AnimType.bottomSlide,
                                        title: 'Kitap Silinecek',
                                        desc: '${book.Name} adlı kitap silinsin mi?',
                                        btnOkOnPress: () async {
                                          try {
                                            await _databaseService.deleteBook(book);

                                          } catch (e) {
                                            AwesomeDialog(
                                              context: context,
                                              dialogType: DialogType.error,
                                              animType: AnimType.bottomSlide,
                                              title: 'Hata',
                                              desc: 'Bir hata oluştu, hata kodu: ${e.toString()}',
                                              btnOkOnPress: () {},
                                            ).show();
                                          }
                                        },
                                        btnCancelOnPress: () {},
                                        btnCancelText: 'İptal',
                                        btnOkText: 'Sil',
                                      ).show();
                                    },label: 'Sil', backgroundColor: Colors.red,icon: Icons.delete,borderRadius: BorderRadius.circular(10),autoClose: true,),
                                  ],
                                ),
                                // endActionPane:ActionPane(
                                //   motion:  const ScrollMotion(),
                                //   children: [
                                //     SlidableAction(onPressed: (value){},label: 'Düzenle', backgroundColor: Colors.orange,),
                                //   ],
                                // ) ,

                                child: ListTile(
                                  leading: Image.network(book.ImageUrl),
                                  title: Text(book.Name),
                                  subtitle: Text(book.Author),
                                ),
                              ),
                            ),
                          );
                        }
                    ),)
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){
                Navigator.pushNamed(context, '/add-book');
              },),
            );
          }
        else if (snapshot.hasError)
          {
            return Center(child: Text('Bir hata oluştu, hata kodu: ${snapshot.error.toString()} '),);
          }
        else{
          return const Center(child: CircularProgressIndicator(),);
        }
      }
    );
  }
}
