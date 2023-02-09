import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count =0;

  void decrement() {
    setState((){
      count--;
    });


    print(count);
  }




  void increment() {
    setState((){
      count++;
    });
    print(count);
  }

  bool get isEmpty => count ==0;
  bool get isFull => count ==20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                colorFilter:  ColorFilter.mode(Colors.white, BlendMode.colorBurn),
                image: AssetImage('assets/images/bakeryImage.jpg'),
                fit:BoxFit.cover,


              )
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                  isFull ? 'Lotado':'Pode entrar',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  )),
              Padding(
                padding: EdgeInsets.all(32),
                child:  Text(
                    count.toString(),
                    style: TextStyle(
                      fontSize: 100,
                      color: isFull ? Colors.red :  Colors.white,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: isEmpty ? null : decrement,
                    style: TextButton.styleFrom(
                        backgroundColor: isEmpty ? Colors.white.withOpacity(0.2) :Colors.white,
                        padding: const EdgeInsets.all(32),
                        primary: Colors.black,
                        fixedSize: const Size(120, 100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        )
                    ),
                    child: const Text(
                      'Saiu',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 32,),
                  TextButton(
                    onPressed: isFull ? null : increment,
                    style: TextButton.styleFrom(
                      backgroundColor: isFull ? Colors.white.withOpacity(0.2) :Colors.white,
                      padding: const EdgeInsets.all(32),
                      primary:Colors.black,
                      fixedSize: const Size(120, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Entrou',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
      ),
    );
  }

}



