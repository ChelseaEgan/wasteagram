import 'package:intl/intl.dart';

class Post {
  final DateTime _date;
  final String _imageURL;
  final int _quantity;
  final double _latitude;
  final double _longitude;
  static final DateTime _defaultDate = DateTime.parse('1970-01-01');

  const Post({date, imageURL, quantity, latitude, longitude})
      : _date = date,
        _imageURL = imageURL,
        _quantity = quantity,
        _latitude = latitude,
        _longitude = longitude;

  Post.fromMap(Map<String, dynamic> snapshot)
      : _date = snapshot['date']?.toDate() ?? _defaultDate,
        _imageURL = snapshot['imageURL'] ?? '',
        _quantity = snapshot['quantity'] ?? 0,
        _latitude = snapshot['latitude'] ?? 0.0,
        _longitude = snapshot['longitude'] ?? 0.0;

  String get formattedDate => DateFormat('MMMM d, y').format(_date);
  DateTime get date => _date;
  static DateTime get defaultDate => _defaultDate;
  String get imageURL => _imageURL;
  int get quantity => _quantity;
  double get latitude => _latitude;
  double get longitude => _longitude;
}
