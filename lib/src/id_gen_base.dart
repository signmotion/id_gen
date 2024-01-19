/// A base class for generators.
abstract class IdGenBase<T> {
  const IdGenBase();

  T get([dynamic source]);

  /// Alias for [get] without [source].
  T get next;
}
