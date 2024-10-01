import 'package:api_hit_bloc/bloc/quotes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuotesBloc>(context).add(GetQuotesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quotes"),
        centerTitle: true,
      ),
      body: BlocBuilder<QuotesBloc, QuotesState>(builder: (context, state) {
        if (state is QuotesLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is QuoteErrorState) {
          return Center(
            child: Text(state.errorMsg),
          );
        } else if (state is QuoteLoadedState) {
          var mDataModel = state.responseData;
          return ListView.builder(
              itemCount: mDataModel.quotes.length,
              itemBuilder: (context, index) {
                var eachQuotes = mDataModel.quotes[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                          side: const BorderSide(
                              color: Colors.black54, width: 1)),
                      title: Text(eachQuotes.quote),
                      subtitle: Text(
                        eachQuotes.author,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red),
                      ),
                    ),
                  ),
                );
              });
        }
        return Container();
      }),
    );
  }
}
