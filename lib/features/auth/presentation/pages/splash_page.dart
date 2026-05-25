import 'package:devpaul_eats/core/theme/app_colors.dart';
import 'package:devpaul_eats/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:devpaul_eats/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthCubit>().checkAuthStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          authenticated: (_) => context.go('/home/vendors'),
          unauthenticated: () => context.go('/login'),
          error: (_) => context.go('/login'),
        );
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.restaurant,
                  size: 64,
                  color: Colors.white,
                ),
              )
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .scale(begin: const Offset(0.5, 0.5), duration: 600.ms),
              const SizedBox(height: 24),
              Text(
                'DevPaul Eats',
                style: TextStyle(
                  fontFamily: 'Playfair',
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  letterSpacing: 1.2,
                ),
              )
                  .animate()
                  .fadeIn(delay: 300.ms, duration: 600.ms)
                  .slideY(begin: 0.3, end: 0, delay: 300.ms, duration: 600.ms),
              const SizedBox(height: 8),
              Text(
                'Sabor en cada entrega',
                style: TextStyle(
                  fontFamily: 'Playfair',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              )
                  .animate()
                  .fadeIn(delay: 500.ms, duration: 600.ms),
              const SizedBox(height: 48),
              const CircularProgressIndicator(
                color: AppColors.primary,
                strokeWidth: 2,
              ).animate().fadeIn(delay: 700.ms, duration: 400.ms),
            ],
          ),
        ),
      ),
    );
  }
}
