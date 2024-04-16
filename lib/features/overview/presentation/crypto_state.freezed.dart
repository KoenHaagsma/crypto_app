// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CryptoState {
  bool get isLoading => throw _privateConstructorUsedError;
  CryptoEntity? get cryptoEntity => throw _privateConstructorUsedError;
  List<CryptoEntity>? get cryptoEntityList =>
      throw _privateConstructorUsedError;
  SortOptions get sortOption => throw _privateConstructorUsedError;
  SortDirection get sortDirection => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CryptoStateCopyWith<CryptoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoStateCopyWith<$Res> {
  factory $CryptoStateCopyWith(
          CryptoState value, $Res Function(CryptoState) then) =
      _$CryptoStateCopyWithImpl<$Res, CryptoState>;
  @useResult
  $Res call(
      {bool isLoading,
      CryptoEntity? cryptoEntity,
      List<CryptoEntity>? cryptoEntityList,
      SortOptions sortOption,
      SortDirection sortDirection,
      Failure? failure});
}

/// @nodoc
class _$CryptoStateCopyWithImpl<$Res, $Val extends CryptoState>
    implements $CryptoStateCopyWith<$Res> {
  _$CryptoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? cryptoEntity = freezed,
    Object? cryptoEntityList = freezed,
    Object? sortOption = null,
    Object? sortDirection = null,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      cryptoEntity: freezed == cryptoEntity
          ? _value.cryptoEntity
          : cryptoEntity // ignore: cast_nullable_to_non_nullable
              as CryptoEntity?,
      cryptoEntityList: freezed == cryptoEntityList
          ? _value.cryptoEntityList
          : cryptoEntityList // ignore: cast_nullable_to_non_nullable
              as List<CryptoEntity>?,
      sortOption: null == sortOption
          ? _value.sortOption
          : sortOption // ignore: cast_nullable_to_non_nullable
              as SortOptions,
      sortDirection: null == sortDirection
          ? _value.sortDirection
          : sortDirection // ignore: cast_nullable_to_non_nullable
              as SortDirection,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CryptoStateImplCopyWith<$Res>
    implements $CryptoStateCopyWith<$Res> {
  factory _$$CryptoStateImplCopyWith(
          _$CryptoStateImpl value, $Res Function(_$CryptoStateImpl) then) =
      __$$CryptoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      CryptoEntity? cryptoEntity,
      List<CryptoEntity>? cryptoEntityList,
      SortOptions sortOption,
      SortDirection sortDirection,
      Failure? failure});
}

/// @nodoc
class __$$CryptoStateImplCopyWithImpl<$Res>
    extends _$CryptoStateCopyWithImpl<$Res, _$CryptoStateImpl>
    implements _$$CryptoStateImplCopyWith<$Res> {
  __$$CryptoStateImplCopyWithImpl(
      _$CryptoStateImpl _value, $Res Function(_$CryptoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? cryptoEntity = freezed,
    Object? cryptoEntityList = freezed,
    Object? sortOption = null,
    Object? sortDirection = null,
    Object? failure = freezed,
  }) {
    return _then(_$CryptoStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      cryptoEntity: freezed == cryptoEntity
          ? _value.cryptoEntity
          : cryptoEntity // ignore: cast_nullable_to_non_nullable
              as CryptoEntity?,
      cryptoEntityList: freezed == cryptoEntityList
          ? _value._cryptoEntityList
          : cryptoEntityList // ignore: cast_nullable_to_non_nullable
              as List<CryptoEntity>?,
      sortOption: null == sortOption
          ? _value.sortOption
          : sortOption // ignore: cast_nullable_to_non_nullable
              as SortOptions,
      sortDirection: null == sortDirection
          ? _value.sortDirection
          : sortDirection // ignore: cast_nullable_to_non_nullable
              as SortDirection,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$CryptoStateImpl extends _CryptoState {
  const _$CryptoStateImpl(
      {this.isLoading = true,
      this.cryptoEntity,
      final List<CryptoEntity>? cryptoEntityList = const [],
      this.sortOption = SortOptions.MarketCap,
      this.sortDirection = SortDirection.Descending,
      this.failure})
      : _cryptoEntityList = cryptoEntityList,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final CryptoEntity? cryptoEntity;
  final List<CryptoEntity>? _cryptoEntityList;
  @override
  @JsonKey()
  List<CryptoEntity>? get cryptoEntityList {
    final value = _cryptoEntityList;
    if (value == null) return null;
    if (_cryptoEntityList is EqualUnmodifiableListView)
      return _cryptoEntityList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final SortOptions sortOption;
  @override
  @JsonKey()
  final SortDirection sortDirection;
  @override
  final Failure? failure;

  @override
  String toString() {
    return 'CryptoState(isLoading: $isLoading, cryptoEntity: $cryptoEntity, cryptoEntityList: $cryptoEntityList, sortOption: $sortOption, sortDirection: $sortDirection, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptoStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.cryptoEntity, cryptoEntity) ||
                other.cryptoEntity == cryptoEntity) &&
            const DeepCollectionEquality()
                .equals(other._cryptoEntityList, _cryptoEntityList) &&
            (identical(other.sortOption, sortOption) ||
                other.sortOption == sortOption) &&
            (identical(other.sortDirection, sortDirection) ||
                other.sortDirection == sortDirection) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      cryptoEntity,
      const DeepCollectionEquality().hash(_cryptoEntityList),
      sortOption,
      sortDirection,
      failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CryptoStateImplCopyWith<_$CryptoStateImpl> get copyWith =>
      __$$CryptoStateImplCopyWithImpl<_$CryptoStateImpl>(this, _$identity);
}

abstract class _CryptoState extends CryptoState {
  const factory _CryptoState(
      {final bool isLoading,
      final CryptoEntity? cryptoEntity,
      final List<CryptoEntity>? cryptoEntityList,
      final SortOptions sortOption,
      final SortDirection sortDirection,
      final Failure? failure}) = _$CryptoStateImpl;
  const _CryptoState._() : super._();

  @override
  bool get isLoading;
  @override
  CryptoEntity? get cryptoEntity;
  @override
  List<CryptoEntity>? get cryptoEntityList;
  @override
  SortOptions get sortOption;
  @override
  SortDirection get sortDirection;
  @override
  Failure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$CryptoStateImplCopyWith<_$CryptoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
