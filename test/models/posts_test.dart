import 'package:test/test.dart';
import 'package:wasteagram/models/post.dart';
import 'package:wasteagram/models/posts.dart';

void main() {
  final postA = Post(
      date: DateTime.parse('2020-01-01'),
      imageURL: 'fakeurl1.com',
      quantity: 5,
      latitude: 1.0,
      longitude: 1.0);
  final postB = Post(
      date: DateTime.parse('2020-02-01'),
      imageURL: 'fakeurl2.com',
      quantity: 1,
      latitude: 2.0,
      longitude: 2.0);
  final mockPosts = Posts([postA, postB]);

  test('Posts are returned in chronological order', () {
    expect([postB, postA], mockPosts.posts);
  });

  test('Posts returns the total number of posts', () {
    expect(2, mockPosts.numberOfPosts);
  });

  test('Posts returns the total waste of all posts', () {
    expect(6, mockPosts.totalWaste);
  });
}
