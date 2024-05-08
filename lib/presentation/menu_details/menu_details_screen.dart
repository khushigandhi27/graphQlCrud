import 'package:app/domain/core/config/injection.dart';
import 'package:app/domain/core/services/navigation_services/navigation_service.dart';
import 'package:app/domain/core/services/navigation_services/routers/route_name.dart';
import 'package:app/presentation/core/widgets/custom_flushbar.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/menu_details/menu_details_cubit.dart';
import '../../domain/core/config/app_config.dart';

class MenuDetailsScreen extends StatelessWidget {
  final String id;
  const MenuDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    return BlocProvider(
      create: (context) => MenuDetailsCubit(
          MenuDetailsState.initial(appStateNotifier: appStateNotifier, id: id))
        ..init(),
      child: const MenuDetailsScreenConsumer(),
    );
  }
}

class MenuDetailsScreenConsumer extends StatelessWidget {
  const MenuDetailsScreenConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenuDetailsCubit, MenuDetailsState>(
      listener: (context, state) {
        final thisCubit = context.read<MenuDetailsCubit>();
        if (state.isSuccessful) {
          if (state.msg.isNotEmpty) {
            CustomFlushBar.showSuccessOrFail(
                context: context, message: state.msg);
          }
          Future.delayed(const Duration(seconds: 1)).then(
            (value) {
              navigator<NavigationService>()
                  .navigateTo(CommonRoutes.homeRoute, isClearStack: true);
            },
          );
        } else if (state.isFailed) {
          if (state.msg.isNotEmpty) {
            CustomFlushBar.showSuccessOrFail(
                context: context, isFailed: true, message: state.msg);
          }

          thisCubit.emitFromAnywhere(
              state: state.copyWith(isFailed: false, msg: ''));
        }
      },
      builder: (context, state) {
        final thisCubit = context.read<MenuDetailsCubit>();

        return ModalProgressHUD(
          inAsyncCall: state.isUpdating,
          child: Scaffold(
            appBar: AppBar(
              foregroundColor: Theme.of(context).scaffoldBackgroundColor,
              backgroundColor: Theme.of(context).colorScheme.primary,
              title: Text(
                state.isLoading
                    ? 'Loading'
                    : state.menu == null
                        ? 'Menu Details'
                        : state.menu!.title,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFFFFFFF),
                    ),
              ),
              actions: [
                if (!state.isLoading)
                  GestureDetector(
                    onTap: () {
                      thisCubit.deleteMenuItem();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: Icon(
                        Icons.delete_rounded,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  )
              ],
            ),
            body: state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : !state.isLoading && state.menu == null
                    ? const Center(
                        child: Text('Item not found!'),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 4.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'ID: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 17.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                children: [
                                  TextSpan(
                                      text: state.menu!.id,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                          ))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            const Divider(),
                            SizedBox(
                              height: 1.h,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Title: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 17.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                children: [
                                  TextSpan(
                                      text: state.menu!.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                          ))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            const Divider(),
                            SizedBox(
                              height: 1.h,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Description: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 17.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                children: [
                                  TextSpan(
                                    text: state.menu!.description,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
                                        ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            const Divider(),
                            SizedBox(
                              height: 1.h,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Category: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 17.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                children: [
                                  TextSpan(
                                    text: state.menu!.category,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
                                        ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            const Divider(),
                            SizedBox(
                              height: 1.h,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Price: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 17.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                children: [
                                  TextSpan(
                                    text: '\$${state.menu!.price}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
                                        ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                navigator<NavigationService>().navigateTo(
                  CommonRoutes.menuFormRoute,
                  queryParams: {
                    'isEdit': 'true',
                    'menuId': state.id,
                  },
                );
              },
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const Icon(
                Icons.edit,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        );
      },
    );
  }
}
