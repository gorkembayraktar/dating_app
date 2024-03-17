import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String name;
  final int age;
  final String gender;
  final List<String> interests;
  final List<String> imageUrls;
  final String bio;
  final String jobTitle;
  final String location;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.imageUrls,
    required this.interests,
    required this.bio,
    required this.jobTitle,
    required this.location,
  });

  @override
  List<Object?> get props =>
      [id, name, age, gender, imageUrls, interests, bio, jobTitle, location];

  static User fromSnapshot(DocumentSnapshot snap) {
    print(snap);
    User user = User(
        id: snap.id,
        name: snap.get('name'),
        age: snap.get('age'),
        gender: snap.get('gender'),
        imageUrls: snap.get('imageUrls')!.cast<String>() as List<String>,
        interests: snap.get('interests')!.cast<String>()
            as List<String>, // snap.get('interests'),
        bio: snap.get('bio'),
        jobTitle: snap.get('jobTitle'),
        location: snap.get('location'));

    return user;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'gender': gender,
      'imageUrls': imageUrls,
      'interests': interests,
      'bio': bio,
      'jobTitle': jobTitle,
      'location': location
    };
  }

  User copyWith({
    String? id,
    String? name,
    int? age,
    String? gender,
    List<String>? imageUrls,
    List<String>? interests,
    String? bio,
    String? jobTitle,
    String? location,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      imageUrls: imageUrls ?? this.imageUrls,
      interests: interests ?? this.interests,
      bio: bio ?? this.bio,
      jobTitle: jobTitle ?? this.jobTitle,
      location: location ?? this.location,
    );
  }

  static List<User> users = [
    User(
        id: '1',
        name: 'Anna',
        age: 26,
        gender: 'Kadın',
        interests: ['Müzik', 'Doğa Yürüyüşü', 'Siyaset'],
        imageUrls: [
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://plus.unsplash.com/premium_photo-1686244745070-44e350da9d37?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
              'https://plus.unsplash.com/premium_photo-1686244745026-98fc15ad3400?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://plus.unsplash.com/premium_photo-1661543038302-e6da2933e921?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
        ],
        jobTitle: 'Job title',
        location: 'İstanbul',
        bio:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley'),
    User(
        id: '2',
        name: 'Tamara',
        age: 23,
        gender: 'Kadın',
        interests: ['Müzik', 'Doğa Yürüyüşü', 'Siyaset'],
        imageUrls: [
          'https://plus.unsplash.com/premium_photo-1661543038302-e6da2933e921?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://plus.unsplash.com/premium_photo-1686244745070-44e350da9d37?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
        ],
        jobTitle: 'Job title',
        bio: 'Lorem ipsum sit amet',
        location: 'İzmir'),
    User(
        id: '3',
        name: 'Katarina',
        age: 28,
        gender: 'Kadın',
        interests: ['Müzik', 'Doğa Yürüyüşü', 'Siyaset'],
        imageUrls: [
          'https://plus.unsplash.com/premium_photo-1686244745026-98fc15ad3400?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://plus.unsplash.com/premium_photo-1686244745070-44e350da9d37?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
              'https://plus.unsplash.com/premium_photo-1686244745026-98fc15ad3400?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://plus.unsplash.com/premium_photo-1661543038302-e6da2933e921?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
        ],
        jobTitle: 'Job title',
        bio: 'Lorem ipsum sit amet',
        location: 'Aydın'),
    User(
        id: '4',
        name: 'Cesus',
        age: 33,
        interests: ['Müzik', 'Doğa Yürüyüşü', 'Siyaset'],
        imageUrls: [
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://plus.unsplash.com/premium_photo-1686244745070-44e350da9d37?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
              'https://plus.unsplash.com/premium_photo-1686244745026-98fc15ad3400?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://plus.unsplash.com/premium_photo-1661543038302-e6da2933e921?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
        ],
        jobTitle: 'Job title',
        bio: 'Lorem ipsum sit amet',
        gender: 'Kadın',
        location: 'Muğla'),
    User(
        id: '5',
        name: 'Arya',
        age: 25,
        gender: 'Kadın',
        interests: ['Müzik', 'Doğa Yürüyüşü', 'Siyaset'],
        imageUrls: [
          'https://plus.unsplash.com/premium_photo-1661543038302-e6da2933e921?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://plus.unsplash.com/premium_photo-1686244745070-44e350da9d37?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
              'https://plus.unsplash.com/premium_photo-1686244745026-98fc15ad3400?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ],
        jobTitle: 'Job title',
        bio: 'Lorem ipsum sit amet',
        location: 'Antalya'),
    User(
        id: '6',
        name: 'Phie',
        age: 20,
        gender: 'Kadın',
        interests: ['Müzik', 'Doğa Yürüyüşü', 'Siyaset'],
        imageUrls: [
          'https://plus.unsplash.com/premium_photo-1661543038302-e6da2933e921?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://plus.unsplash.com/premium_photo-1686244745070-44e350da9d37?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
              'https://plus.unsplash.com/premium_photo-1686244745026-98fc15ad3400?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ],
        jobTitle: 'Job title',
        bio: 'Lorem ipsum sit amet',
        location: 'Manisa'),
  ];
}
