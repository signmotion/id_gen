/// Increasing or decreasing integer IDs.
class TransitId {
  /// [firstId] Start integer number.
  /// [delta] Next ID = current ID + [delta].
  TransitId([int firstId = 0, this.delta = 1]) : _id = firstId;

  /// Next unique ID.
  int get next => _id += delta;

  int get current => _id;

  final int delta;

  int _id;
}
