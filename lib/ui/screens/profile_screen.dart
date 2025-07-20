import 'package:flutter/material.dart';
import '../theme.dart';
import '../components/glass_components.dart';
import '../components/restaurant_icons.dart';
import 'dart:io';
import 'dart:ui';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController(
    text: 'Ashu',
  );
  final TextEditingController _phoneController = TextEditingController(
    text: '+1 234 567 8900',
  );
  final TextEditingController _locationController = TextEditingController(
    text: 'New York, USA',
  );
  final TextEditingController _emailController = TextEditingController(
    text: 'ashu@example.com',
  );

  // Image handling
  File? _selectedImage;

  // Loading state
  bool _isLoading = false;

  // Form validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    // TODO: Implement image picker functionality
    // For now, just show a message
    _showErrorDialog('Image picker functionality will be implemented soon!');
  }

  Future<void> _takePhoto() async {
    // TODO: Implement camera functionality
    // For now, just show a message
    _showErrorDialog('Camera functionality will be implemented soon!');
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder:
          (context) => ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: RiveAppTheme.getGlassGradient(context),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                  border: Border.all(color: RiveAppTheme.glassBorder, width: 1),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Select Photo Source',
                      style: RiveAppTheme.getTitleStyle(context),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildImageSourceOption(
                          icon: RestaurantIcons.kitchen,
                          label: 'Camera',
                          onTap: () {
                            Navigator.pop(context);
                            _takePhoto();
                          },
                        ),
                        _buildImageSourceOption(
                          icon: Icons.photo_library_outlined,
                          label: 'Gallery',
                          onTap: () {
                            Navigator.pop(context);
                            _pickImage();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  Widget _buildImageSourceOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return AnimatedGlassCard(
      width: 120,
      height: 100,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: RiveAppTheme.getButtonGradient(),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: RiveAppTheme.secondaryYellow.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style: RiveAppTheme.getBodyStyle(
              context,
            ).copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: RiveAppTheme.getBackground2(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            title: Text(
              'Error',
              style: TextStyle(
                color: RiveAppTheme.accentOrange,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
              ),
            ),
            content: Text(
              message,
              style: const TextStyle(color: Colors.white, fontFamily: "Inter"),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: RiveAppTheme.secondaryYellow,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: RiveAppTheme.getBackground2(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            title: Text(
              'Success',
              style: TextStyle(
                color: RiveAppTheme.secondaryYellow,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
              ),
            ),
            content: const Text(
              'Profile updated successfully!',
              style: TextStyle(color: Colors.white, fontFamily: "Inter"),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: RiveAppTheme.secondaryYellow,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
    );
  }

  Future<void> _saveChanges() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 2));

      // Here you would typically:
      // 1. Upload the image to your server/cloud storage
      // 2. Save the user data to your database
      // 3. Update local storage/cache

      // For now, we'll just show success
      _showSuccessDialog();
    } catch (e) {
      _showErrorDialog('Failed to save changes: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: RiveAppTheme.getBackgroundGradient(context),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Glass AppBar
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    height: 80,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      gradient: RiveAppTheme.getGlassGradient(context),
                      border: Border(
                        bottom: BorderSide(
                          color: RiveAppTheme.glassBorder,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        GlassContainer(
                          borderRadius: 12,
                          padding: const EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: RiveAppTheme.getTextColor(context),
                              size: 20,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Edit Profile',
                          style: RiveAppTheme.getTitleStyle(context),
                        ),
                        const Spacer(),
                        const SizedBox(width: 40), // Balance for back button
                      ],
                    ),
                  ),
                ),
              ),

              // Content
              Expanded(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        // Profile Photo Section with Glass Effect
                        GlassCard(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: _showImageSourceDialog,
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: RiveAppTheme.getButtonGradient(),
                                    boxShadow: [
                                      BoxShadow(
                                        color: RiveAppTheme.secondaryYellow
                                            .withOpacity(0.3),
                                        blurRadius: 20,
                                        spreadRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: RiveAppTheme.getGlassColor(
                                        context,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      radius: 57,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          _selectedImage != null
                                              ? FileImage(_selectedImage!)
                                              : null,
                                      child:
                                          _selectedImage == null
                                              ? FoodIcons(
                                                icon: RestaurantIcons.chef,
                                                size: 40,
                                                color:
                                                    RiveAppTheme
                                                        .secondaryYellow,
                                              )
                                              : null,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              GlassButton(
                                text: 'Change Photo',
                                icon: Icons.camera_alt_outlined,
                                onPressed: _showImageSourceDialog,
                                backgroundColor: RiveAppTheme.secondaryYellow
                                    .withOpacity(0.2),
                                height: 45,
                                borderRadius: 12,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Profile Information Fields
                        _buildGlassField(
                          icon: RestaurantIcons.chef,
                          label: 'Name',
                          controller: _nameController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Name is required';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 16),

                        _buildGlassField(
                          icon: Icons.phone_outlined,
                          label: 'Phone Number',
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Phone number is required';
                            }
                            if (!RegExp(r'^\+?[\d\s-()]+$').hasMatch(value)) {
                              return 'Invalid phone number format';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 16),

                        _buildGlassField(
                          icon: Icons.location_on_outlined,
                          label: 'Location',
                          controller: _locationController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Location is required';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 16),

                        _buildGlassField(
                          icon: Icons.email_outlined,
                          label: 'Email',
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Email is required';
                            }
                            if (!RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            ).hasMatch(value)) {
                              return 'Invalid email format';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 32),

                        // Action Buttons
                        GlassButton(
                          text: 'Save Changes',
                          onPressed: _isLoading ? null : _saveChanges,
                          width: double.infinity,
                          height: 56,
                          isLoading: _isLoading,
                          icon: RestaurantIcons.chef,
                        ),

                        const SizedBox(height: 16),

                        GlassButton(
                          text: 'Logout',
                          onPressed: () => Navigator.pop(context),
                          width: double.infinity,
                          height: 56,
                          backgroundColor: RiveAppTheme.accentOrange
                              .withOpacity(0.2),
                          icon: Icons.logout,
                        ),

                        const SizedBox(height: 24),
                      ],
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

  Widget _buildGlassField({
    required IconData icon,
    required String label,
    required TextEditingController controller,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  RiveAppTheme.secondaryYellow.withOpacity(0.3),
                  RiveAppTheme.accentOrange.withOpacity(0.2),
                ],
              ),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: RiveAppTheme.secondaryYellow.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Icon(icon, color: RiveAppTheme.secondaryYellow, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: RiveAppTheme.getCaptionStyle(context).copyWith(
                    color: RiveAppTheme.secondaryYellow,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: controller,
                  keyboardType: keyboardType,
                  validator: validator,
                  style: RiveAppTheme.getBodyStyle(
                    context,
                  ).copyWith(fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    errorStyle: TextStyle(
                      color: RiveAppTheme.accentOrange,
                      fontSize: 12,
                      fontFamily: "Inter",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
