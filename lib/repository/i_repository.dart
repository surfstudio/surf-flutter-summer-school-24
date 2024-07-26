abstract interface class IRepository<T> {
  Future<List<T>> getAll();
}
