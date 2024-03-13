import 'package:equatable/equatable.dart';

class User extends Equatable{
    final int id;
    final String name;
    final int age;
    final List<String> interests;
    final List<String> imageUrls;
    final String bio;
    final String jobTitle;

    User({
      required this.id,
      required this.name,
      required this.age,
      required this.imageUrls,
      required this.interests,
      required this.bio,
      required this.jobTitle,
    });

    @override
    List<Object?> get props => [id, name, age, imageUrls, bio, jobTitle];

    static List<User> users = [
        User(
          id: 1,
          name: 'Anna',
          age: 26,
          interests: ['Müzik', 'Doğa Yürüyüşü', 'Siyaset'],
          imageUrls: [
              'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              'https://plus.unsplash.com/premium_photo-1686244745070-44e350da9d37?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
              'https://plus.unsplash.com/premium_photo-1686244745026-98fc15ad3400?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              'https://plus.unsplash.com/premium_photo-1661543038302-e6da2933e921?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
          ],
          jobTitle: 'Job title',
          bio: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley'
        ),
      User(
          id: 2,
          name: 'Tamara',
          age: 23,
          interests: ['Müzik', 'Doğa Yürüyüşü', 'Siyaset'],
          imageUrls: [
            'https://plus.unsplash.com/premium_photo-1661543038302-e6da2933e921?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            'https://plus.unsplash.com/premium_photo-1686244745070-44e350da9d37?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
          ],
          jobTitle: 'Job title',
          bio: 'Lorem ipsum sit amet'
      ),
      User(
          id: 3,
          name: 'Katarina',
          age: 28,
          interests: ['Müzik', 'Doğa Yürüyüşü', 'Siyaset'],
          imageUrls: [
            'https://plus.unsplash.com/premium_photo-1686244745026-98fc15ad3400?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            'https://plus.unsplash.com/premium_photo-1686244745070-44e350da9d37?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
                'https://plus.unsplash.com/premium_photo-1686244745026-98fc15ad3400?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            'https://plus.unsplash.com/premium_photo-1661543038302-e6da2933e921?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
          ],
          jobTitle: 'Job title',
          bio: 'Lorem ipsum sit amet'
      ),
      User(
          id: 4,
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
          bio: 'Lorem ipsum sit amet'
      ),
      User(
          id: 5,
          name: 'Arya',
          age: 25,
          interests: ['Müzik', 'Doğa Yürüyüşü', 'Siyaset'],
          imageUrls: [
            'https://plus.unsplash.com/premium_photo-1661543038302-e6da2933e921?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            'https://plus.unsplash.com/premium_photo-1686244745070-44e350da9d37?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
                'https://plus.unsplash.com/premium_photo-1686244745026-98fc15ad3400?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

          ],
          jobTitle: 'Job title',
          bio: 'Lorem ipsum sit amet'
      ),
      User(
          id: 6,
          name: 'Phie',
          age: 20,
          interests: ['Müzik', 'Doğa Yürüyüşü', 'Siyaset'],
          imageUrls: [
            'https://plus.unsplash.com/premium_photo-1661543038302-e6da2933e921?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            'https://plus.unsplash.com/premium_photo-1686244745070-44e350da9d37?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
            'https://plus.unsplash.com/premium_photo-1686244745026-98fc15ad3400?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

          ],
          jobTitle: 'Job title',
          bio: 'Lorem ipsum sit amet'
      ),
    ];
}