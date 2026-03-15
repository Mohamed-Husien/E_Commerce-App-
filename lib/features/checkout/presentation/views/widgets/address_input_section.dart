import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          CustomTextFormField(
            hintText: "ألاسم كامل",
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: "البريد الإلكتروني",
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: "العنوان",
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: "المدينة",
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: "رقم الجوال",
            textInputType: TextInputType.number,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: "رقم الطابق و الشقة",
            textInputType: TextInputType.number,
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
