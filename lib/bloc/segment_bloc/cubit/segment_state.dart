part of 'segment_cubit.dart';

@immutable
sealed class SegmentState {}

final class SegmentInitialState extends SegmentState {}

final class SegmentSwichState extends SegmentState {
  final int type;
  SegmentSwichState({required this.type});
}
