import 'package:flutter/material.dart';
import 'package:task/components/bottom_navigation.dart';
import 'package:task/components/comment_box.dart';
import 'package:task/services/comments.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List comments = Comments.comments;
  void addComment() {
    setState(() {
      comments; // Add the new comment to the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 220,
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width:MediaQuery.of(context).size.width ,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                      ),
                      child: const Center(
                          child: Text("Add Comment",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),)
                      ),
                    ),
                     const Center(
                      child: Image(image: AssetImage('Assets/images/ccc-removebg-preview.png'),
                        height: 130,
                        width: 200,
                        
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                 decoration: InputDecoration(
                   filled: true,
                     fillColor: Colors.blueGrey[50],
                     prefixIcon: Icon(Icons.search),
                     hintText: "Search",
                     border:OutlineInputBorder(
                       borderSide: BorderSide.none,
                       borderRadius: BorderRadius.circular(40)
                     )
                 ),
              ),
            ),
            Expanded(
              child: SizedBox(
                child:  ListView.builder(
                    itemCount: comments.length,

                    itemBuilder:(context,index) {
                      return CommentBox(index: index,title:comments[index]["title"],onCommentAdded: addComment);
                    }
                )
              ),
            )

          ],
        ),
      ),
    );
  }
}
