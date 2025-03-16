import 'package:flutter/material.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _PatientSignInScreenState();
}

class _PatientSignInScreenState extends State<WelcomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;
  bool _rememberMe = false; // Added for Remember Me functionality
  
  // Constants for colors
  final Color _primaryColor = const Color(0xFF01709A);
  final Color _textColor = const Color(0xFFDAE7EB);
  final Color _whiteColor = const Color(0xFFFFFFFF);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() {
    if (_formKey.currentState!.validate()) {
      // Simulate loading
      setState(() {
        _isLoading = true;
      });
      
      // Simulate authentication delay
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
          
          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Sign in successful!')),
          );
          
          // Navigate to home screen (replace with your actual navigation)
          // Navigator.pushReplacementNamed(context, '/home');
        }
      });
    }
  }
  
  void _signInWithSocialMedia(String provider) {
    setState(() {
      _isLoading = true;
    });
    
    // Simulate authentication delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign in with $provider successful!')),
        );
        
        // Navigate to home screen (replace with your actual navigation)
        // Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double horizontalPadding = screenWidth * 0.13;
    
    TextStyle labelStyle = TextStyle(
      color: _whiteColor,
      fontSize: 15,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background image
            Container(
              width: screenWidth,
              height: screenHeight,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/welcome.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.35),
              child: Column(
                children: [
                  // Title
                  Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                    child: Text(
                      "Hi, Welcome!",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: _whiteColor,
                      ),
                    ),
                  ),

                  // Form
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Email field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 60, bottom: 5),
                              child: Text("Email", style: labelStyle),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                              child: TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: _textColor,
                                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                  
                        // Password field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 60, bottom: 5),
                              child: Text("Password", style: labelStyle),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                              child: TextFormField(
                                controller: _passwordController,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: _textColor,
                                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide.none,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                      color: _primaryColor,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                  
                        // Remember Me and Forgot Password row
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Remember Me checkbox
                              Row(
                                children: [
                                  SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Checkbox(
                                      value: _rememberMe,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _rememberMe = value ?? false;
                                        });
                                      },
                                      activeColor: _primaryColor,
                                      checkColor: _whiteColor,
                                      side: BorderSide(color: _whiteColor),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _rememberMe = !_rememberMe;
                                      });
                                    },
                                    child: Text(
                                      'Remember me',
                                      style: TextStyle(
                                        color: _whiteColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              
                              // Forgot Password
                              TextButton(
                                onPressed: () {
                                  // Navigate to forgot password screen
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(50, 30),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: _whiteColor,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height:30),
                  
                        // Sign In button
                        _isLoading
                            ? CircularProgressIndicator(color: _whiteColor)
                            : ElevatedButton(
                                onPressed: _signIn,
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: screenWidth * 0.13,
                                  ),
                                  backgroundColor: _primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: _whiteColor,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                
                  const SizedBox(height: 40),
                    
                  
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: _textColor,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Or continue with",
                            style: TextStyle(
                              color: _textColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: _textColor,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 10),
                  
                  // Social sign in buttons
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Google sign in
                        _socialSignInButton(
                          onPressed: () => _signInWithSocialMedia('Google'),
                          iconPath: 'assets/images/google.png',
                          backgroundColor: Colors.white,
                        ),
                        
                        // Facebook sign in
                        _socialSignInButton(
                          onPressed: () => _signInWithSocialMedia('Facebook'),
                          iconPath: 'assets/images/facebook.png',
                          backgroundColor: Color.fromARGB(255, 231, 231, 231),
                        ),
                        
                        // Apple sign in
                        _socialSignInButton(
                          onPressed: () => _signInWithSocialMedia('Apple'),
                          iconPath: 'assets/images/apple.png',
                          backgroundColor: const Color.fromARGB(255, 241, 241, 241),
                        ),
                      ],
                    ),
                  ),
                  
                  // Add some padding at the bottom for better scrolling experience
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _socialSignInButton({
    required VoidCallback onPressed,
    required String iconPath,
    required Color backgroundColor,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            iconPath,
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}
