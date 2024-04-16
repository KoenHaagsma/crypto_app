// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contentful_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContentfulState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<BannerEntity> get bannerList => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContentfulStateCopyWith<ContentfulState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentfulStateCopyWith<$Res> {
  factory $ContentfulStateCopyWith(
          ContentfulState value, $Res Function(ContentfulState) then) =
      _$ContentfulStateCopyWithImpl<$Res, ContentfulState>;
  @useResult
  $Res call({bool isLoading, List<BannerEntity> bannerList, Failure? failure});
}

/// @nodoc
class _$ContentfulStateCopyWithImpl<$Res, $Val extends ContentfulState>
    implements $ContentfulStateCopyWith<$Res> {
  _$ContentfulStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? bannerList = null,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      bannerList: null == bannerList
          ? _value.bannerList
          : bannerList // ignore: cast_nullable_to_non_nullable
              as List<BannerEntity>,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentfulStateImplCopyWith<$Res>
    implements $ContentfulStateCopyWith<$Res> {
  factory _$$ContentfulStateImplCopyWith(_$ContentfulStateImpl value,
          $Res Function(_$ContentfulStateImpl) then) =
      __$$ContentfulStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<BannerEntity> bannerList, Failure? failure});
}

/// @nodoc
class __$$ContentfulStateImplCopyWithImpl<$Res>
    extends _$ContentfulStateCopyWithImpl<$Res, _$ContentfulStateImpl>
    implements _$$ContentfulStateImplCopyWith<$Res> {
  __$$ContentfulStateImplCopyWithImpl(
      _$ContentfulStateImpl _value, $Res Function(_$ContentfulStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? bannerList = null,
    Object? failure = freezed,
  }) {
    return _then(_$ContentfulStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      bannerList: null == bannerList
          ? _value._bannerList
          : bannerList // ignore: cast_nullable_to_non_nullable
              as List<BannerEntity>,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$ContentfulStateImpl extends _ContentfulState {
  const _$ContentfulStateImpl(
      {this.isLoading = true,
      final List<BannerEntity> bannerList = const [],
      this.failure})
      : _bannerList = bannerList,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<BannerEntity> _bannerList;
  @override
  @JsonKey()
  List<BannerEntity> get bannerList {
    if (_bannerList is EqualUnmodifiableListView) return _bannerList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bannerList);
  }

  @override
  final Failure? failure;

  @override
  String toString() {
    return 'ContentfulState(isLoading: $isLoading, bannerList: $bannerList, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentfulStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._bannerList, _bannerList) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_bannerList), failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentfulStateImplCopyWith<_$ContentfulStateImpl> get copyWith =>
      __$$ContentfulStateImplCopyWithImpl<_$ContentfulStateImpl>(
          this, _$identity);
}

abstract class _ContentfulState extends ContentfulState {
  const factory _ContentfulState(
      {final bool isLoading,
      final List<BannerEntity> bannerList,
      final Failure? failure}) = _$ContentfulStateImpl;
  const _ContentfulState._() : super._();

  @override
  bool get isLoading;
  @override
  List<BannerEntity> get bannerList;
  @override
  Failure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$ContentfulStateImplCopyWith<_$ContentfulStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
