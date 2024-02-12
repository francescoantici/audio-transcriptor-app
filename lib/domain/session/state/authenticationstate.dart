import 'package:freezed_annotation/freezed_annotation.dart';

part 'authenticationstate.freezed.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  factory AuthenticationState.logged() = Logged;
  factory AuthenticationState.unknown() = Unknown;
}
