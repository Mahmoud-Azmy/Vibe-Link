// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerificationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerificationState()';
}


}

/// @nodoc
class $VerificationStateCopyWith<$Res>  {
$VerificationStateCopyWith(VerificationState _, $Res Function(VerificationState) __);
}


/// @nodoc


class _Initial implements VerificationState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerificationState.initial()';
}


}




/// @nodoc


class Loading implements VerificationState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerificationState.loading()';
}


}




/// @nodoc


class UserCreated implements VerificationState {
  const UserCreated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCreated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerificationState.userCreated()';
}


}




/// @nodoc


class Error implements VerificationState {
  const Error(this.message);
  

 final  String message;

/// Create a copy of VerificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'VerificationState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $VerificationStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of VerificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Verified implements VerificationState {
  const Verified();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Verified);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerificationState.verified()';
}


}




/// @nodoc


class Unverified implements VerificationState {
  const Unverified();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unverified);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerificationState.unverified()';
}


}




/// @nodoc


class EmailResent implements VerificationState {
  const EmailResent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailResent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerificationState.emailResent()';
}


}




/// @nodoc


class VerificationCheckFailed implements VerificationState {
  const VerificationCheckFailed(this.message);
  

 final  String message;

/// Create a copy of VerificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerificationCheckFailedCopyWith<VerificationCheckFailed> get copyWith => _$VerificationCheckFailedCopyWithImpl<VerificationCheckFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationCheckFailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'VerificationState.verificationCheckFailed(message: $message)';
}


}

/// @nodoc
abstract mixin class $VerificationCheckFailedCopyWith<$Res> implements $VerificationStateCopyWith<$Res> {
  factory $VerificationCheckFailedCopyWith(VerificationCheckFailed value, $Res Function(VerificationCheckFailed) _then) = _$VerificationCheckFailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$VerificationCheckFailedCopyWithImpl<$Res>
    implements $VerificationCheckFailedCopyWith<$Res> {
  _$VerificationCheckFailedCopyWithImpl(this._self, this._then);

  final VerificationCheckFailed _self;
  final $Res Function(VerificationCheckFailed) _then;

/// Create a copy of VerificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(VerificationCheckFailed(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
