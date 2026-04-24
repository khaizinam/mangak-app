// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manga_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MangaDetailModel _$MangaDetailModelFromJson(Map<String, dynamic> json) {
  return _MangaDetailModel.fromJson(json);
}

/// @nodoc
mixin _$MangaDetailModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_url')
  String get coverUrl => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<String> get genres => throw _privateConstructorUsedError;
  int get views => throw _privateConstructorUsedError;
  int get follows => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'chapters')
  List<ChapterModel> get chapters => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_followed')
  bool get isFollowed => throw _privateConstructorUsedError;

  /// Serializes this MangaDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MangaDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MangaDetailModelCopyWith<MangaDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MangaDetailModelCopyWith<$Res> {
  factory $MangaDetailModelCopyWith(
          MangaDetailModel value, $Res Function(MangaDetailModel) then) =
      _$MangaDetailModelCopyWithImpl<$Res, MangaDetailModel>;
  @useResult
  $Res call(
      {int id,
      String title,
      String slug,
      @JsonKey(name: 'cover_url') String coverUrl,
      String description,
      String author,
      String status,
      List<String> genres,
      int views,
      int follows,
      double rating,
      @JsonKey(name: 'chapters') List<ChapterModel> chapters,
      @JsonKey(name: 'is_followed') bool isFollowed});
}

/// @nodoc
class _$MangaDetailModelCopyWithImpl<$Res, $Val extends MangaDetailModel>
    implements $MangaDetailModelCopyWith<$Res> {
  _$MangaDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MangaDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? slug = null,
    Object? coverUrl = null,
    Object? description = null,
    Object? author = null,
    Object? status = null,
    Object? genres = null,
    Object? views = null,
    Object? follows = null,
    Object? rating = null,
    Object? chapters = null,
    Object? isFollowed = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      coverUrl: null == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      follows: null == follows
          ? _value.follows
          : follows // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      chapters: null == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<ChapterModel>,
      isFollowed: null == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MangaDetailModelImplCopyWith<$Res>
    implements $MangaDetailModelCopyWith<$Res> {
  factory _$$MangaDetailModelImplCopyWith(_$MangaDetailModelImpl value,
          $Res Function(_$MangaDetailModelImpl) then) =
      __$$MangaDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String slug,
      @JsonKey(name: 'cover_url') String coverUrl,
      String description,
      String author,
      String status,
      List<String> genres,
      int views,
      int follows,
      double rating,
      @JsonKey(name: 'chapters') List<ChapterModel> chapters,
      @JsonKey(name: 'is_followed') bool isFollowed});
}

/// @nodoc
class __$$MangaDetailModelImplCopyWithImpl<$Res>
    extends _$MangaDetailModelCopyWithImpl<$Res, _$MangaDetailModelImpl>
    implements _$$MangaDetailModelImplCopyWith<$Res> {
  __$$MangaDetailModelImplCopyWithImpl(_$MangaDetailModelImpl _value,
      $Res Function(_$MangaDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MangaDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? slug = null,
    Object? coverUrl = null,
    Object? description = null,
    Object? author = null,
    Object? status = null,
    Object? genres = null,
    Object? views = null,
    Object? follows = null,
    Object? rating = null,
    Object? chapters = null,
    Object? isFollowed = null,
  }) {
    return _then(_$MangaDetailModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      coverUrl: null == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      follows: null == follows
          ? _value.follows
          : follows // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      chapters: null == chapters
          ? _value._chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<ChapterModel>,
      isFollowed: null == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MangaDetailModelImpl implements _MangaDetailModel {
  const _$MangaDetailModelImpl(
      {required this.id,
      required this.title,
      required this.slug,
      @JsonKey(name: 'cover_url') required this.coverUrl,
      required this.description,
      required this.author,
      required this.status,
      required final List<String> genres,
      required this.views,
      required this.follows,
      required this.rating,
      @JsonKey(name: 'chapters') required final List<ChapterModel> chapters,
      @JsonKey(name: 'is_followed') this.isFollowed = false})
      : _genres = genres,
        _chapters = chapters;

  factory _$MangaDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MangaDetailModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String slug;
  @override
  @JsonKey(name: 'cover_url')
  final String coverUrl;
  @override
  final String description;
  @override
  final String author;
  @override
  final String status;
  final List<String> _genres;
  @override
  List<String> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  final int views;
  @override
  final int follows;
  @override
  final double rating;
  final List<ChapterModel> _chapters;
  @override
  @JsonKey(name: 'chapters')
  List<ChapterModel> get chapters {
    if (_chapters is EqualUnmodifiableListView) return _chapters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chapters);
  }

  @override
  @JsonKey(name: 'is_followed')
  final bool isFollowed;

  @override
  String toString() {
    return 'MangaDetailModel(id: $id, title: $title, slug: $slug, coverUrl: $coverUrl, description: $description, author: $author, status: $status, genres: $genres, views: $views, follows: $follows, rating: $rating, chapters: $chapters, isFollowed: $isFollowed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MangaDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.coverUrl, coverUrl) ||
                other.coverUrl == coverUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.follows, follows) || other.follows == follows) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters) &&
            (identical(other.isFollowed, isFollowed) ||
                other.isFollowed == isFollowed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      slug,
      coverUrl,
      description,
      author,
      status,
      const DeepCollectionEquality().hash(_genres),
      views,
      follows,
      rating,
      const DeepCollectionEquality().hash(_chapters),
      isFollowed);

  /// Create a copy of MangaDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MangaDetailModelImplCopyWith<_$MangaDetailModelImpl> get copyWith =>
      __$$MangaDetailModelImplCopyWithImpl<_$MangaDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MangaDetailModelImplToJson(
      this,
    );
  }
}

