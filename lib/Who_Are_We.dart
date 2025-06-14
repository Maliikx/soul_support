import 'package:flutter/material.dart';
import 'Therapist_Settings.dart';
void main() {
  runApp(const who_screen());
}

class who_screen extends StatefulWidget {
  const who_screen({super.key});

  @override
  State<who_screen> createState() => _who_screenState();
}

class _who_screenState extends State<who_screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            const Image(
              image: AssetImage("Assets/Group 6878.png"),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              top: 30,
              right: 20,
              child: GestureDetector(
                onTap: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const Therapist_Settings (),
                    ),
                  );
                },
                child: const Icon(Icons.close, size: 30, color: Color(0xff374957)),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(top: 60, start: 30),
              child: Image(image: AssetImage("Assets/Group 36731.png")),
            ),
            Positioned(
              left: 7,
              right: 10,
              top: 350,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xffFFFFFF).withOpacity(0.8),
                ),
                width: 398,
                height: 650,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Meet the Minds Behind the App",
                          style: TextStyle(
                            color: Color(0xff01709A),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "We’re a team of professional programmers, dreamers, creators, and mental health advocates united by a single mission: to make mental health support more accessible, "
                          "supportive, and compassionate for everyone. Each of us brings something unique to the table, from crafting the code that powers the app to designing the spaces where you’ll find calm and connection.",
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Please Reach Us At :",
                          style: TextStyle(
                            color: Color(0xff01709A),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          "SoulSupport@example.com",
                          style: TextStyle(
                            color: Color(0xff01709A),
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xffD6E8EE).withOpacity(0.3),
                          ),
                          width: 398,
                          height: 420,
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image(
                                  image: AssetImage("Assets/user.png"),
                                  width: 70,
                                ),
                                SizedBox(
                                  width: 10,
                                ), // Added spacing to prevent overflow
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Abrar Ayman",
                                        style: TextStyle(
                                          color: Color(0xff01709A),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Say hello to Abrar, the heart and soul of Soul Support! As our creative captain,"
                                        " she wears two hats: visionary team leader and talented designer. With a knack for blending tech with a sprinkle of empathy, Abrar crafts an app that feels like a warm hug on tough days. She inspires our team to innovate and collaborate, ensuring every corner of the app is both beautiful and supportive. When she’s not steering the ship or designing calming interfaces, you can find her sipping her favorite brew at a cozy coffee shop, dreaming up new ideas to make mental health support even more accessible. "
                                        "Join us on this journey Abrar can’t wait to share it with you!",
                                        style: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 7),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xffD6E8EE).withOpacity(0.3),
                          ),
                          width: 398,
                          height: 400,
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image(
                                  image: AssetImage("Assets/user.png"),
                                  width: 70,
                                ),
                                SizedBox(
                                  width: 10,
                                ), // Added spacing to prevent overflow
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Ahmed Hytham",
                                        style: TextStyle(
                                          color: Color(0xff01709A),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Meet Ahmed, our brilliant code wizard at Soul Support! With a passion for problem-solving and a love for all things tech, Ahmed brings our app to life, crafting seamless experiences that users adore."
                                        " Known for turning coffee into code, Ahmed thrives on transforming complex challenges into elegant solutions. When not immersed in lines of code, you’ll find Ahmed jamming out to music while experimenting with new recipes in the kitchen. With Ahmed on our team, we’re confident that our app will not only function flawlessly but also feel like a trusted friend on your mental health journey!",
                                        style: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 7),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xffD6E8EE).withOpacity(0.3),
                          ),
                          width: 398,
                          height: 420,
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image(
                                  image: AssetImage("Assets/user.png"),
                                  width: 70,
                                ),
                                SizedBox(
                                  width: 10,
                                ), // Added spacing to prevent overflow
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Anas Tarek",
                                        style: TextStyle(
                                          color: Color(0xff01709A),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Say hello to Anas, our AI and cloud maestro at Soul Support! With a passion for harnessing the power of technology to enhance mental health support, Anas weaves intelligent features into our app that truly make a difference. Always on the cutting edge of innovation, Anas excels at creating solutions that are not just smart but also user-friendly,"
                                        " ensuring our community feels understood and supported. When he’s not busy building the next big feature or optimizing our cloud infrastructure, you can find Anas exploring the latest tech trends or unwinding with a good sci-fi novel. With Anas on our team, we’re excited to take mental health support to new heights!",
                                        style: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 7),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xffD6E8EE).withOpacity(0.3),
                          ),
                          width: 398,
                          height: 450,
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image(
                                  image: AssetImage("Assets/user.png"),
                                  width: 70,
                                ),
                                SizedBox(
                                  width: 10,
                                ), // Added spacing to prevent overflow
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Menna Hussien",
                                        style: TextStyle(
                                          color: Color(0xff01709A),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Say hello to Menna, our brilliant front-end coder extraordinaire at Soul Support! With a keen eye for detail and a passion for creating user-friendly interfaces, Menna transforms complex code into seamless experiences that users love."
                                        " She thrives on making every interaction smooth and engaging, ensuring that our app feels intuitive and welcoming. When she’s not busy writing code that dazzles, you can find Menna hiking in nature, capturing breathtaking views for her photography collection,"
                                        " or experimenting with the latest tech trends. With Menna on our team, Soul Support not only functions beautifully but also feels like a friend on your mental health journey!",
                                        style: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 7),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xffD6E8EE).withOpacity(0.3),
                          ),
                          width: 398,
                          height: 450,
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image(
                                  image: AssetImage("Assets/user.png"),
                                  width: 70,
                                ),
                                SizedBox(
                                  width: 10,
                                ), // Added spacing to prevent overflow
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Rana Alaa",
                                        style: TextStyle(
                                          color: Color(0xff01709A),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Introducing Rana, our creative code artisan at Soul Support! With a remarkable talent for blending innovation with functionality, Rana brings a unique flair to programming, transforming ideas into dynamic, user-friendly features. "
                                        "Her imaginative approach to problem-solving makes every challenge an opportunity to craft something extraordinary. When she’s not busy coding, you might find Noor diving into the world of digital art or exploring new coding languages, always eager to expand her horizons."
                                        " With Rana on our team, Soul Support is not just an app; it’s a vibrant space where technology and creativity come together to support mental well-being!",
                                        style: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 7),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xffD6E8EE).withOpacity(0.3),
                          ),
                          width: 398,
                          height: 650,
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image(
                                  image: AssetImage("Assets/user.png"),
                                  width: 70,
                                ),
                                SizedBox(
                                  width: 10,
                                ), // Added spacing to prevent overflow
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Sama Mohamed",
                                        style: TextStyle(
                                          color: Color(0xff01709A),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Say hello to Sama, our talented back-end wizard at Soul Support! With a knack for crafting robust and efficient systems, "
                                        "Sama is the mastermind behind the scenes, ensuring that everything runs smoothly and securely. Her passion for coding and problem-solving shines through in every line of code she writes, "
                                        "creating a solid foundation for our app. When she's not busy optimizing databases or enhancing performance, you can find Sama exploring the latest tech innovations or unwinding with a good book. With Sama on our team, Soul Support stands strong, ready to provide the reliable support our users need on their mental health journeys!",
                                        style: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
