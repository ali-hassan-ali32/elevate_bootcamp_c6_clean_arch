enum Status { init, loading, failure, success, empty }

class Resources<T> {
  String? message;
  // Exception? exception;
  T? data;
  Status status;

  Resources._() : status = Status.init;

  Resources.init() : status = Status.init;

  Resources.loading() : status = Status.loading;

  Resources.success(this.data) : status = Status.success;

  Resources.failure(this.message) : status = Status.failure;
}
