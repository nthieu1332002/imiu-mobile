import 'package:flutter/material.dart';
import 'package:imiu_mobile/views/screens/auth/login_screen.dart';
import 'package:imiu_mobile/widgets/custom_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
            const Text.rich(
              TextSpan(
                text: 'Tạo tài khoản với ',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
                children: [
                  TextSpan(
                    text: 'IMiU',
                    style: TextStyle(
                      color: Color(0xFF0CBF1E),
                    ),
                  ),
                  TextSpan(
                    text: ' nào🥰',
                  ),
                ],
              ),
            ),
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
                text: 'Đăng ký',
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
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
              child: const Text('Đã có tài khoản? Đăng nhập ngay',
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
