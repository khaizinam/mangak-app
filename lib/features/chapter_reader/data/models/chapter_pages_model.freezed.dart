// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_pages_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChapterPagesModel _$ChapterPagesModelFromJson(Map<String, dynamic> json) {
  return _ChapterPagesModel.fromJson(json);
}

/// @nodoc
mixin _$ChapterPagesModel {
  @JsonKey(readValue: _readChapterId)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'chapterName', readValue: _readChapterName)
  String get chapterName => throw _privateConstructorUsedError;
  @JsonKey(name: 'storyId', readValue: _readStoryId)
  String get storyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'storyName', readValue: _readStoryName)
  String get storyName => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  /// Serializes this ChapterPagesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChapterPagesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChapterPagesModelCopyWith<ChapterPagesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterPagesModelCopyWith<$Res> {
  factory $ChapterPagesModelCopyWith(
          ChapterPagesModel value, $Res Function(ChapterPagesModel) then) =
      _$ChapterPagesModelCopyWithImpl<$Res, ChapterPagesModel>;
  @useResult
  $Res call(
      {@JsonKey(readValue: _readChapterId) String id,
      @JsonKey(name: 'chapterName', readValue: _readChapterName)
      String chapterName,
      @JsonKey(name: 'storyId', readValue: _readStoryId) String storyId,
      @JsonKey(name: 'storyName', readValue: _readStoryName) String storyName,
      List<String> images});
}

/// @nodoc
class _$ChapterPagesModelCopyWithImpl<$Res, $Val extends ChapterPagesModel>
    implements $ChapterPagesModelCopyWith<$Res> {
  _$ChapterPagesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChapterPagesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chapterName = null,
    Object? storyId = null,
    Object? storyName = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      chapterName: null == chapterName
          ? _value.chapterName
          : chapterName // ignore: cast_nullable_to_non_nullable
              as String,
      storyId: null == storyId
          ? _value.storyId
          : storyId // ignore: cast_nullable_to_non_nullable
              as String,
      storyName: null == storyName
          ? _value.storyName
          : storyName // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChapterPagesModelImplCopyWith<$Res>
    implements $ChapterPagesModelCopyWith<$Res> {
  factory _$$ChapterPagesModelImplCopyWith(_$ChapterPagesModelImpl value,
          $Res Function(_$ChapterPagesModelImpl) then) =
      __$$ChapterPagesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: _readChapterId) String id,
      @JsonKey(name: 'chapterName', readValue: _readChapterName)
      String chapterName,
      @JsonKey(name: 'storyId', readValue: _readStoryId) String storyId,
      @JsonKey(name: 'storyName', readValue: _readStoryName) String storyName,
      List<String> images});
}

/// @nodoc
class __$$ChapterPagesModelImplCopyWithImpl<$Res>
    extends _$ChapterPagesModelCopyWithImpl<$Res, _$ChapterPagesModelImpl>
    implements _$$ChapterPagesModelImplCopyWith<$Res> {
  __$$ChapterPagesModelImplCopyWithImpl(_$ChapterPagesModelImpl _value,
      $Res Function(_$ChapterPagesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChapterPagesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chapterName = null,
    Object? storyId = null,
    Object? storyName = null,
    Object? images = null,
  }) {
    return _then(_$ChapterPagesModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      chapterName: null == chapterName
          ? _value.chapterName
          : chapterName // ignore: cast_nullable_to_non_nullable
              as String,
      storyId: null == storyId
          ? _value.storyId
          : storyId // ignore: cast_nullable_to_non_nullable
              as String,
      storyName: null == storyName
          ? _value.storyName
          : storyName // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChapterPagesModelImpl implements _ChapterPagesModel {
  const _$ChapterPagesModelImpl(
      {@JsonKey(readValue: _readChapterId) required this.id,
      @JsonKey(name: 'chapterName', readValue: _readChapterName)
      required this.chapterName,
      @JsonKey(name: 'storyId', readValue: _readStoryId) required this.storyId,
      @JsonKey(name: 'storyName', readValue: _readStoryName)
      required this.storyName,
      required final List<String> images})
      : _images = images;

  factory _$ChapterPagesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChapterPagesModelImplFromJson(json);

  @override
  @JsonKey(readValue: _readChapterId)
  final String id;
  @override
  @JsonKey(name: 'chapterName', readValue: _readChapterName)
  final String chapterName;
  @override
  @JsonKey(name: 'storyId', readValue: _readStoryId)
  final String storyId;
  @override
  @JsonKey(name: 'storyName', readValue: _readStoryName)
  final String storyName;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'ChapterPagesModel(id: $id, chapterName: $chapterName, storyId: $storyId, storyName: $storyName, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterPagesModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chapterName, chapterName) ||
                other.chapterName == chapterName) &&
            (identical(other.storyId, storyId) || other.storyId == storyId) &&
            (identical(other.storyName, storyName) ||
                other.storyName == storyName) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, chapterName, storyId,
      storyName, const DeepCollectionEquality().hash(_images));

  /// Create a copy of ChapterPagesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterPagesModelImplCopyWith<_$ChapterPagesModelImpl> get copyWith =>
      __$$ChapterPagesModelImplCopyWithImpl<_$ChapterPagesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChapterPagesModelImplToJson(
      this,
    );
  }
}

abstract class _ChapterPagesModel implements ChapterPagesModel {
  const factory _ChapterPagesModel(
      {@JsonKey(readValue: _readChapterId) required final String id,
      @JsonKey(name: 'chapterName', readValue: _readChapterName)
      required final String chapterName,
      @JsonKey(name: 'storyId', readValue: _readStoryId)
      required final String storyId,
      @JsonKey(name: 'storyName', readValue: _readStoryName)
      required final String storyName,
      required final List<String> images}) = _$ChapterPagesModelImpl;

  factory _ChapterPagesModel.fromJson(Map<String, dynamic> json) =
      _$ChapterPagesModelImpl.fromJson;

  @override
  @JsonKey(readValue: _readChapterId)
  String get id;
  @override
  @JsonKey(name: 'chapterName', readValue: _readChapterName)
  String get chapterName;
  @override
  @JsonKey(name: 'storyId', readValue: _readStoryId)
  String get storyId;
  @override
  @JsonKey(name: 'storyName', readValue: _readStoryName)
  String get storyName;
  @override
  List<String> get images;

  /// Create a copy of ChapterPagesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChapterPagesModelImplCopyWith<_$ChapterPagesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
