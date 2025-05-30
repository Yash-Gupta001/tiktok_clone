import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentPage extends StatelessWidget {
  CommentPage({super.key});


  final TextEditingController commentController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage: NetworkImage('profile photo'),
                      ),
                      title: Row(
                        children: [
                          Text(
                            "username",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          Text(
                            "comment description",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      subtitle: Row(
                        children: [
                          Text(
                            'date',
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10.0.w),
                          Text(
                            '10 likes',
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      trailing: InkWell(
                        onTap: () {

                        },
                        child: Icon(
                          Icons.favorite,
                          size: 25.0.sp,
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Divider(),
              ListTile(
                title: TextFormField(
                  controller: commentController,
                  style: TextStyle(
                    fontSize: 16.0.sp,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Comment',
                    labelStyle: TextStyle(
                      fontSize: 20.0.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red
                      )
                    ),
                  ),
                ),
                trailing: TextButton(onPressed: () {
                  
                },
                child: Text(
                  "Send",
                  style: TextStyle(
                    fontSize: 16.0.sp,
                    color: Colors.white
                  ),
                  )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
