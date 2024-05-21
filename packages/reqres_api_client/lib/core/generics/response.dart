class Response<T, E> {
  T? data;
  E? error;
  Status status;

  bool get hasError => error != null;
  bool get isLoading => status == Status.loading;

  Response.loading({this.data, this.error, this.status = Status.loading});
  Response.success({this.data, this.error, this.status = Status.success});
  Response.failed({this.data, this.error, this.status = Status.failed});
}

enum Status { loading, failed, success }
