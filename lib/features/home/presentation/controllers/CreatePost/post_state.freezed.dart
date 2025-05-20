// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreatePostState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePostState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreatePostState()';
}


}

/// @nodoc
class $CreatePostStateCopyWith<$Res>  {
$CreatePostStateCopyWith(CreatePostState _, $Res Function(CreatePostState) __);
}


/// @nodoc


class _Initial implements CreatePostState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreatePostState.initial()';
}


}




/// @nodoc


class CreatePostLoading implements CreatePostState {
  const CreatePostLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePostLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreatePostState.loading()';
}


}




/// @nodoc


class CreatePostSuccess implements CreatePostState {
  const CreatePostSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePostSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreatePostState.success()';
}


}




/// @nodoc


class CreatePostFailure implements CreatePostState {
  const CreatePostFailure(this.error);
  

 final  String error;

/// Create a copy of CreatePostState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePostFailureCopyWith<CreatePostFailure> get copyWith => _$CreatePostFailureCopyWithImpl<CreatePostFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePostFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'CreatePostState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $CreatePostFailureCopyWith<$Res> implements $CreatePostStateCopyWith<$Res> {
  factory $CreatePostFailureCopyWith(CreatePostFailure value, $Res Function(CreatePostFailure) _then) = _$CreatePostFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$CreatePostFailureCopyWithImpl<$Res>
    implements $CreatePostFailureCopyWith<$Res> {
  _$CreatePostFailureCopyWithImpl(this._self, this._then);

  final CreatePostFailure _self;
  final $Res Function(CreatePostFailure) _then;

/// Create a copy of CreatePostState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(CreatePostFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PostsLoading implements CreatePostState {
  const PostsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreatePostState.postsLoading()';
}


}




/// @nodoc


class PostsLoaded implements CreatePostState {
  const PostsLoaded(final  List<PostModel> posts): _posts = posts;
  

 final  List<PostModel> _posts;
 List<PostModel> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of CreatePostState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostsLoadedCopyWith<PostsLoaded> get copyWith => _$PostsLoadedCopyWithImpl<PostsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostsLoaded&&const DeepCollectionEquality().equals(other._posts, _posts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'CreatePostState.postsLoaded(posts: $posts)';
}


}

/// @nodoc
abstract mixin class $PostsLoadedCopyWith<$Res> implements $CreatePostStateCopyWith<$Res> {
  factory $PostsLoadedCopyWith(PostsLoaded value, $Res Function(PostsLoaded) _then) = _$PostsLoadedCopyWithImpl;
@useResult
$Res call({
 List<PostModel> posts
});




}
/// @nodoc
class _$PostsLoadedCopyWithImpl<$Res>
    implements $PostsLoadedCopyWith<$Res> {
  _$PostsLoadedCopyWithImpl(this._self, this._then);

  final PostsLoaded _self;
  final $Res Function(PostsLoaded) _then;

/// Create a copy of CreatePostState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? posts = null,}) {
  return _then(PostsLoaded(
null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostModel>,
  ));
}


}

/// @nodoc


class PostsError implements CreatePostState {
  const PostsError(this.error);
  

 final  String error;

/// Create a copy of CreatePostState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostsErrorCopyWith<PostsError> get copyWith => _$PostsErrorCopyWithImpl<PostsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostsError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'CreatePostState.postsError(error: $error)';
}


}

/// @nodoc
abstract mixin class $PostsErrorCopyWith<$Res> implements $CreatePostStateCopyWith<$Res> {
  factory $PostsErrorCopyWith(PostsError value, $Res Function(PostsError) _then) = _$PostsErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$PostsErrorCopyWithImpl<$Res>
    implements $PostsErrorCopyWith<$Res> {
  _$PostsErrorCopyWithImpl(this._self, this._then);

  final PostsError _self;
  final $Res Function(PostsError) _then;

/// Create a copy of CreatePostState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(PostsError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
