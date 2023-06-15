import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../Models/book.dart';

class DatabaseService {

  Stream<List<Book>> getBooksStreamFromFirestore() {
    return FirebaseFirestore.instance
        .collection('Books')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
      final data = doc.data();
      return Book(
        Id: doc.id,
        Name: data['Name'] as String,
        Author: data['Author'] as String,
        Publisher: data['Publisher'] as String,
        Category: data['Category'] as String,
        Description: data['Description'] as String,
        ImageUrl: data['ImageUrl'] as String,
      );
    }).toList());
  }

  Future<void> addBook(Book book) {
    return FirebaseFirestore.instance.collection('Books').add({
      'Name': book.Name,
      'Author': book.Author,
      'Publisher': book.Publisher,
      'Category': book.Category,
      'Description': book.Description,
      'ImageUrl': book.ImageUrl,
    });
  }

  Future<String> addBookImage(File file) async{
    var ref= FirebaseStorage.instance.ref().child('photos').child('${DateTime.now().toString()}');
    await ref.putFile(file);
    return ref.getDownloadURL();
  }

  Future<void> deleteBook(Book book) async{
    await FirebaseFirestore.instance.collection('Books').doc(book.Id).delete();
    await FirebaseStorage.instance.refFromURL(book.ImageUrl).delete();
  }

}
