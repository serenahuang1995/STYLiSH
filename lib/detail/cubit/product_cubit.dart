import 'package:flutter_bloc/flutter_bloc.dart';

// class ColorCubit extends Cubit<int> {
//   ColorCubit() : super(0); //初始index設為0

//   void changeColor() => emit(state);
// }

// class SixeCubit extends Cubit<int> {
//   SixeCubit() : super(0); //初始index設為0

//   void changeSize() => emit(state);
// }

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0); //初始index設為0

  void increment() => emit(state + 1);
  void decrement() {
    if (state > 0) { 
      emit(state - 1);
    }
    emit(state);
  }
}