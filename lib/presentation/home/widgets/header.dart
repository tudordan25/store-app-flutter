import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/common/helper/navigator/app_navigator.dart';
import 'package:store_app/core/configs/assets/app_images.dart';
import 'package:store_app/core/configs/assets/app_vectors.dart';
import 'package:store_app/core/configs/theme/app_colors.dart';
import 'package:store_app/domain/auth/entity/user.dart';
import 'package:store_app/presentation/cart/pages/cart.dart';
import 'package:store_app/presentation/home/bloc/user_info_display_cubit.dart';
import 'package:store_app/presentation/home/bloc/user_info_display_state.dart';
import 'package:store_app/presentation/settings/pages/settings.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
        builder: (context, state) {
          if (state is UserInfoLoading) {
            return const Center(
              child: Center(child: CircularProgressIndicator()),
            );
          }
          if (state is LoadUserInfoFailure) {
            return const Center(
              child: Text('Failed to load user info'),
            );
          }
          if (state is UserInfoLoaded) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _profileImage(state.user, context),
                _gender(state.user),
                _card(context),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _profileImage(UserEntity user, BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, const SettingsPage());
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          image: user.image.isEmpty
              ? const DecorationImage(image: AssetImage(AppImages.profile))
              : DecorationImage(
                  image: NetworkImage(user.image),
                ),
          shape: BoxShape.circle,
          color: Colors.red,
        ),
      ),
    );
  }

  Widget _gender(UserEntity user) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: AppColors.secondBackground, borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Text(
          user.gender == 1 ? 'Men' : 'Women',
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
    );
  }

  Widget _card(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, const CartPage());
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
        child: SvgPicture.asset(
          AppVectors.bag,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}