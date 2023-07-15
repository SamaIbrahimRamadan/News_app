part of 'news_cubit.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class ChangeButton extends NewsState {}

class ApiBusiness extends NewsState {}

class ErrorBusiness extends NewsState {
  final String error;
  ErrorBusiness({required this.error}); //ببعت داتا مع ال  state
}

class ApiSearch extends NewsState {}

class ErrorSearch extends NewsState {
  final String error;
  ErrorSearch({required this.error}); //ببعت داتا مع ال  state
}

class ChangeModeTheme extends NewsState {}

class Loading extends NewsState {}
