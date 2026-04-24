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
  @JsonKey(readValue: _readId)
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumb_url')
  String get thumbUrl => throw _privateConstructorUsedError;
  @JsonKey(readValue: _readTotalChapters, name: 'total_chapters')
  String? get totalChapters => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  List<String>? get author => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(readValue: _readId)
  String? get views => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'chaptersLatest')
  List<ChapterLatestModel>? get chaptersLatest =>
      throw _privateConstructorUsedError;

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
      {@JsonKey(readValue: _readId) String id,
      String name,
      String slug,
      @JsonKey(name: 'thumb_url') String thumbUrl,
      @JsonKey(readValue: _readTotalChapters, name: 'total_chapters')
      String? totalChapters,
      @JsonKey(name: 'updated_at') String? updatedAt,
      List<String>? author,
      String? status,
      @JsonKey(readValue: _readId) String? views,
      String? description,
      @JsonKey(name: 'chaptersLatest')
      List<ChapterLatestModel>? chaptersLatest});
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
    Object? name = null,
    Object? slug = null,
    Object? thumbUrl = null,
    Object? totalChapters = freezed,
    Object? updatedAt = freezed,
    Object? author = freezed,
    Object? status = freezed,
    Object? views = freezed,
    Object? description = freezed,
    Object? chaptersLatest = freezed,
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
      totalChapters: freezed == totalChapters
          ? _value.totalChapters
          : totalChapters // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      views: freezed == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      chaptersLatest: freezed == chaptersLatest
          ? _value.chaptersLatest
          : chaptersLatest // ignore: cast_nullable_to_non_nullable
              as List<ChapterLatestModel>?,
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
      {@JsonKey(readValue: _readId) String id,
      String name,
      String slug,
      @JsonKey(name: 'thumb_url') String thumbUrl,
      @JsonKey(readValue: _readTotalChapters, name: 'total_chapters')
      String? totalChapters,
      @JsonKey(name: 'updated_at') String? updatedAt,
      List<String>? author,
      String? status,
      @JsonKey(readValue: _readId) String? views,
      String? description,
      @JsonKey(name: 'chaptersLatest')
      List<ChapterLatestModel>? chaptersLatest});
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
    Object? name = null,
    Object? slug = null,
    Object? thumbUrl = null,
    Object? totalChapters = freezed,
    Object? updatedAt = freezed,
    Object? author = freezed,
    Object? status = freezed,
    Object? views = freezed,
    Object? description = freezed,
    Object? chaptersLatest = freezed,
  }) {
    return _then(_$MangaModelImpl(
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
      totalChapters: freezed == totalChapters
          ? _value.totalChapters
          : totalChapters // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value._author
          : author // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      views: freezed == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      chaptersLatest: freezed == chaptersLatest
          ? _value._chaptersLatest
          : chaptersLatest // ignore: cast_nullable_to_non_nullable
              as List<ChapterLatestModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MangaModelImpl implements _MangaModel {
  const _$MangaModelImpl(
      {@JsonKey(readValue: _readId) required this.id,
      required this.name,
      required this.slug,
      @JsonKey(name: 'thumb_url') required this.thumbUrl,
      @JsonKey(readValue: _readTotalChapters, name: 'total_chapters')
      this.totalChapters,
      @JsonKey(name: 'updated_at') this.updatedAt,
      final List<String>? author,
      this.status,
      @JsonKey(readValue: _readId) this.views,
      this.description,
      @JsonKey(name: 'chaptersLatest')
      final List<ChapterLatestModel>? chaptersLatest})
      : _author = author,
        _chaptersLatest = chaptersLatest;

  factory _$MangaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MangaModelImplFromJson(json);

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
  @JsonKey(readValue: _readTotalChapters, name: 'total_chapters')
  final String? totalChapters;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final List<String>? _author;
  @override
  List<String>? get author {
    final value = _author;
    if (value == null) return null;
    if (_author is EqualUnmodifiableListView) return _author;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? status;
  @override
  @JsonKey(readValue: _readId)
  final String? views;
  @override
  final String? description;
  final List<ChapterLatestModel>? _chaptersLatest;
  @override
  @JsonKey(name: 'chaptersLatest')
  List<ChapterLatestModel>? get chaptersLatest {
    final value = _chaptersLatest;
    if (value == null) return null;
    if (_chaptersLatest is EqualUnmodifiableListView) return _chaptersLatest;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MangaModel(id: $id, name: $name, slug: $slug, thumbUrl: $thumbUrl, totalChapters: $totalChapters, updatedAt: $updatedAt, author: $author, status: $status, views: $views, description: $description, chaptersLatest: $chaptersLatest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MangaModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.thumbUrl, thumbUrl) ||
                other.thumbUrl == thumbUrl) &&
            (identical(other.totalChapters, totalChapters) ||
                other.totalChapters == totalChapters) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._author, _author) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._chaptersLatest, _chaptersLatest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      slug,
      thumbUrl,
      totalChapters,
      updatedAt,
      const DeepCollectionEquality().hash(_author),
      status,
      views,
      description,
      const DeepCollectionEquality().hash(_chaptersLatest));

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
      {@JsonKey(readValue: _readId) required final String id,
      required final String name,
      required final String slug,
      @JsonKey(name: 'thumb_url') required final String thumbUrl,
      @JsonKey(readValue: _readTotalChapters, name: 'total_chapters')
      final String? totalChapters,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      final List<String>? author,
      final String? status,
      @JsonKey(readValue: _readId) final String? views,
      final String? description,
      @JsonKey(name: 'chaptersLatest')
      final List<ChapterLatestModel>? chaptersLatest}) = _$MangaModelImpl;

  factory _MangaModel.fromJson(Map<String, dynamic> json) =
      _$MangaModelImpl.fromJson;

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
  @JsonKey(readValue: _readTotalChapters, name: 'total_chapters')
  String? get totalChapters;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  List<String>? get author;
  @override
  String? get status;
  @override
  @JsonKey(readValue: _readId)
  String? get views;
  @override
  String? get description;
  @override
  @JsonKey(name: 'chaptersLatest')
  List<ChapterLatestModel>? get chaptersLatest;

  /// Create a copy of MangaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MangaModelImplCopyWith<_$MangaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChapterLatestModel _$ChapterLatestModelFromJson(Map<String, dynamic> json) {
  return _ChapterLatestModel.fromJson(json);
}

/// @nodoc
mixin _$ChapterLatestModel {
  @JsonKey(name: 'filename')
  String? get filename => throw _privateConstructorUsedError;
  @JsonKey(name: 'chapter_name')
  String? get chapterName => throw _privateConstructorUsedError;
  @JsonKey(name: 'chapter_title')
  String? get chapterTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'chapter_api_data')
  String? get chapterApiData => throw _privateConstructorUsedError;

  /// Serializes this ChapterLatestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChapterLatestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChapterLatestModelCopyWith<ChapterLatestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterLatestModelCopyWith<$Res> {
  factory $ChapterLatestModelCopyWith(
          ChapterLatestModel value, $Res Function(ChapterLatestModel) then) =
      _$ChapterLatestModelCopyWithImpl<$Res, ChapterLatestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'filename') String? filename,
      @JsonKey(name: 'chapter_name') String? chapterName,
      @JsonKey(name: 'chapter_title') String? chapterTitle,
      @JsonKey(name: 'chapter_api_data') String? chapterApiData});
}

