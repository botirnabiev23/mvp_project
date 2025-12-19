// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourites_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavouritesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavouritesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavouritesEvent()';
}


}

/// @nodoc
class $FavouritesEventCopyWith<$Res>  {
$FavouritesEventCopyWith(FavouritesEvent _, $Res Function(FavouritesEvent) __);
}


/// Adds pattern-matching-related methods to [FavouritesEvent].
extension FavouritesEventPatterns on FavouritesEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Load value)?  load,TResult Function( _Toggle value)?  toggle,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _Toggle() when toggle != null:
return toggle(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Load value)  load,required TResult Function( _Toggle value)  toggle,}){
final _that = this;
switch (_that) {
case _Load():
return load(_that);case _Toggle():
return toggle(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Load value)?  load,TResult? Function( _Toggle value)?  toggle,}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _Toggle() when toggle != null:
return toggle(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( CharacterEntity character)?  toggle,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _Toggle() when toggle != null:
return toggle(_that.character);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( CharacterEntity character)  toggle,}) {final _that = this;
switch (_that) {
case _Load():
return load();case _Toggle():
return toggle(_that.character);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( CharacterEntity character)?  toggle,}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _Toggle() when toggle != null:
return toggle(_that.character);case _:
  return null;

}
}

}

/// @nodoc


class _Load implements FavouritesEvent {
  const _Load();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavouritesEvent.load()';
}


}




/// @nodoc


class _Toggle implements FavouritesEvent {
  const _Toggle(this.character);
  

 final  CharacterEntity character;

/// Create a copy of FavouritesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleCopyWith<_Toggle> get copyWith => __$ToggleCopyWithImpl<_Toggle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Toggle&&(identical(other.character, character) || other.character == character));
}


@override
int get hashCode => Object.hash(runtimeType,character);

@override
String toString() {
  return 'FavouritesEvent.toggle(character: $character)';
}


}

/// @nodoc
abstract mixin class _$ToggleCopyWith<$Res> implements $FavouritesEventCopyWith<$Res> {
  factory _$ToggleCopyWith(_Toggle value, $Res Function(_Toggle) _then) = __$ToggleCopyWithImpl;
@useResult
$Res call({
 CharacterEntity character
});




}
/// @nodoc
class __$ToggleCopyWithImpl<$Res>
    implements _$ToggleCopyWith<$Res> {
  __$ToggleCopyWithImpl(this._self, this._then);

  final _Toggle _self;
  final $Res Function(_Toggle) _then;

/// Create a copy of FavouritesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? character = null,}) {
  return _then(_Toggle(
null == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as CharacterEntity,
  ));
}


}

/// @nodoc
mixin _$FavouritesState {

 List<CharacterEntity> get favourites; bool get isLoading;
/// Create a copy of FavouritesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavouritesStateCopyWith<FavouritesState> get copyWith => _$FavouritesStateCopyWithImpl<FavouritesState>(this as FavouritesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavouritesState&&const DeepCollectionEquality().equals(other.favourites, favourites)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(favourites),isLoading);

@override
String toString() {
  return 'FavouritesState(favourites: $favourites, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $FavouritesStateCopyWith<$Res>  {
  factory $FavouritesStateCopyWith(FavouritesState value, $Res Function(FavouritesState) _then) = _$FavouritesStateCopyWithImpl;
@useResult
$Res call({
 List<CharacterEntity> favourites, bool isLoading
});




}
/// @nodoc
class _$FavouritesStateCopyWithImpl<$Res>
    implements $FavouritesStateCopyWith<$Res> {
  _$FavouritesStateCopyWithImpl(this._self, this._then);

  final FavouritesState _self;
  final $Res Function(FavouritesState) _then;

/// Create a copy of FavouritesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? favourites = null,Object? isLoading = null,}) {
  return _then(_self.copyWith(
favourites: null == favourites ? _self.favourites : favourites // ignore: cast_nullable_to_non_nullable
as List<CharacterEntity>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FavouritesState].
extension FavouritesStatePatterns on FavouritesState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavouritesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavouritesState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavouritesState value)  $default,){
final _that = this;
switch (_that) {
case _FavouritesState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavouritesState value)?  $default,){
final _that = this;
switch (_that) {
case _FavouritesState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CharacterEntity> favourites,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavouritesState() when $default != null:
return $default(_that.favourites,_that.isLoading);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CharacterEntity> favourites,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _FavouritesState():
return $default(_that.favourites,_that.isLoading);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CharacterEntity> favourites,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _FavouritesState() when $default != null:
return $default(_that.favourites,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _FavouritesState implements FavouritesState {
  const _FavouritesState({final  List<CharacterEntity> favourites = const [], this.isLoading = false}): _favourites = favourites;
  

 final  List<CharacterEntity> _favourites;
@override@JsonKey() List<CharacterEntity> get favourites {
  if (_favourites is EqualUnmodifiableListView) return _favourites;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favourites);
}

@override@JsonKey() final  bool isLoading;

/// Create a copy of FavouritesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavouritesStateCopyWith<_FavouritesState> get copyWith => __$FavouritesStateCopyWithImpl<_FavouritesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavouritesState&&const DeepCollectionEquality().equals(other._favourites, _favourites)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_favourites),isLoading);

@override
String toString() {
  return 'FavouritesState(favourites: $favourites, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$FavouritesStateCopyWith<$Res> implements $FavouritesStateCopyWith<$Res> {
  factory _$FavouritesStateCopyWith(_FavouritesState value, $Res Function(_FavouritesState) _then) = __$FavouritesStateCopyWithImpl;
@override @useResult
$Res call({
 List<CharacterEntity> favourites, bool isLoading
});




}
/// @nodoc
class __$FavouritesStateCopyWithImpl<$Res>
    implements _$FavouritesStateCopyWith<$Res> {
  __$FavouritesStateCopyWithImpl(this._self, this._then);

  final _FavouritesState _self;
  final $Res Function(_FavouritesState) _then;

/// Create a copy of FavouritesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? favourites = null,Object? isLoading = null,}) {
  return _then(_FavouritesState(
favourites: null == favourites ? _self._favourites : favourites // ignore: cast_nullable_to_non_nullable
as List<CharacterEntity>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
