import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'segment_state.dart';

class SegmentCubit extends Cubit<SegmentState> {
  SegmentCubit() : super(SegmentInitialState());

  switchSegment({required int selectedType}) {
    emit(SegmentSwichState(type: selectedType));
  }

  // switchLanguageSegment({required int selectedType}) {
  //   emit(SegmentSwichLanguageState(language: selectedType));
  // }
}
