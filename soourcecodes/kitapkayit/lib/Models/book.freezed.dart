// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Book {
  String? get Id => throw _privateConstructorUsedError;
  String get Name => throw _privateConstructorUsedError;
  String get Author => throw _privateConstructorUsedError;
  String get Publisher => throw _privateConstructorUsedError;
  String get Category => throw _privateConstructorUsedError;
  String get Description => throw _privateConstructorUsedError;
  String get ImageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call(
      {String? Id,
      String Name,
      String Author,
      String Publisher,
      String Category,
      String Description,
      String ImageUrl});
}

/// @nodoc
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Id = freezed,
    Object? Name = null,
    Object? Author = null,
    Object? Publisher = null,
    Object? Category = null,
    Object? Description = null,
    Object? ImageUrl = null,
  }) {
    return _then(_value.copyWith(
      Id: freezed == Id
          ? _value.Id
          : Id // ignore: cast_nullable_to_non_nullable
              as String?,
      Name: null == Name
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String,
      Author: null == Author
          ? _value.Author
          : Author // ignore: cast_nullable_to_non_nullable
              as String,
      Publisher: null == Publisher
          ? _value.Publisher
          : Publisher // ignore: cast_nullable_to_non_nullable
              as String,
      Category: null == Category
          ? _value.Category
          : Category // ignore: cast_nullable_to_non_nullable
              as String,
      Description: null == Description
          ? _value.Description
          : Description // ignore: cast_nullable_to_non_nullable
              as String,
      ImageUrl: null == ImageUrl
          ? _value.ImageUrl
          : ImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$_BookCopyWith(_$_Book value, $Res Function(_$_Book) then) =
      __$$_BookCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? Id,
      String Name,
      String Author,
      String Publisher,
      String Category,
      String Description,
      String ImageUrl});
}

/// @nodoc
class __$$_BookCopyWithImpl<$Res> extends _$BookCopyWithImpl<$Res, _$_Book>
    implements _$$_BookCopyWith<$Res> {
  __$$_BookCopyWithImpl(_$_Book _value, $Res Function(_$_Book) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Id = freezed,
    Object? Name = null,
    Object? Author = null,
    Object? Publisher = null,
    Object? Category = null,
    Object? Description = null,
    Object? ImageUrl = null,
  }) {
    return _then(_$_Book(
      Id: freezed == Id
          ? _value.Id
          : Id // ignore: cast_nullable_to_non_nullable
              as String?,
      Name: null == Name
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String,
      Author: null == Author
          ? _value.Author
          : Author // ignore: cast_nullable_to_non_nullable
              as String,
      Publisher: null == Publisher
          ? _value.Publisher
          : Publisher // ignore: cast_nullable_to_non_nullable
              as String,
      Category: null == Category
          ? _value.Category
          : Category // ignore: cast_nullable_to_non_nullable
              as String,
      Description: null == Description
          ? _value.Description
          : Description // ignore: cast_nullable_to_non_nullable
              as String,
      ImageUrl: null == ImageUrl
          ? _value.ImageUrl
          : ImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Book implements _Book {
  const _$_Book(
      {this.Id,
      required this.Name,
      required this.Author,
      required this.Publisher,
      required this.Category,
      required this.Description,
      required this.ImageUrl});

  @override
  final String? Id;
  @override
  final String Name;
  @override
  final String Author;
  @override
  final String Publisher;
  @override
  final String Category;
  @override
  final String Description;
  @override
  final String ImageUrl;

  @override
  String toString() {
    return 'Book(Id: $Id, Name: $Name, Author: $Author, Publisher: $Publisher, Category: $Category, Description: $Description, ImageUrl: $ImageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Book &&
            (identical(other.Id, Id) || other.Id == Id) &&
            (identical(other.Name, Name) || other.Name == Name) &&
            (identical(other.Author, Author) || other.Author == Author) &&
            (identical(other.Publisher, Publisher) ||
                other.Publisher == Publisher) &&
            (identical(other.Category, Category) ||
                other.Category == Category) &&
            (identical(other.Description, Description) ||
                other.Description == Description) &&
            (identical(other.ImageUrl, ImageUrl) ||
                other.ImageUrl == ImageUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, Id, Name, Author, Publisher,
      Category, Description, ImageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookCopyWith<_$_Book> get copyWith =>
      __$$_BookCopyWithImpl<_$_Book>(this, _$identity);
}

abstract class _Book implements Book {
  const factory _Book(
      {final String? Id,
      required final String Name,
      required final String Author,
      required final String Publisher,
      required final String Category,
      required final String Description,
      required final String ImageUrl}) = _$_Book;

  @override
  String? get Id;
  @override
  String get Name;
  @override
  String get Author;
  @override
  String get Publisher;
  @override
  String get Category;
  @override
  String get Description;
  @override
  String get ImageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_BookCopyWith<_$_Book> get copyWith => throw _privateConstructorUsedError;
}
