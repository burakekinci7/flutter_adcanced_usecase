import 'package:equatable/equatable.dart';

final class BackToFormState extends Equatable {
  /// Form state is variable
  final bool isFormEmpty;
  final bool isFormValid;

  /// Constructor
  const BackToFormState({
    this.isFormEmpty = true,
    this.isFormValid = false,
  });

  /// Copy with methods
  BackToFormState copyWith({bool? isFormEmpty, bool? isFormValid}) {
    return BackToFormState(
        isFormEmpty: isFormEmpty ?? this.isFormEmpty,
        isFormValid: this.isFormValid);
  }

  /// Equatable methods
  @override
  List<Object> get props => [isFormEmpty, isFormValid];
}
