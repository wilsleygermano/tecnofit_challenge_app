class Resource<T, E> {
  T? data;
  E? error;
  Status status;

  bool get hasError => error != null;
  bool get isLoading => status == Status.loading;

  Resource.loading({this.data, this.error, this.status = Status.loading});
  Resource.success({this.data, this.error, this.status = Status.success});
  Resource.failed({this.data, this.error, this.status = Status.failed});
}

enum Status { loading, failed, success }
