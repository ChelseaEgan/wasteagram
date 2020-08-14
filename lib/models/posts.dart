import 'package:cloud_firestore/cloud_firestore.dart';
import 'post.dart';

class Posts {
  final List<Post> _posts;

  const Posts(List<Post> posts) : _posts = posts;

  Posts.fromSnapshot(List<DocumentSnapshot> snapshot)
      : this._posts =
            snapshot.map((post) => new Post.fromMap(post.data)).toList();

  List<Post> get posts => getPostsSortedByDate();
  int get numberOfPosts => _posts.length;
  int get totalWaste =>
      _posts.fold(0, (previous, current) => previous + current.quantity);

  List<Post> getPostsSortedByDate() {
    _posts.sort((Post a, Post b) => b.date.compareTo(a.date));
    return _posts;
  }
}
