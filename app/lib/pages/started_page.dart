import 'package:app/components/button.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
 class GetStartedPage extends StatelessWidget{
   const GetStartedPage ({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit:BoxFit.fill,
                  image:AssetImage(
                    'assets/images/intro.png'
                  )
              )
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),

          Padding(
            padding:const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40
            ),
            child:Column(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child:Image.asset('assets/images/logo.png')
                ),
                Spacer(),
                Text(
                  'Thưởng thức âm nhạc cùng tụi mình nhé !!!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18
                  ),
                ),
                const SizedBox(height: 21,),
                const Text(
                  'Sản phẩm DEMO của group AMBITIOUS KIDS COMP, '
                      ' gồm 4 founders Phan Khải Điền,Trần Lê Anh Kiệt,Trần Văn Tín,Nguyễn Hồng Quang ',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                      fontSize: 13
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20,),
                BasicAppButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => const HomePage()
                          )
                      );
                    },
                    title:'BẮT ĐẦU',
                    color: Colors.green,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
 }
