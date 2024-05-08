import 'package:app/presentation/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/menu_form/menu_form_cubit.dart';
import '../core/widgets/primary_button.dart';

class MenuFormScreen extends StatelessWidget {
  const MenuFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuFormCubit(MenuFormState.initial()),
      child: const MenuFormScreenConsumer(),
    );
  }
}

class MenuFormScreenConsumer extends StatelessWidget {
  const MenuFormScreenConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenuFormCubit, MenuFormState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            foregroundColor: Theme.of(context).scaffoldBackgroundColor,
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text(
              'Create Menu Item',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFFFFFFF),
                  ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PrimaryTextField(
                    hintText: 'Enter your title',
                    inputWithLabel: true,
                    labelText: 'Title',
                  ),
                  PrimaryTextField(
                    customContentPadding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                    inputWithLabel: true,
                    keyboardType: TextInputType.multiline,
                    hintText: 'Enter your Description',
                    labelText: 'Description',
                    maxLines: 5,
                  ),
                  const PrimaryTextField(
                    hintText: 'Category',
                    inputWithLabel: true,
                    labelText: 'Category',
                  ),
                  const PrimaryTextField(
                    hintText: 'Price',
                    inputWithLabel: true,
                    labelText: 'Price',
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
              child: Wrap(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                  child: PrimaryButton(
                    text: 'Save',
                    function: () {
                      FocusScope.of(context).unfocus();
                    },
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    borderColor: Colors.transparent,
                    elevation: 0,
                    textColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              )
            ],
          )),
        );
      },
    );
  }
}
