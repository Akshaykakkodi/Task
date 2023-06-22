import 'package:flutter/material.dart';
import 'package:task/components/snackbar.dart';
import 'package:task/services/comments.dart';
import 'package:task/services/post_comments.dart';

class CommentBox extends StatefulWidget {
  var index;

  var title;

  var onCommentAdded;


   CommentBox({Key? key,required this.index,required this.title,required this.onCommentAdded}) : super(key: key);

  @override
  State<CommentBox> createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  TextEditingController commentController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0,left: 18,right: 18),
      child: Container(
        height: 50,
        decoration:  BoxDecoration(
          color: Colors.blueGrey[50],
          border: Border.all(width: 0.7),
          borderRadius: BorderRadius.circular(10)
        ),
        child:  Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 20,
                child: CircleAvatar(
                  radius: 15,
                ),
              ),
            ),
            
             Expanded(child: Text(widget.title.toString())),
            widget.index==Comments.comments.length-1?

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async{
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Container(
                            height: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Type below"),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: commentController,
                                  decoration: InputDecoration(
                                    hintText: "Comment",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)
                                    )
                                  ),
                                )
                              ],
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  PostComments.postData(commentController.text).then((_) {
                                         widget.onCommentAdded();
                                        Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      Snack_bar.snackBar
                                  );
                                }); },
                                      style:ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith((states) => Colors.deepPurple)
                            ),
                                

                          child: const Text("Add",style: TextStyle(color: Colors.white),),),],
                        );
                      },
                  );
                },
                  child: const Icon(Icons.add)),
            ):
                const Icon(Icons.done)

          ],
        ),
      ),
    );
  }
}