abstract class _MangaDetailModel implements MangaDetailModel {
  const factory _MangaDetailModel(
          {required final int id,
          required final String title,
          required final String slug,
          @JsonKey(name: 'cover_url') required final String coverUrl,
          required final String description,
          required final String author,
          required final String status,
          required final List<String> genres,
          required final int views,
          required final int follows,
          required final double rating,
          @JsonKey(name: 'chapters') required final List<ChapterModel> chapters,
          @JsonKey(name: 'is_followed') final bool isFollowed}) =
      _$MangaDetailModelImpl;

  factory _MangaDetailModel.fromJson(Map<String, dynamic> json) =
      _$MangaDetailModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get slug;
  @override
  @JsonKey(name: 'cover_url')
  String get coverUrl;
  @override
  String get description;
  @override
  String get author;
  @override
  String get status;
  @override
  List<String> get genres;
  @override
  int get views;
  @override
  int get follows;
  @override
  double get rating;
  @override
  @JsonKey(name: 'chapters')
  List<ChapterModel> get chapters;
  @override
  @JsonKey(name: 'is_followed')
  bool get isFollowed;

  /// Create a copy of MangaDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MangaDetailModelImplCopyWith<_$MangaDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChapterModel _$ChapterModelFromJson(Map<String, dynamic> json) {
  return _ChapterModel.fromJson(json);
}

/// @nodoc
mixin _$ChapterModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'chapter_number')
  String get chapterNumber => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_read')
  bool get isRead => throw _privateConstructorUsedError;

  /// Serializes this ChapterModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChapterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChapterModelCopyWith<ChapterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterModelCopyWith<$Res> {
  factory $ChapterModelCopyWith(
          ChapterModel value, $Res Function(ChapterModel) then) =
      _$ChapterModelCopyWithImpl<$Res, ChapterModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'chapter_number') String chapterNumber,
      String title,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'is_read') bool isRead});
}

/// @nodoc
class _$ChapterModelCopyWithImpl<$Res, $Val extends ChapterModel>
    implements $ChapterModelCopyWith<$Res> {
  _$ChapterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChapterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chapterNumber = null,
    Object? title = null,
    Object? createdAt = null,
    Object? isRead = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      chapterNumber: null == chapterNumber
          ? _value.chapterNumber
          : chapterNumber // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChapterModelImplCopyWith<$Res>
    implements $ChapterModelCopyWith<$Res> {
  factory _$$ChapterModelImplCopyWith(
          _$ChapterModelImpl value, $Res Function(_$ChapterModelImpl) then) =
      __$$ChapterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'chapter_number') String chapterNumber,
      String title,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'is_read') bool isRead});
}

/// @nodoc
class __$$ChapterModelImplCopyWithImpl<$Res>
    extends _$ChapterModelCopyWithImpl<$Res, _$ChapterModelImpl>
    implements _$$ChapterModelImplCopyWith<$Res> {
  __$$ChapterModelImplCopyWithImpl(
      _$ChapterModelImpl _value, $Res Function(_$ChapterModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChapterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chapterNumber = null,
    Object? title = null,
    Object? createdAt = null,
    Object? isRead = null,
  }) {
    return _then(_$ChapterModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      chapterNumber: null == chapterNumber
          ? _value.chapterNumber
          : chapterNumber // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChapterModelImpl implements _ChapterModel {
  const _$ChapterModelImpl(
      {required this.id,
      @JsonKey(name: 'chapter_number') required this.chapterNumber,
      required this.title,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'is_read') this.isRead = false});

  factory _$ChapterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChapterModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'chapter_number')
  final String chapterNumber;
  @override
  final String title;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'is_read')
  final bool isRead;

  @override
  String toString() {
    return 'ChapterModel(id: $id, chapterNumber: $chapterNumber, title: $title, createdAt: $createdAt, isRead: $isRead)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chapterNumber, chapterNumber) ||
                other.chapterNumber == chapterNumber) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isRead, isRead) || other.isRead == isRead));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, chapterNumber, title, createdAt, isRead);

  /// Create a copy of ChapterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterModelImplCopyWith<_$ChapterModelImpl> get copyWith =>
      __$$ChapterModelImplCopyWithImpl<_$ChapterModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChapterModelImplToJson(
      this,
    );
  }
}

abstract class _ChapterModel implements ChapterModel {
  const factory _ChapterModel(
      {required final int id,
      @JsonKey(name: 'chapter_number') required final String chapterNumber,
      required final String title,
      @JsonKey(name: 'created_at') required final String createdAt,
      @JsonKey(name: 'is_read') final bool isRead}) = _$ChapterModelImpl;

  factory _ChapterModel.fromJson(Map<String, dynamic> json) =
      _$ChapterModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'chapter_number')
  String get chapterNumber;
  @override
  String get title;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'is_read')
  bool get isRead;

  /// Create a copy of ChapterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChapterModelImplCopyWith<_$ChapterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
