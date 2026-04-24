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
  @JsonKey(readValue: _readId)
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumb_url')
  String get thumbUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'origin_name')
  String? get originName => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(readValue: _readId)
  String? get views => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_chapters', readValue: _readId)
  String? get totalChapters => throw _privateConstructorUsedError;
  List<String> get author => throw _privateConstructorUsedError;
  List<DetailCategoryModel> get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'chaptersLatest')
  List<DetailChapterLatestModel> get chaptersLatest =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  String? get updatedAt =>
      throw _privateConstructorUsedError; // Non-API fields with defaults (user interaction state)
  bool get isFollowed => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  int get follows => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;

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
      {@JsonKey(readValue: _readId) String id,
      String name,
      String slug,
      @JsonKey(name: 'thumb_url') String thumbUrl,
      @JsonKey(name: 'origin_name') String? originName,
      String status,
      @JsonKey(readValue: _readId) String? views,
      String? description,
      @JsonKey(name: 'total_chapters', readValue: _readId)
      String? totalChapters,
      List<String> author,
      List<DetailCategoryModel> category,
      @JsonKey(name: 'chaptersLatest')
      List<DetailChapterLatestModel> chaptersLatest,
      @JsonKey(name: 'updatedAt') String? updatedAt,
      bool isFollowed,
      bool isLiked,
      int follows,
      int likes});
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
    Object? name = null,
    Object? slug = null,
    Object? thumbUrl = null,
    Object? originName = freezed,
    Object? status = null,
    Object? views = freezed,
    Object? description = freezed,
    Object? totalChapters = freezed,
    Object? author = null,
    Object? category = null,
    Object? chaptersLatest = null,
    Object? updatedAt = freezed,
    Object? isFollowed = null,
    Object? isLiked = null,
    Object? follows = null,
    Object? likes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      thumbUrl: null == thumbUrl
          ? _value.thumbUrl
          : thumbUrl // ignore: cast_nullable_to_non_nullable
              as String,
      originName: freezed == originName
          ? _value.originName
          : originName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      views: freezed == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      totalChapters: freezed == totalChapters
          ? _value.totalChapters
          : totalChapters // ignore: cast_nullable_to_non_nullable
              as String?,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<DetailCategoryModel>,
      chaptersLatest: null == chaptersLatest
          ? _value.chaptersLatest
          : chaptersLatest // ignore: cast_nullable_to_non_nullable
              as List<DetailChapterLatestModel>,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowed: null == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      follows: null == follows
          ? _value.follows
          : follows // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
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
      {@JsonKey(readValue: _readId) String id,
      String name,
      String slug,
      @JsonKey(name: 'thumb_url') String thumbUrl,
      @JsonKey(name: 'origin_name') String? originName,
      String status,
      @JsonKey(readValue: _readId) String? views,
      String? description,
      @JsonKey(name: 'total_chapters', readValue: _readId)
      String? totalChapters,
      List<String> author,
      List<DetailCategoryModel> category,
      @JsonKey(name: 'chaptersLatest')
      List<DetailChapterLatestModel> chaptersLatest,
      @JsonKey(name: 'updatedAt') String? updatedAt,
      bool isFollowed,
      bool isLiked,
      int follows,
      int likes});
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
    Object? name = null,
    Object? slug = null,
    Object? thumbUrl = null,
    Object? originName = freezed,
    Object? status = null,
    Object? views = freezed,
    Object? description = freezed,
    Object? totalChapters = freezed,
    Object? author = null,
    Object? category = null,
    Object? chaptersLatest = null,
    Object? updatedAt = freezed,
    Object? isFollowed = null,
    Object? isLiked = null,
    Object? follows = null,
    Object? likes = null,
  }) {
    return _then(_$MangaDetailModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      thumbUrl: null == thumbUrl
          ? _value.thumbUrl
          : thumbUrl // ignore: cast_nullable_to_non_nullable
              as String,
      originName: freezed == originName
          ? _value.originName
          : originName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      views: freezed == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      totalChapters: freezed == totalChapters
          ? _value.totalChapters
          : totalChapters // ignore: cast_nullable_to_non_nullable
              as String?,
      author: null == author
          ? _value._author
          : author // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: null == category
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<DetailCategoryModel>,
      chaptersLatest: null == chaptersLatest
          ? _value._chaptersLatest
          : chaptersLatest // ignore: cast_nullable_to_non_nullable
              as List<DetailChapterLatestModel>,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowed: null == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      follows: null == follows
          ? _value.follows
          : follows // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MangaDetailModelImpl implements _MangaDetailModel {
  const _$MangaDetailModelImpl(
      {@JsonKey(readValue: _readId) required this.id,
      required this.name,
      required this.slug,
      @JsonKey(name: 'thumb_url') required this.thumbUrl,
      @JsonKey(name: 'origin_name') this.originName,
      required this.status,
      @JsonKey(readValue: _readId) this.views,
      this.description,
      @JsonKey(name: 'total_chapters', readValue: _readId) this.totalChapters,
      final List<String> author = const [],
      final List<DetailCategoryModel> category = const [],
      @JsonKey(name: 'chaptersLatest')
      final List<DetailChapterLatestModel> chaptersLatest = const [],
      @JsonKey(name: 'updatedAt') this.updatedAt,
      this.isFollowed = false,
      this.isLiked = false,
      this.follows = 0,
      this.likes = 0})
      : _author = author,
        _category = category,
        _chaptersLatest = chaptersLatest;

  factory _$MangaDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MangaDetailModelImplFromJson(json);

  @override
  @JsonKey(readValue: _readId)
  final String id;
  @override
  final String name;
  @override
  final String slug;
  @override
  @JsonKey(name: 'thumb_url')
  final String thumbUrl;
  @override
  @JsonKey(name: 'origin_name')
  final String? originName;
  @override
  final String status;
  @override
  @JsonKey(readValue: _readId)
  final String? views;
  @override
  final String? description;
  @override
  @JsonKey(name: 'total_chapters', readValue: _readId)
  final String? totalChapters;
  final List<String> _author;
  @override
  @JsonKey()
  List<String> get author {
    if (_author is EqualUnmodifiableListView) return _author;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_author);
  }

  final List<DetailCategoryModel> _category;
  @override
  @JsonKey()
  List<DetailCategoryModel> get category {
    if (_category is EqualUnmodifiableListView) return _category;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_category);
  }

  final List<DetailChapterLatestModel> _chaptersLatest;
  @override
  @JsonKey(name: 'chaptersLatest')
  List<DetailChapterLatestModel> get chaptersLatest {
    if (_chaptersLatest is EqualUnmodifiableListView) return _chaptersLatest;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chaptersLatest);
  }

  @override
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;
// Non-API fields with defaults (user interaction state)
  @override
  @JsonKey()
  final bool isFollowed;
  @override
  @JsonKey()
  final bool isLiked;
  @override
  @JsonKey()
  final int follows;
  @override
  @JsonKey()
  final int likes;

  @override
  String toString() {
    return 'MangaDetailModel(id: $id, name: $name, slug: $slug, thumbUrl: $thumbUrl, originName: $originName, status: $status, views: $views, description: $description, totalChapters: $totalChapters, author: $author, category: $category, chaptersLatest: $chaptersLatest, updatedAt: $updatedAt, isFollowed: $isFollowed, isLiked: $isLiked, follows: $follows, likes: $likes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MangaDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.thumbUrl, thumbUrl) ||
                other.thumbUrl == thumbUrl) &&
            (identical(other.originName, originName) ||
                other.originName == originName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.totalChapters, totalChapters) ||
                other.totalChapters == totalChapters) &&
            const DeepCollectionEquality().equals(other._author, _author) &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            const DeepCollectionEquality()
                .equals(other._chaptersLatest, _chaptersLatest) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isFollowed, isFollowed) ||
                other.isFollowed == isFollowed) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.follows, follows) || other.follows == follows) &&
            (identical(other.likes, likes) || other.likes == likes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      slug,
      thumbUrl,
      originName,
      status,
      views,
      description,
      totalChapters,
      const DeepCollectionEquality().hash(_author),
      const DeepCollectionEquality().hash(_category),
      const DeepCollectionEquality().hash(_chaptersLatest),
      updatedAt,
      isFollowed,
      isLiked,
      follows,
      likes);

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
      {@JsonKey(readValue: _readId) required final String id,
      required final String name,
      required final String slug,
      @JsonKey(name: 'thumb_url') required final String thumbUrl,
      @JsonKey(name: 'origin_name') final String? originName,
      required final String status,
      @JsonKey(readValue: _readId) final String? views,
      final String? description,
      @JsonKey(name: 'total_chapters', readValue: _readId)
      final String? totalChapters,
      final List<String> author,
      final List<DetailCategoryModel> category,
      @JsonKey(name: 'chaptersLatest')
      final List<DetailChapterLatestModel> chaptersLatest,
      @JsonKey(name: 'updatedAt') final String? updatedAt,
      final bool isFollowed,
      final bool isLiked,
      final int follows,
      final int likes}) = _$MangaDetailModelImpl;

  factory _MangaDetailModel.fromJson(Map<String, dynamic> json) =
      _$MangaDetailModelImpl.fromJson;

  @override
  @JsonKey(readValue: _readId)
  String get id;
  @override
  String get name;
  @override
  String get slug;
  @override
  @JsonKey(name: 'thumb_url')
  String get thumbUrl;
  @override
  @JsonKey(name: 'origin_name')
  String? get originName;
  @override
  String get status;
  @override
  @JsonKey(readValue: _readId)
  String? get views;
  @override
  String? get description;
  @override
  @JsonKey(name: 'total_chapters', readValue: _readId)
  String? get totalChapters;
  @override
  List<String> get author;
  @override
  List<DetailCategoryModel> get category;
  @override
  @JsonKey(name: 'chaptersLatest')
  List<DetailChapterLatestModel> get chaptersLatest;
  @override
  @JsonKey(name: 'updatedAt')
  String?
      get updatedAt; // Non-API fields with defaults (user interaction state)
  @override
  bool get isFollowed;
  @override
  bool get isLiked;
  @override
  int get follows;
  @override
  int get likes;

  /// Create a copy of MangaDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MangaDetailModelImplCopyWith<_$MangaDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailCategoryModel _$DetailCategoryModelFromJson(Map<String, dynamic> json) {
  return _DetailCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$DetailCategoryModel {
  @JsonKey(readValue: _readId)
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;

  /// Serializes this DetailCategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailCategoryModelCopyWith<DetailCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCategoryModelCopyWith<$Res> {
  factory $DetailCategoryModelCopyWith(
          DetailCategoryModel value, $Res Function(DetailCategoryModel) then) =
      _$DetailCategoryModelCopyWithImpl<$Res, DetailCategoryModel>;
  @useResult
  $Res call({@JsonKey(readValue: _readId) String id, String name, String slug});
}

