// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manga_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MangaModel _$MangaModelFromJson(Map<String, dynamic> json) {
  return _MangaModel.fromJson(json);
}

/// @nodoc
mixin _$MangaModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_url')
  String get coverUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'chapter_count')
  int get chapterCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_update')
  String get lastUpdate => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  List<String>? get genres => throw _privateConstructorUsedError;

  /// Serializes this MangaModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MangaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MangaModelCopyWith<MangaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MangaModelCopyWith<$Res> {
  factory $MangaModelCopyWith(
          MangaModel value, $Res Function(MangaModel) then) =
      _$MangaModelCopyWithImpl<$Res, MangaModel>;
  @useResult
  $Res call(
      {int id,
      String title,
      String slug,
      @JsonKey(name: 'cover_url') String coverUrl,
      @JsonKey(name: 'chapter_count') int chapterCount,
      @JsonKey(name: 'last_update') String lastUpdate,
      String? author,
      String? status,
      List<String>? genres});
}

/// @nodoc
class _$MangaModelCopyWithImpl<$Res, $Val extends MangaModel>
    implements $MangaModelCopyWith<$Res> {
  _$MangaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MangaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? slug = null,
    Object? coverUrl = null,
    Object? chapterCount = null,
    Object? lastUpdate = null,
    Object? author = freezed,
    Object? status = freezed,
    Object? genres = freezed,
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
      chapterCount: null == chapterCount
          ? _value.chapterCount
          : chapterCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as String,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      genres: freezed == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MangaModelImplCopyWith<$Res>
    implements $MangaModelCopyWith<$Res> {
  factory _$$MangaModelImplCopyWith(
          _$MangaModelImpl value, $Res Function(_$MangaModelImpl) then) =
      __$$MangaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String slug,
      @JsonKey(name: 'cover_url') String coverUrl,
      @JsonKey(name: 'chapter_count') int chapterCount,
      @JsonKey(name: 'last_update') String lastUpdate,
      String? author,
      String? status,
      List<String>? genres});
}

/// @nodoc
class __$$MangaModelImplCopyWithImpl<$Res>
    extends _$MangaModelCopyWithImpl<$Res, _$MangaModelImpl>
    implements _$$MangaModelImplCopyWith<$Res> {
  __$$MangaModelImplCopyWithImpl(
      _$MangaModelImpl _value, $Res Function(_$MangaModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MangaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? slug = null,
    Object? coverUrl = null,
    Object? chapterCount = null,
    Object? lastUpdate = null,
    Object? author = freezed,
    Object? status = freezed,
    Object? genres = freezed,
  }) {
    return _then(_$MangaModelImpl(
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
      chapterCount: null == chapterCount
          ? _value.chapterCount
          : chapterCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as String,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      genres: freezed == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MangaModelImpl implements _MangaModel {
  const _$MangaModelImpl(
      {required this.id,
      required this.title,
      required this.slug,
      @JsonKey(name: 'cover_url') required this.coverUrl,
      @JsonKey(name: 'chapter_count') required this.chapterCount,
      @JsonKey(name: 'last_update') required this.lastUpdate,
      this.author,
      this.status,
      final List<String>? genres})
      : _genres = genres;

  factory _$MangaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MangaModelImplFromJson(json);

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
  @JsonKey(name: 'chapter_count')
  final int chapterCount;
  @override
  @JsonKey(name: 'last_update')
  final String lastUpdate;
  @override
  final String? author;
  @override
  final String? status;
  final List<String>? _genres;
  @override
  List<String>? get genres {
    final value = _genres;
    if (value == null) return null;
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MangaModel(id: $id, title: $title, slug: $slug, coverUrl: $coverUrl, chapterCount: $chapterCount, lastUpdate: $lastUpdate, author: $author, status: $status, genres: $genres)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MangaModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.coverUrl, coverUrl) ||
                other.coverUrl == coverUrl) &&
            (identical(other.chapterCount, chapterCount) ||
                other.chapterCount == chapterCount) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      slug,
      coverUrl,
      chapterCount,
      lastUpdate,
      author,
      status,
      const DeepCollectionEquality().hash(_genres));

  /// Create a copy of MangaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MangaModelImplCopyWith<_$MangaModelImpl> get copyWith =>
      __$$MangaModelImplCopyWithImpl<_$MangaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MangaModelImplToJson(
      this,
    );
  }
}

abstract class _MangaModel implements MangaModel {
  const factory _MangaModel(
      {required final int id,
      required final String title,
      required final String slug,
      @JsonKey(name: 'cover_url') required final String coverUrl,
      @JsonKey(name: 'chapter_count') required final int chapterCount,
      @JsonKey(name: 'last_update') required final String lastUpdate,
      final String? author,
      final String? status,
      final List<String>? genres}) = _$MangaModelImpl;

  factory _MangaModel.fromJson(Map<String, dynamic> json) =
      _$MangaModelImpl.fromJson;

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
  @JsonKey(name: 'chapter_count')
  int get chapterCount;
  @override
  @JsonKey(name: 'last_update')
  String get lastUpdate;
  @override
  String? get author;
  @override
  String? get status;
  @override
  List<String>? get genres;

  /// Create a copy of MangaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MangaModelImplCopyWith<_$MangaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;

  /// Serializes this CategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) then) =
      _$CategoryModelCopyWithImpl<$Res, CategoryModel>;
  @useResult
  $Res call({int id, String name, String slug});
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res, $Val extends CategoryModel>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryModel
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
              as int,
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
abstract class _$$CategoryModelImplCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$CategoryModelImplCopyWith(
          _$CategoryModelImpl value, $Res Function(_$CategoryModelImpl) then) =
      __$$CategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String slug});
}

/// @nodoc
class __$$CategoryModelImplCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res, _$CategoryModelImpl>
    implements _$$CategoryModelImplCopyWith<$Res> {
  __$$CategoryModelImplCopyWithImpl(
      _$CategoryModelImpl _value, $Res Function(_$CategoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
  }) {
    return _then(_$CategoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$CategoryModelImpl implements _CategoryModel {
  const _$CategoryModelImpl(
      {required this.id, required this.name, required this.slug});

  factory _$CategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String slug;

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, slug: $slug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug);

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      __$$CategoryModelImplCopyWithImpl<_$CategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryModelImplToJson(
      this,
    );
  }
}

abstract class _CategoryModel implements CategoryModel {
  const factory _CategoryModel(
      {required final int id,
      required final String name,
      required final String slug}) = _$CategoryModelImpl;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$CategoryModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get slug;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
