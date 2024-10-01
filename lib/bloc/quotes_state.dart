part of 'quotes_bloc.dart';

sealed class QuotesState {}

final class QuotesInitialState extends QuotesState {}

final class QuotesLoadingState extends QuotesState {}

final class QuoteLoadedState extends QuotesState {
  QuoteDataModel responseData;
  QuoteLoadedState({required this.responseData});
}

final class QuoteErrorState extends QuotesState {
  String errorMsg;
  QuoteErrorState({required this.errorMsg});
}
