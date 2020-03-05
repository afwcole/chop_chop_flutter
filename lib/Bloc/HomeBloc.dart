import 'package:bloc/bloc.dart';

enum HomeEvents{increment, decrement} //initialise all events that your Bloc can accept as inputs
                                         //classes can be used to add more detail but enums can be used for simplicity

class HomeBloc extends Bloc<HomeEvents, int>{
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(HomeEvents event) async*{
    switch(event){
      case HomeEvents.increment:
        yield state + 1;
        break;
      case HomeEvents.decrement:
        yield state - 1;
        break;
    }
  }
} //first argument is the events the BLoC can take as input and the next is for the output data type to return
