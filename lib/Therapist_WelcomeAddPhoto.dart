import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'Therapist_AccConfirmation.dart';
import 'package:path_provider/path_provider.dart';


class WelcomeAddPhotoScreen extends StatefulWidget {
  final int? doctorId;
  const WelcomeAddPhotoScreen({super.key, this.doctorId});

  @override
  _WelcomeAddPhotoScreenState createState() => _WelcomeAddPhotoScreenState();
}

class _WelcomeAddPhotoScreenState extends State<WelcomeAddPhotoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _doctorIdController = TextEditingController();
  final _passwordController = TextEditingController();
  File? _image;
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _doctorIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();

    if (widget.doctorId == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Missing doctor ID! Please log in again."),
            backgroundColor: Colors.red,
          ),
        );
        Navigator.pop(context); // or Navigator.pushReplacement if redirecting to login
      });
    }
  }

  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: ${e.toString()}')),
      );
    }
  }


  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      if (_image == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please add your photo')),
        );
        return;
      }

      setState(() => _isLoading = true);

      try {
        // Get app documents directory
        final appDir = await getApplicationDocumentsDirectory();

        // Create a new path with the same file name
        final fileName = _image!.path.split('/').last;
        final savedImagePath = '${appDir.path}/$fileName';

        // Copy the picked file to the permanent location
        final savedImage = await _image!.copy(savedImagePath);

        // Open Hive box (make sure you opened it in main())
        var box = Hive.box('myBox'); // use consistent box name!

        // Save the permanent image path to Hive
        await box.put('profile_photo_path', savedImage.path);

        // Wait for 1 second (optional)
        await Future.delayed(const Duration(seconds: 1));

        setState(() => _isLoading = false);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TherapistAccconfirmation()),
        );
      } catch (e) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save image: $e')),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/image3.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Profile Photo
          Positioned(
            top: screenHeight * 0.041,
            right: screenWidth * 0.2,
            child: GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: 148,
                height: 167,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: ClipOval(
                  child:
                      _image == null
                          ? Image.asset(
                            "Assets/Therapist_Add_Photo.png",
                            width: 148,
                            height: 151,
                            fit: BoxFit.cover,
                          )
                          : Image.file(
                            _image!,
                            width: 148,
                            height: 151,
                            fit: BoxFit.cover,
                          ),
                ),
              ),
            ),
          ),

          // Greeting Text
          const Positioned(
            top: 270,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Hi Doctor!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Montserrat",
                ),
              ),
            ),
          ),

          // Form Content
          Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: screenHeight * 0.3),

                    // Doctor ID Field
                    // _buildInputField(
                    //   label: "Doctor ID",
                    //   controller: _doctorIdController,
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please enter your Doctor ID';
                    //     }
                    //     return null;
                    //   },
                    // ),

                    if (widget.doctorId != null)
                      Center(child: Text("Welcome, Doctor ID is: ${widget.doctorId}",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff01709A),
                          fontFamily: "Montserrat",
                        ),
                      )),

                    SizedBox(height: 15),

                    // Password Field
                    _buildPasswordField(
                      label: "Password",
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),

                    // Photo Requirement Reminder
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "Assets/Checkbox/on.png",
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "You must add photo",
                            style: TextStyle(
                              color: Color(0xFFFF0004),
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Sign In Button
                    SizedBox(
                      width: 250,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: const Color(0xFF01709A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(47),
                          ),
                        ),
                        onPressed: _isLoading ? null : _submitForm,
                        child:
                            _isLoading
                                ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                : const Text(
                                  "Sign In",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFFFFFFFF),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Other Sign In Options
                    // const Text(
                    //   "Other sign in options",
                    //   style: TextStyle(
                    //     color: Color(0xFFFFFFFF),
                    //     fontFamily: "Montserrat",
                    //     fontSize: 16,
                    //   ),
                    // ),
                    // const SizedBox(height: 20),

                    // Social Media Icons
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     _buildSocialIcon("Assets/Google.png"),
                    //     const SizedBox(width: 20),
                    //     _buildSocialIcon("Assets/Apple.png"),
                    //     const SizedBox(width: 20),
                    //     _buildSocialIcon("Assets/Facebook.png"),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFFDAE7EB),
              fontFamily: "Montserrat",
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFDAE7EB),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFFDAE7EB),
              fontFamily: "Montserrat",
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            controller: controller,
            obscureText: _obscurePassword,
            validator: validator,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFDAE7EB),
              hintText: ".........",
              hintStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: const Color(0xFF01709A),
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return GestureDetector(
      onTap: () {
        // Handle social media sign in
      },
      child: Image.asset(assetPath, width: 39, height: 39),
    );
  }
}
