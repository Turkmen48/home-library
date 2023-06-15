import 'package:freezed_annotation/freezed_annotation.dart';
part 'book.freezed.dart';

@freezed
class Book with _$Book{
  const factory Book({
     String? Id,
    required String Name,
    required String Author,
    required String Publisher,
    required String Category,
    required String Description,
    required String ImageUrl,
}) = _Book;
}

