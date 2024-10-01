import 'package:api_hit_bloc/api_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../model/quotes_model.dart';
import '../urls.dart';

part 'quotes_event.dart';
part 'quotes_state.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  ApiHelper apiHelper ; 
  QuotesBloc({required this.apiHelper}) : super(QuotesInitialState()) {
    on<GetQuotesEvent>((event, emit) async {
      emit(QuotesLoadingState()); 
      
      var resJson = await apiHelper.getApI(url: Urls.getQuotesUrls) ;
      if(resJson != null){
        var mResData = QuoteDataModel.fromJson(resJson) ;
        emit(QuoteLoadedState(responseData: mResData )) ;
      } else {
        emit(QuoteErrorState(errorMsg: 'Error No Quotes'));
      }
    });
  }
}
