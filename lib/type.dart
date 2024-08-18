/// Alias [void Function()]
typedef VoidFn = void Function();

/// Alias [void Function(T)]
typedef ValueFn<T> = void Function(T cx);

/// Alias [void Function(T, R)]
typedef ValueFn2<T, R> = void Function(T cx, R param);

/// Alias [void Function(T, R, S)]
typedef ValueFn3<T, R, S> = void Function(T cx, R param1, S param2);

/// Most json parse map type
///
/// Alias [Map<String, dynamic>]
typedef Map0 = Map<String, dynamic>;

/// Most map type
///
/// Alias [Map<String, T>]
typedef Map1<T> = Map<String, T>;

/// Like js array type
///
/// Alias [List<T>]
typedef Array<T> = List<T>;
