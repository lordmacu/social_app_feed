
class Profile {
  List<String> _photos;
  String _name;
  String _bio;
  int _indexPhoto=0;

  String get latestMessage => _latestMessage;

  set latestMessage(String value) {
    _latestMessage = value;
  }

  int _direction=0;
  int _showphoto=0;
  String _description;
  int _id;
  String _latestMessage;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  int _age=22;

  @override
  String toString() {
    return 'Profile{_photos: $_photos, _name: $_name, _bio: $_bio, _indexPhoto: $_indexPhoto, _direction: $_direction, _showphoto: $_showphoto, _description: $_description, _age: $_age, likeMe: $likeMe}';
  }

  int get age => _age;

  set age(int value) {
    _age = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  List<String> likeMe;

  int get showphoto => _showphoto;

  set showphoto(int value) {
    _showphoto = value;
  }

  int get direction => _direction;

  set direction(int value) {
    _direction = value;
  }

  int get indexPhoto => _indexPhoto;

  set indexPhoto(int value) {
    _indexPhoto = value;
  }

  List<String> get photos => _photos;

  set photos(List<String> value) {
    _photos = value;
  }

  String get name => _name;

  String get bio => _bio;

  set bio(String value) {
    _bio = value;
  }

  set name(String value) {
    _name = value;
  }

}