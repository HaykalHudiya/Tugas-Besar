import 'package:bloc/bloc.dart';
import 'package:flutter_template_tugas_besar/data/models/request/auth_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'khs_event.dart';
part 'khs_state.dart';
part 'khs_bloc.freezed.dart';

class KhsBloc extends Bloc<KhsEvent, KhsState> {
  KhsBloc() : super(_Initial()) {
    on<KhsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