/// @nodoc
class _$ChapterLatestModelCopyWithImpl<$Res, $Val extends ChapterLatestModel>
    implements $ChapterLatestModelCopyWith<$Res> {
  _$ChapterLatestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChapterLatestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filename = freezed,
    Object? chapterName = freezed,
    Object? chapterTitle = freezed,
    Object? chapterApiData = freezed,
  }) {
    return _then(_value.copyWith(
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
      chapterName: freezed == chapterName
          ? _value.chapterName
          : chapterName // ignore: cast_nullable_to_non_nullable
              as String?,
      chapterTitle: freezed == chapterTitle
          ? _value.chapterTitle
          : chapterTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      chapterApiData: freezed == chapterApiData
          ? _value.chapterApiData
          : chapterApiData // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChapterLatestModelImplCopyWith<$Res>
    implements $ChapterLatestModelCopyWith<$Res> {
  factory _$$ChapterLatestModelImplCopyWith(_$ChapterLatestModelImpl value,
          $Res Function(_$ChapterLatestModelImpl) then) =
      __$$ChapterLatestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'filename') String? filename,
      @JsonKey(name: 'chapter_name') String? chapterName,
      @JsonKey(name: 'chapter_title') String? chapterTitle,
      @JsonKey(name: 'chapter_api_data') String? chapterApiData});
}

