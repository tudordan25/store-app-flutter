import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/common/bloc/button/button_state.dart';
import 'package:store_app/common/bloc/button/button_state_cubit.dart';
import 'package:store_app/common/helper/navigator/app_navigator.dart';
import 'package:store_app/common/widgets/button/basic_reactive_button.dart';
import 'package:store_app/domain/auth/usecases/signout.dart';
import 'package:store_app/presentation/auth/pages/signin.dart';
import 'package:store_app/service_locator.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonStateCubit, ButtonState>(
      listener: (context, state) {
        if (state is ButtonSuccessState) {
          AppNavigator.pushAndRemove(context, SigninPage());
        }
        if (state is ButtonFailureState) {
          var snackbar = SnackBar(
            content: Text(state.errorMessage),
            behavior: SnackBarBehavior.floating,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: BasicReactiveButton(
          onPressed: () {
            context.read<ButtonStateCubit>().execute(usecase: sl<SignoutUseCase>());
          },
          content: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Logout',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
