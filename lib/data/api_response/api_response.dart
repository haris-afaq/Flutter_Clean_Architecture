import 'package:clean_architecture_demu_project/utils/enums.dart';

class ApiResponse<T> {
  // <T> = dynamic data
  Status? status;
  T? data;
  String? message;

  ApiResponse(
    this.status,
    this.data,
    this.message
  );

  // Api response Constructors
  // Loading....
  ApiResponse.loading(): status = Status.loading;

  // Error....
  ApiResponse.error(this.data): status= Status.error;

  // Success
  ApiResponse.completed(this.data): status = Status.completed;
}