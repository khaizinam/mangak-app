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
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'chapter_number')
  String get chapterNumber => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_chapter_id')
  int? get nextChapterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'prev_chapter_id')
  int? get prevChapterId => throw _privateConstructorUsedError;

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
      {int id,
      @JsonKey(name: 'chapter_number') String chapterNumber,
      List<String> images,
      @JsonKey(name: 'next_chapter_id') int? nextChapterId,
      @JsonKey(name: 'prev_chapter_id') int? prevChapterId});
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
    Object? chapterNumber = null,
    Object? images = null,
    Object? nextChapterId = freezed,
    Object? prevChapterId = freezed,
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
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nextChapterId: freezed == nextChapterId
          ? _value.nextChapterId
          : nextChapterId // ignore: cast_nullable_to_non_nullable
              as int?,
      prevChapterId: freezed == prevChapterId
          ? _value.prevChapterId
          : prevChapterId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {int id,
      @JsonKey(name: 'chapter_number') String chapterNumber,
      List<String> images,
      @JsonKey(name: 'next_chapter_id') int? nextChapterId,
      @JsonKey(name: 'prev_chapter_id') int? prevChapterId});
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
    Object? chapterNumber = null,
    Object? images = null,
    Object? nextChapterId = freezed,
    Object? prevChapterId = freezed,
  }) {
    return _then(_$ChapterPagesModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      chapterNumber: null == chapterNumber
          ? _value.chapterNumber
          : chapterNumber // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nextChapterId: freezed == nextChapterId
          ? _value.nextChapterId
          : nextChapterId // ignore: cast_nullable_to_non_nullable
              as int?,
      prevChapterId: freezed == prevChapterId
          ? _value.prevChapterId
          : prevChapterId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChapterPagesModelImpl implements _ChapterPagesModel {
  const _$ChapterPagesModelImpl(
      {required this.id,
      @JsonKey(name: 'chapter_number') required this.chapterNumber,
      required final List<String> images,
      @JsonKey(name: 'next_chapter_id') this.nextChapterId,
      @JsonKey(name: 'prev_chapter_id') this.prevChapterId})
      : _images = images;

  factory _$ChapterPagesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChapterPagesModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'chapter_number')
  final String chapterNumber;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey(name: 'next_chapter_id')
  final int? nextChapterId;
  @override
  @JsonKey(name: 'prev_chapter_id')
  final int? prevChapterId;

  @override
  String toString() {
    return 'ChapterPagesModel(id: $id, chapterNumber: $chapterNumber, images: $images, nextChapterId: $nextChapterId, prevChapterId: $prevChapterId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterPagesModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chapterNumber, chapterNumber) ||
                other.chapterNumber == chapterNumber) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.nextChapterId, nextChapterId) ||
                other.nextChapterId == nextChapterId) &&
            (identical(other.prevChapterId, prevChapterId) ||
                other.prevChapterId == prevChapterId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      chapterNumber,
      const DeepCollectionEquality().hash(_images),
      nextChapterId,
      prevChapterId);

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
          {required final int id,
          @JsonKey(name: 'chapter_number') required final String chapterNumber,
          required final List<String> images,
          @JsonKey(name: 'next_chapter_id') final int? nextChapterId,
          @JsonKey(name: 'prev_chapter_id') final int? prevChapterId}) =
      _$ChapterPagesModelImpl;

  factory _ChapterPagesModel.fromJson(Map<String, dynamic> json) =
      _$ChapterPagesModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'chapter_number')
  String get chapterNumber;
  @override
  List<String> get images;
  @override
  @JsonKey(name: 'next_chapter_id')
  int? get nextChapterId;
  @override
  @JsonKey(name: 'prev_chapter_id')
  int? get prevChapterId;

  /// Create a copy of ChapterPagesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChapterPagesModelImplCopyWith<_$ChapterPagesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
