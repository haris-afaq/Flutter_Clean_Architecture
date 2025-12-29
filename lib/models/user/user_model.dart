import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
     /*
      Getting token and error message from API, so:
      - Creating only token and message fields
      - Assigning default values to avoid null checks
      - Using JsonKey to map API response keys from the backend
    */
    
    /// Token returned on success
    @JsonKey(name: 'accessToken') @Default('') String token,

    /// Error message returned on failure
    @JsonKey(name: 'message') @Default('') String message,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

/*
  After creating ONLY this file, run the command below to generate
  the necessary files automatically:

  flutter pub run build_runner build --delete-conflicting-outputs

*/
