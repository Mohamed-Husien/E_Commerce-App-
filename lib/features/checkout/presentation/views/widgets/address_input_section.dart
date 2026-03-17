import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          CustomTextFormField(
            onSaved: (value) {
              context.read<OrderEntity>().shippingAddress!.name = value!;
            },
            hintText: "ألاسم كامل",
            textInputType: TextInputType.text,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            onSaved: (value) {
              context.read<OrderEntity>().shippingAddress!.email = value!;
            },
            hintText: "البريد الإلكتروني",
            textInputType: TextInputType.text,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            onSaved: (value) {
              context.read<OrderEntity>().shippingAddress!.address = value!;
            },
            hintText: "العنوان",
            textInputType: TextInputType.text,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            onSaved: (value) {
              context.read<OrderEntity>().shippingAddress!.city = value!;
            },
            hintText: "المدينة",
            textInputType: TextInputType.text,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            onSaved: (value) {
              context.read<OrderEntity>().shippingAddress!.phone = value!;
            },
            hintText: "رقم الجوال",
            textInputType: TextInputType.number,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            onSaved: (value) {
              context.read<OrderEntity>().shippingAddress!.floor = value!;
            },
            hintText: "رقم الطابق و الشقة",
            textInputType: TextInputType.number,
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
