import 'dart:io';

import 'package:devpaul_eats/core/services/storage_service.dart';
import 'package:devpaul_eats/features/menu/data/datasources/menu_remote_datasource.dart';
import 'package:devpaul_eats/features/menu/data/models/menu_item_model.dart';
import 'package:devpaul_eats/features/menu/domain/entities/menu_item.dart';
import 'package:devpaul_eats/features/vendor_panel/presentation/cubit/menu_manager_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

class AddMenuItemBottomSheet extends StatefulWidget {
  final String vendorId;
  final MenuItem? existingItem;

  const AddMenuItemBottomSheet({
    super.key,
    required this.vendorId,
    this.existingItem,
  });

  @override
  State<AddMenuItemBottomSheet> createState() => _AddMenuItemBottomSheetState();
}

class _AddMenuItemBottomSheetState extends State<AddMenuItemBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameCtrl;
  late final TextEditingController _descCtrl;
  late final TextEditingController _priceCtrl;

  String _selectedCategory = 'General';
  bool _isAvailable = true;
  File? _pickedImage;
  bool _loading = false;

  static const _categories = [
    'General',
    'Entradas',
    'Platos fuertes',
    'Postres',
    'Bebidas',
    'Extras',
  ];

  @override
  void initState() {
    super.initState();
    final item = widget.existingItem;
    _nameCtrl = TextEditingController(text: item?.name ?? '');
    _descCtrl = TextEditingController(text: item?.description ?? '');
    _priceCtrl = TextEditingController(
      text: item != null ? item.basePrice.toStringAsFixed(2) : '',
    );
    if (item != null) {
      _selectedCategory = item.category;
      _isAvailable = item.isAvailable;
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _descCtrl.dispose();
    _priceCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final result = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (result != null) {
        setState(() => _pickedImage = File(result.path));
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
    setState(() => _loading = true);

    final dataSource = GetIt.instance<MenuRemoteDataSourceImpl>();
    final cubit = context.read<MenuManagerCubit>();

    try {
      String? uploadedPhotoUrl;
      if (_pickedImage != null) {
        final ts = DateTime.now().millisecondsSinceEpoch;
        uploadedPhotoUrl = await GetIt.instance<StorageService>().uploadImage(
          file: _pickedImage!,
          path: 'menu_items/${widget.vendorId}/$ts.jpg',
        );
      }

      final model = MenuItemModel(
        id: widget.existingItem?.id ?? '',
        vendorId: widget.vendorId,
        name: _nameCtrl.text.trim(),
        description: _descCtrl.text.trim(),
        basePrice: double.parse(_priceCtrl.text.trim()),
        photoUrl: uploadedPhotoUrl ?? widget.existingItem?.photoUrl,
        category: _selectedCategory,
        isAvailable: _isAvailable,
      );

      if (widget.existingItem != null) {
        await dataSource.updateMenuItem(model);
      } else {
        await dataSource.createMenuItem(widget.vendorId, model);
      }

      await cubit.refreshMenu(widget.vendorId);

      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.existingItem != null;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.fromLTRB(24, 24, 24, 24 + bottomInset),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFBDBDBD),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                isEditing ? 'Editar Ítem' : 'Nuevo Ítem',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 20),

              // Image picker
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF8F0),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFFF6B35).withValues(alpha: 0.3)),
                  ),
                  child: _pickedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(_pickedImage!, fit: BoxFit.cover),
                        )
                      : const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_photo_alternate_outlined,
                                size: 36, color: Color(0xFFFF6B35)),
                            SizedBox(height: 8),
                            Text(
                              'Seleccionar imagen',
                              style: TextStyle(
                                color: Color(0xFFFF6B35),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 16),

              // Name
              _buildField(
                controller: _nameCtrl,
                label: 'Nombre del ítem',
                hint: 'Ej. Hamburguesa Clásica',
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 12),

              // Description
              _buildField(
                controller: _descCtrl,
                label: 'Descripción',
                hint: 'Describe el platillo...',
                maxLines: 2,
                validator: null,
              ),
              const SizedBox(height: 12),

              // Price
              _buildField(
                controller: _priceCtrl,
                label: 'Precio base',
                hint: '0.00',
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Campo requerido';
                  if (double.tryParse(v.trim()) == null) return 'Precio inválido';
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Category dropdown
              DropdownButtonFormField<String>(
                initialValue: _selectedCategory,
                decoration: InputDecoration(
                  labelText: 'Categoría',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                items: _categories
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (v) {
                  if (v != null) setState(() => _selectedCategory = v);
                },
              ),
              const SizedBox(height: 12),

              // Available toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Disponible',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  Switch(
                    value: _isAvailable,
                    activeThumbColor: const Color(0xFF4CAF50),
                    onChanged: (v) => setState(() => _isAvailable = v),
                  ),
                ],
              ),

              // TODO: Toppings management will be handled per-item in future scope (T11)

              const SizedBox(height: 20),

              // Submit
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _loading ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B35),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _loading
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'Guardar Ítem',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
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
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
