import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test/test.dart';
import 'package:wasteagram/models/post.dart';

void main() {
  test('Post created from map should have appropriate property values', () {
    final date = DateTime.parse('2020-01-01');
    Timestamp timestamp = Timestamp.fromDate(date);
    const url = 'fakeurl.com';
    const quantity = 1;
    const latitude = 1.0;
    const longitude = 2.0;

    final mockPost = Post.fromMap({
      'date': timestamp,
      'imageURL': url,
      'quantity': quantity,
      'latitude': latitude,
      'longitude': longitude
    });

    expect(mockPost.date, date);
    expect(mockPost.imageURL, url);
    expect(mockPost.quantity, quantity);
    expect(mockPost.latitude, latitude);
    expect(mockPost.longitude, longitude);
  });

  test('Post create from map missing data should use default values', () {
    final date = Post.defaultDate;
    const url = '';
    const quantity = 0;
    const latitude = 0.0;
    const longitude = 0.0;

    final mockPost = Post.fromMap({});

    expect(mockPost.date, date);
    expect(mockPost.imageURL, url);
    expect(mockPost.quantity, quantity);
    expect(mockPost.latitude, latitude);
    expect(mockPost.longitude, longitude);
  });
}