/// @nodoc
class _$DetailCategoryModelCopyWithImpl<$Res, $Val extends DetailCategoryModel>
    implements $DetailCategoryModelCopyWith<$Res> {
  _$DetailCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailCategoryModelImplCopyWith<$Res>
    implements $DetailCategoryModelCopyWith<$Res> {
  factory _$$DetailCategoryModelImplCopyWith(_$DetailCategoryModelImpl value,
          $Res Function(_$DetailCategoryModelImpl) then) =
      __$$DetailCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(readValue: _readId) String id, String name, String slug});
}

/// @nodoc
class __$$DetailCategoryModelImplCopyWithImpl<$Res>
    extends _$DetailCategoryModelCopyWithImpl<$Res, _$DetailCategoryModelImpl>
    implements _$$DetailCategoryModelImplCopyWith<$Res> {
  __$$DetailCategoryModelImplCopyWithImpl(_$DetailCategoryModelImpl _value,
      $Res Function(_$DetailCategoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
  }) {
    return _then(_$DetailCategoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailCategoryModelImpl implements _DetailCategoryModel {
  const _$DetailCategoryModelImpl(
      {@JsonKey(readValue: _readId) required this.id,
      required this.name,
      required this.slug});

  factory _$DetailCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailCategoryModelImplFromJson(json);

  @override
  @JsonKey(readValue: _readId)
  final String id;
  @override
  final String name;
  @override
  final String slug;

  @override
  String toString() {
    return 'DetailCategoryModel(id: $id, name: $name, slug: $slug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailCategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug);

  /// Create a copy of DetailCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailCategoryModelImplCopyWith<_$DetailCategoryModelImpl> get copyWith =>
      __$$DetailCategoryModelImplCopyWithImpl<_$DetailCategoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _DetailCategoryModel implements DetailCategoryModel {
  const factory _DetailCategoryModel(
      {@JsonKey(readValue: _readId) required final String id,
      required final String name,
      required final String slug}) = _$DetailCategoryModelImpl;

  factory _DetailCategoryModel.fromJson(Map<String, dynamic> json) =
      _$DetailCategoryModelImpl.fromJson;

  @override
  @JsonKey(readValue: _readId)
  String get id;
  @override
  String get name;
  @override
  String get slug;

  /// Create a copy of DetailCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailCategoryModelImplCopyWith<_$DetailCategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailChapterLatestModel _$DetailChapterLatestModelFromJson(
    Map<String, dynamic> json) {
  return _DetailChapterLatestModel.fromJson(json);
}

/// @nodoc
mixin _$DetailChapterLatestModel {
  @JsonKey(name: 'chapter_name')
  String? get chapterName => throw _privateConstructorUsedError;
  @JsonKey(name: 'chapter_title')
  String? get chapterTitle => throw _privateConstructorUsedError;
  String? get filename => throw _privateConstructorUsedError;

  /// Serializes this DetailChapterLatestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailChapterLatestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailChapterLatestModelCopyWith<DetailChapterLatestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailChapterLatestModelCopyWith<$Res> {
  factory $DetailChapterLatestModelCopyWith(DetailChapterLatestModel value,
          $Res Function(DetailChapterLatestModel) then) =
      _$DetailChapterLatestModelCopyWithImpl<$Res, DetailChapterLatestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'chapter_name') String? chapterName,
      @JsonKey(name: 'chapter_title') String? chapterTitle,
      String? filename});
}

/// @nodoc
class _$DetailChapterLatestModelCopyWithImpl<$Res,
        $Val extends DetailChapterLatestModel>
    implements $DetailChapterLatestModelCopyWith<$Res> {
  _$DetailChapterLatestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailChapterLatestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chapterName = freezed,
    Object? chapterTitle = freezed,
    Object? filename = freezed,
  }) {
    return _then(_value.copyWith(
      chapterName: freezed == chapterName
          ? _value.chapterName
          : chapterName // ignore: cast_nullable_to_non_nullable
              as String?,
      chapterTitle: freezed == chapterTitle
          ? _value.chapterTitle
          : chapterTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailChapterLatestModelImplCopyWith<$Res>
    implements $DetailChapterLatestModelCopyWith<$Res> {
  factory _$$DetailChapterLatestModelImplCopyWith(
          _$DetailChapterLatestModelImpl value,
          $Res Function(_$DetailChapterLatestModelImpl) then) =
      __$$DetailChapterLatestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'chapter_name') String? chapterName,
      @JsonKey(name: 'chapter_title') String? chapterTitle,
      String? filename});
}

/// @nodoc
class __$$DetailChapterLatestModelImplCopyWithImpl<$Res>
    extends _$DetailChapterLatestModelCopyWithImpl<$Res,
        _$DetailChapterLatestModelImpl>
    implements _$$DetailChapterLatestModelImplCopyWith<$Res> {
  __$$DetailChapterLatestModelImplCopyWithImpl(
      _$DetailChapterLatestModelImpl _value,
      $Res Function(_$DetailChapterLatestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailChapterLatestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chapterName = freezed,
    Object? chapterTitle = freezed,
    Object? filename = freezed,
  }) {
    return _then(_$DetailChapterLatestModelImpl(
      chapterName: freezed == chapterName
          ? _value.chapterName
          : chapterName // ignore: cast_nullable_to_non_nullable
              as String?,
      chapterTitle: freezed == chapterTitle
          ? _value.chapterTitle
          : chapterTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailChapterLatestModelImpl implements _DetailChapterLatestModel {
  const _$DetailChapterLatestModelImpl(
      {@JsonKey(name: 'chapter_name') this.chapterName,
      @JsonKey(name: 'chapter_title') this.chapterTitle,
      this.filename});

  factory _$DetailChapterLatestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailChapterLatestModelImplFromJson(json);

  @override
  @JsonKey(name: 'chapter_name')
  final String? chapterName;
  @override
  @JsonKey(name: 'chapter_title')
  final String? chapterTitle;
  @override
  final String? filename;

  @override
  String toString() {
    return 'DetailChapterLatestModel(chapterName: $chapterName, chapterTitle: $chapterTitle, filename: $filename)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailChapterLatestModelImpl &&
            (identical(other.chapterName, chapterName) ||
                other.chapterName == chapterName) &&
            (identical(other.chapterTitle, chapterTitle) ||
                other.chapterTitle == chapterTitle) &&
            (identical(other.filename, filename) ||
                other.filename == filename));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, chapterName, chapterTitle, filename);

  /// Create a copy of DetailChapterLatestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailChapterLatestModelImplCopyWith<_$DetailChapterLatestModelImpl>
      get copyWith => __$$DetailChapterLatestModelImplCopyWithImpl<
          _$DetailChapterLatestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailChapterLatestModelImplToJson(
      this,
    );
  }
}

abstract class _DetailChapterLatestModel implements DetailChapterLatestModel {
  const factory _DetailChapterLatestModel(
      {@JsonKey(name: 'chapter_name') final String? chapterName,
      @JsonKey(name: 'chapter_title') final String? chapterTitle,
      final String? filename}) = _$DetailChapterLatestModelImpl;

  factory _DetailChapterLatestModel.fromJson(Map<String, dynamic> json) =
      _$DetailChapterLatestModelImpl.fromJson;

  @override
  @JsonKey(name: 'chapter_name')
  String? get chapterName;
  @override
  @JsonKey(name: 'chapter_title')
  String? get chapterTitle;
  @override
  String? get filename;

  /// Create a copy of DetailChapterLatestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailChapterLatestModelImplCopyWith<_$DetailChapterLatestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChapterModel _$ChapterModelFromJson(Map<String, dynamic> json) {
  return _ChapterModel.fromJson(json);
}

/// @nodoc
mixin _$ChapterModel {
  @JsonKey(readValue: _readId)
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

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
  $Res call({@JsonKey(readValue: _readId) String id, String name});
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
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({@JsonKey(readValue: _readId) String id, String name});
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
    Object? name = null,
  }) {
    return _then(_$ChapterModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChapterModelImpl implements _ChapterModel {
  const _$ChapterModelImpl(
      {@JsonKey(readValue: _readId) required this.id, required this.name});

  factory _$ChapterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChapterModelImplFromJson(json);

  @override
  @JsonKey(readValue: _readId)
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'ChapterModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

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
      {@JsonKey(readValue: _readId) required final String id,
      required final String name}) = _$ChapterModelImpl;

  factory _ChapterModel.fromJson(Map<String, dynamic> json) =
      _$ChapterModelImpl.fromJson;

  @override
  @JsonKey(readValue: _readId)
  String get id;
  @override
  String get name;

  /// Create a copy of ChapterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChapterModelImplCopyWith<_$ChapterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
