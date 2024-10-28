import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/common/bloc/button/button_state_cubit.dart';
import 'package:store_app/common/widgets/app_bar/app_bar.dart';
import 'package:store_app/presentation/settings/widgets/logout.dart';
import 'package:store_app/presentation/settings/widgets/my_favorites_tile.dart';
import 'package:store_app/presentation/settings/widgets/my_orders_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonStateCubit(),
      child: const Scaffold(
        appBar: BasicAppbar(
          title: Text('Settings'),
        ),
        bottomNavigationBar: Logout(),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              MyFavortiesTile(),
              SizedBox(
                height: 15,
              ),
              MyOrdersTile(),
            ],
          ),
        ),
      ),
    );
  }
}
