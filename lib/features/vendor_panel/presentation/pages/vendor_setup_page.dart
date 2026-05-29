import 'dart:typed_data';

import 'package:devpaul_eats/core/services/storage_service.dart';
import 'package:devpaul_eats/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:devpaul_eats/features/vendors/domain/entities/vendor.dart';
import 'package:devpaul_eats/features/vendors/domain/repositories/vendor_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class VendorSetupPage extends StatefulWidget {
  const VendorSetupPage({super.key});

  @override
  State<VendorSetupPage> createState() => _VendorSetupPageState();
}

class _VendorSetupPageState extends State<VendorSetupPage> {
  final _formKey = GlobalKey<FormState>();
  final _storeNameCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  VendorCategory _selectedCategory = VendorCategory.other;
  Uint8List? _pickedBytes;
  bool _loading = false;

  @override
  void dispose() {
    _storeNameCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickCoverPhoto() async {
    try {
      final result = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (result != null) {
        final bytes = await result.readAsBytes();
        setState(() => _pickedBytes = bytes);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al seleccionar imagen: $e')),
        );
      }
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final authState = context.read<AuthCubit>().state;
    final userId = authState.maybeWhen(
      authenticated: (user) => user.id,
      orElse: () => null,
    );

    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sesión no válida. Por favor inicia sesión.')),
      );
      return;
    }

    setState(() => _loading = true);

    try {
      String? coverPhotoUrl;
      if (_pickedBytes != null) {
        final ts = DateTime.now().millisecondsSinceEpoch;
        coverPhotoUrl = await GetIt.instance<StorageService>().uploadImage(
          bytes: _pickedBytes!,
          path: 'vendors/$userId/cover_$ts.jpg',
        );
      }

      final vendor = Vendor(
        id: '',
        userId: userId,
        storeName: _storeNameCtrl.text.trim(),
        description: _descCtrl.text.trim(),
        category: _selectedCategory,
        coverPhotoUrl: coverPhotoUrl,
        rating: 0.0,
        totalOrders: 0,
        isOpen: true,
        createdAt: DateTime.now(),
      );

      final repository = GetIt.instance<VendorRepository>();
      final result = await repository.createVendor(vendor);

      result.fold(
        (failure) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${failure.message}')),
            );
          }
        },
        (_) {
          if (mounted) context.go('/vendor-panel');
        },
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error inesperado: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Configura tu Tienda',
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '¡Bienvenido, chef!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Completa los datos de tu tienda para comenzar a recibir pedidos.',
                style: TextStyle(fontSize: 14, color: Color(0xFF757575)),
              ),
              const SizedBox(height: 28),

              // Cover photo
              GestureDetector(
                onTap: _pickCoverPhoto,
                child: Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFFF6B35).withValues(alpha: 0.3),
                    ),
                  ),
                  child: _pickedBytes != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.memory(_pickedBytes!, fit: BoxFit.cover),
                        )
                      : const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 48,
                              color: Color(0xFFFF6B35),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Añadir foto de portada',
                              style: TextStyle(
                                color: Color(0xFFFF6B35),
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 20),

              // Store name
              _buildField(
                controller: _storeNameCtrl,
                label: 'Nombre de la tienda',
                hint: 'Ej. La Cocina de María',
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Nombre requerido' : null,
              ),
              const SizedBox(height: 16),

              // Description
              _buildField(
                controller: _descCtrl,
                label: 'Descripción',
                hint: 'Describe tu cocina y especialidades...',
                maxLines: 3,
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Descripción requerida' : null,
              ),
              const SizedBox(height: 16),

              // Category dropdown
              DropdownButtonFormField<VendorCategory>(
                initialValue: _selectedCategory,
                decoration: InputDecoration(
                  labelText: 'Categoría',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
                items: VendorCategory.values
                    .map((c) => DropdownMenuItem(
                          value: c,
                          child: Text(_categoryLabel(c)),
                        ))
                    .toList(),
                onChanged: (v) {
                  if (v != null) setState(() => _selectedCategory = v);
                },
              ),
              const SizedBox(height: 32),

              // Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _loading ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B35),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: _loading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.5,
                          ),
                        )
                      : const Text(
                          'Crear mi Tienda',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }

  String _categoryLabel(VendorCategory c) {
    const labels = {
      VendorCategory.burgers: 'Hamburguesas',
      VendorCategory.tacos: 'Tacos',
      VendorCategory.pizza: 'Pizza',
      VendorCategory.bowls: 'Bowls',
      VendorCategory.pasta: 'Pasta',
      VendorCategory.other: 'Otro',
    };
    return labels[c] ?? c.name;
  }
}
