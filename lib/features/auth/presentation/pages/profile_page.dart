import 'package:devpaul_eats/features/auth/domain/entities/app_user.dart';
import 'package:devpaul_eats/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:devpaul_eats/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          unauthenticated: () => context.go('/login'),
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          authenticated: (user) => _ProfileBody(user: user),
          loading: () => const Scaffold(
            backgroundColor: Color(0xFFFFF8F0),
            body: Center(child: CircularProgressIndicator()),
          ),
          orElse: () => const Scaffold(
            backgroundColor: Color(0xFFFFF8F0),
            body: Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}

class _ProfileBody extends StatelessWidget {
  final AppUser user;

  const _ProfileBody({required this.user});

  @override
  Widget build(BuildContext context) {
    final initials = _initials(user.name);
    final isVendor = user.role == UserRole.vendor;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Mi Perfil',
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 12),
            // Avatar
            user.photoUrl != null
                ? CircleAvatar(
                    radius: 52,
                    backgroundImage: NetworkImage(user.photoUrl!),
                  )
                : CircleAvatar(
                    radius: 52,
                    backgroundColor: const Color(0xFFFF6B35),
                    child: Text(
                      initials,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
            const SizedBox(height: 16),

            // Name
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 4),

            // Email
            Text(
              user.email,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF757575),
              ),
            ),
            const SizedBox(height: 12),

            // Role chip
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: isVendor
                    ? const Color(0xFFFF6B35).withOpacity(0.12)
                    : const Color(0xFF1565C0).withOpacity(0.10),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isVendor
                      ? const Color(0xFFFF6B35).withOpacity(0.4)
                      : const Color(0xFF1565C0).withOpacity(0.3),
                ),
              ),
              child: Text(
                isVendor ? 'Vendedor' : 'Cliente',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: isVendor
                      ? const Color(0xFFFF6B35)
                      : const Color(0xFF1565C0),
                ),
              ),
            ),
            const SizedBox(height: 36),

            // Vendor panel button
            if (isVendor) ...[
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => context.go('/vendor-panel'),
                  icon: const Icon(Icons.storefront_outlined),
                  label: const Text(
                    'Ir a mi Panel',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B35),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],

            // Sign out button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => context.read<AuthCubit>().signOut(),
                icon: const Icon(
                  Icons.logout,
                  color: Color(0xFFD62828),
                ),
                label: const Text(
                  'Cerrar Sesión',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Color(0xFFD62828),
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  side: const BorderSide(color: Color(0xFFD62828)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }
}
