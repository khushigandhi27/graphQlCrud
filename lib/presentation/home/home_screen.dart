import 'package:app/application/home/home_cubit.dart';
import 'package:app/domain/core/config/injection.dart';
import 'package:app/domain/core/services/navigation_services/navigation_service.dart';
import 'package:app/domain/core/services/navigation_services/routers/route_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/core/config/app_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    return BlocProvider(
      create: (context) =>
          HomeCubit(HomeState.initial(appStateNotifier: appStateNotifier))
            ..init(),
      child: const HomeScreenConsumer(),
    );
  }
}

class HomeScreenConsumer extends StatelessWidget {
  const HomeScreenConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text(
              'Menu Items list',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFFFFFFF),
                  ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
            child: state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : !state.isLoading && state.lsOfMenuItems.isEmpty
                    ? const Center(
                        child: Text('No items available!'),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              navigator<NavigationService>().navigateTo(
                                  CommonRoutes.menuDetailsRoute,
                                  queryParams: {
                                    'itemId': state.lsOfMenuItems[index].id,
                                  });
                            },
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(
                              Icons.coffee_sharp,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            title: Text(state.lsOfMenuItems[index].title,
                               style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 18.sp,
                                  ),
                            ),
                            subtitle: Text(
                              '\$${state.lsOfMenuItems[index].price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 15.sp,
                                  ),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          );
                        },
                        itemCount: state.lsOfMenuItems.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 1.h,
                          );
                        },
                      ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              navigator<NavigationService>().navigateTo(CommonRoutes.menuFormRoute);
            }
            ,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: const Icon(
              Icons.add,
              color: Color(0xFFFFFFFF),
            ),
          ),
        );
      },
    );
  }
}
