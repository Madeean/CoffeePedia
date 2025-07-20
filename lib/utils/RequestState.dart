import 'package:freezed_annotation/freezed_annotation.dart';

part 'RequestState.freezed.dart';

@freezed
class RequestState<T> with _$RequestState<T> {
  const RequestState._();

  const factory RequestState.idle() = Idle<T>;

  const factory RequestState.loading() = Loading<T>;

  const factory RequestState.success(T data) = Success<T>;

  const factory RequestState.error(T error) = ErrorState<T>;

  bool get isIdle => this is Idle<T>;

  bool get isLoading => this is Loading<T>;

  bool get isSuccess => this is Success<T>;

  bool get isError => this is ErrorState<T>;
}

extension RequestStateX<T> on RequestState<T> {
  T? get dataOrNull => maybeMap(success: (s) => s.data, orElse: () => null);
}