/// @nodoc
class __$$ChapterLatestModelImplCopyWithImpl<$Res>
    extends _$ChapterLatestModelCopyWithImpl<$Res, _$ChapterLatestModelImpl>
    implements _$$ChapterLatestModelImplCopyWith<$Res> {
  __$$ChapterLatestModelImplCopyWithImpl(_$ChapterLatestModelImpl _value,
      $Res Function(_$ChapterLatestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChapterLatestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filename = freezed,
    Object? chapterName = freezed,
    Object? chapterTitle = freezed,
    Object? chapterApiData = freezed,
  }) {
    return _then(_$ChapterLatestModelImpl(
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
      chapterName: freezed == chapterName
          ? _value.chapterName
          : chapterName // ignore: cast_nullable_to_non_nullable
              as String?,
      chapterTitle: freezed == chapterTitle
          ? _value.chapterTitle
          : chapterTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      chapterApiData: freezed == chapterApiData
          ? _value.chapterApiData
          : chapterApiData // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChapterLatestModelImpl implements _ChapterLatestModel {
  const _$ChapterLatestModelImpl(
      {@JsonKey(name: 'filename') this.filename,
      @JsonKey(name: 'chapter_name') this.chapterName,
      @JsonKey(name: 'chapter_title') this.chapterTitle,
      @JsonKey(name: 'chapter_api_data') this.chapterApiData});

  factory _$ChapterLatestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChapterLatestModelImplFromJson(json);

  @override
  @JsonKey(name: 'filename')
  final String? filename;
  @override
  @JsonKey(name: 'chapter_name')
  final String? chapterName;
  @override
  @JsonKey(name: 'chapter_title')
  final String? chapterTitle;
  @override
  @JsonKey(name: 'chapter_api_data')
  final String? chapterApiData;

  @override
  String toString() {
    return 'ChapterLatestModel(filename: $filename, chapterName: $chapterName, chapterTitle: $chapterTitle, chapterApiData: $chapterApiData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterLatestModelImpl &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.chapterName, chapterName) ||
                other.chapterName == chapterName) &&
            (identical(other.chapterTitle, chapterTitle) ||
                other.chapterTitle == chapterTitle) &&
            (identical(other.chapterApiData, chapterApiData) ||
                other.chapterApiData == chapterApiData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, filename, chapterName, chapterTitle, chapterApiData);

  /// Create a copy of ChapterLatestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterLatestModelImplCopyWith<_$ChapterLatestModelImpl> get copyWith =>
      __$$ChapterLatestModelImplCopyWithImpl<_$ChapterLatestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChapterLatestModelImplToJson(
      this,
    );
  }
}

abstract class _ChapterLatestModel implements ChapterLatestModel {
  const factory _ChapterLatestModel(
          {@JsonKey(name: 'filename') final String? filename,
          @JsonKey(name: 'chapter_name') final String? chapterName,
          @JsonKey(name: 'chapter_title') final String? chapterTitle,
          @JsonKey(name: 'chapter_api_data') final String? chapterApiData}) =
      _$ChapterLatestModelImpl;

  factory _ChapterLatestModel.fromJson(Map<String, dynamic> json) =
      _$ChapterLatestModelImpl.fromJson;

  @override
  @JsonKey(name: 'filename')
  String? get filename;
  @override
  @JsonKey(name: 'chapter_name')
  String? get chapterName;
  @override
  @JsonKey(name: 'chapter_title')
  String? get chapterTitle;
  @override
  @JsonKey(name: 'chapter_api_data')
  String? get chapterApiData;

  /// Create a copy of ChapterLatestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChapterLatestModelImplCopyWith<_$ChapterLatestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  @JsonKey(readValue: _readId)
  String get id => throw _privateConstructorUsedError;
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
  $Res call({@JsonKey(readValue: _readId) String id, String name, String slug});
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
abstract class _$$CategoryModelImplCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$CategoryModelImplCopyWith(
          _$CategoryModelImpl value, $Res Function(_$CategoryModelImpl) then) =
      __$$CategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(readValue: _readId) String id, String name, String slug});
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
class _$CategoryModelImpl implements _CategoryModel {
  const _$CategoryModelImpl(
      {@JsonKey(readValue: _readId) required this.id,
      required this.name,
      required this.slug});

  factory _$CategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelImplFromJson(json);

  @override
  @JsonKey(readValue: _readId)
  final String id;
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
      {@JsonKey(readValue: _readId) required final String id,
      required final String name,
      required final String slug}) = _$CategoryModelImpl;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$CategoryModelImpl.fromJson;

  @override
  @JsonKey(readValue: _readId)
  String get id;
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

FeaturedSectionModel _$FeaturedSectionModelFromJson(Map<String, dynamic> json) {
  return _FeaturedSectionModel.fromJson(json);
}

/// @nodoc
mixin _$FeaturedSectionModel {
  CategoryModel get category => throw _privateConstructorUsedError;
  List<MangaModel> get stories => throw _privateConstructorUsedError;

  /// Serializes this FeaturedSectionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeaturedSectionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeaturedSectionModelCopyWith<FeaturedSectionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeaturedSectionModelCopyWith<$Res> {
  factory $FeaturedSectionModelCopyWith(FeaturedSectionModel value,
          $Res Function(FeaturedSectionModel) then) =
      _$FeaturedSectionModelCopyWithImpl<$Res, FeaturedSectionModel>;
  @useResult
  $Res call({CategoryModel category, List<MangaModel> stories});

  $CategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class _$FeaturedSectionModelCopyWithImpl<$Res,
        $Val extends FeaturedSectionModel>
    implements $FeaturedSectionModelCopyWith<$Res> {
  _$FeaturedSectionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeaturedSectionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? stories = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      stories: null == stories
          ? _value.stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<MangaModel>,
    ) as $Val);
  }

  /// Create a copy of FeaturedSectionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res> get category {
    return $CategoryModelCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FeaturedSectionModelImplCopyWith<$Res>
    implements $FeaturedSectionModelCopyWith<$Res> {
  factory _$$FeaturedSectionModelImplCopyWith(_$FeaturedSectionModelImpl value,
          $Res Function(_$FeaturedSectionModelImpl) then) =
      __$$FeaturedSectionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CategoryModel category, List<MangaModel> stories});

  @override
  $CategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class __$$FeaturedSectionModelImplCopyWithImpl<$Res>
    extends _$FeaturedSectionModelCopyWithImpl<$Res, _$FeaturedSectionModelImpl>
    implements _$$FeaturedSectionModelImplCopyWith<$Res> {
  __$$FeaturedSectionModelImplCopyWithImpl(_$FeaturedSectionModelImpl _value,
      $Res Function(_$FeaturedSectionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeaturedSectionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? stories = null,
  }) {
    return _then(_$FeaturedSectionModelImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      stories: null == stories
          ? _value._stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<MangaModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeaturedSectionModelImpl implements _FeaturedSectionModel {
  const _$FeaturedSectionModelImpl(
      {required this.category, required final List<MangaModel> stories})
      : _stories = stories;

  factory _$FeaturedSectionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeaturedSectionModelImplFromJson(json);

  @override
  final CategoryModel category;
  final List<MangaModel> _stories;
  @override
  List<MangaModel> get stories {
    if (_stories is EqualUnmodifiableListView) return _stories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stories);
  }

  @override
  String toString() {
    return 'FeaturedSectionModel(category: $category, stories: $stories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeaturedSectionModelImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._stories, _stories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, category, const DeepCollectionEquality().hash(_stories));

  /// Create a copy of FeaturedSectionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeaturedSectionModelImplCopyWith<_$FeaturedSectionModelImpl>
      get copyWith =>
          __$$FeaturedSectionModelImplCopyWithImpl<_$FeaturedSectionModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeaturedSectionModelImplToJson(
      this,
    );
  }
}

abstract class _FeaturedSectionModel implements FeaturedSectionModel {
  const factory _FeaturedSectionModel(
      {required final CategoryModel category,
      required final List<MangaModel> stories}) = _$FeaturedSectionModelImpl;

  factory _FeaturedSectionModel.fromJson(Map<String, dynamic> json) =
      _$FeaturedSectionModelImpl.fromJson;

  @override
  CategoryModel get category;
  @override
  List<MangaModel> get stories;

  /// Create a copy of FeaturedSectionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeaturedSectionModelImplCopyWith<_$FeaturedSectionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
