import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/repos/order_repo/orders_repo.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:equatable/equatable.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit({required this.ordersRepo}) : super(AddOrderInitial());

  final OrdersRepo ordersRepo;

  void addOrder({required OrderInputEntity orderEntity}) async {
    emit(AddOrderLoading());
    var result = await ordersRepo.addOrder(orderEntity: orderEntity);
    result.fold((failure) {
      emit(AddOrderFailure(message: failure.message));
    }, (r) {
      emit(AddOrderSuccess());
    });
  }
}
