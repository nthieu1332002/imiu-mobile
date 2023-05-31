import 'package:flutter/material.dart';
import 'package:imiu_mobile/views/screens/auth/register_screen.dart';
import 'package:imiu_mobile/widgets/custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/images/logo-imiu.png'),
            const SizedBox(
              height: 50,
            ),
            const Text('Welcome back!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                )),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Email",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Mật khẩu",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomButton(
                text: 'Đăng nhập',
                onPressed: () => print('Login'),
              ),
            ),
            // child: ElevatedButton(
            //     onPressed: () => print('Login'),
            //     style: ElevatedButton.styleFrom(
            //       fixedSize: const Size(200, 50),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //     ),
            //     child: const Text('Đăng nhập',
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 18,
            //             fontWeight: FontWeight.bold)))),
            const SizedBox(
              height: 10,
            ),
            const Text('Hoặc',
                style: TextStyle(
                  color: Color(0xFF7B868C),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.google, color: Colors.black),
                label: const Text('Đăng nhập với Google',
                    style: TextStyle(
                      color: Colors.black,
                    )),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // change the button color here
                  minimumSize: Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RegisterScreen();
                }));
              },
              child: const Text('Chưa có tài khoản? Đăng ký ngay',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
