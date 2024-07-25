class UserProfile {
  String id;
  String firstName;
  String lastName;
  int age;
  String email;
  // String profilePictureUrl;

  UserProfile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.email,
    // required this.profilePictureUrl,
  });

  factory UserProfile.fromMap(Map<String, dynamic> data, String documentId) {
    return UserProfile(
      id: documentId,
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      age: data['age'] ?? 0,
      email: data['email'] ?? '',
      // profilePictureUrl: data['profilePictureUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'email': email,
      // 'profilePictureUrl': profilePictureUrl,
    };
  }
}