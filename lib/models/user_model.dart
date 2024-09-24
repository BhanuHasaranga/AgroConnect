import 'dart:convert';

class User {
  final String username;
  final String email;
  final List<String>? occupations; // Multiple occupations
  final int? mainOccupationIndex;  // Index of the main occupation in the occupations list
  final String? profilePicture;
  final String? bio; // Self-description
  final String? city;
  final String? state;
  final String? country;
  final DateTime? dateOfBirth;
  final List<String>? interests; // Limit to 10 interests
  final String? phone;
  final bool isVerified;
  final List<String>? bookmarkedNewsPosts;
  final List<String>? bookmarkedQuestionPosts;

  User({
    required this.username,
    required this.email,
    this.occupations,
    this.mainOccupationIndex, // The main occupation is determined by index
    this.profilePicture,
    this.bio,
    this.city,
    this.state,
    this.country,
    this.dateOfBirth,
    this.interests,
    this.phone,
    this.isVerified = false,
    this.bookmarkedNewsPosts,
    this.bookmarkedQuestionPosts,
  });

  User copyWith({
    String? username,
    String? email,
    List<String>? occupations,
    int? mainOccupationIndex, // Copy the index of main occupation
    String? profilePicture,
    String? bio,
    String? city,
    String? state,
    String? country,
    DateTime? dateOfBirth,
    List<String>? interests,
    String? phone,
    bool? isVerified,
    List<String>? bookmarkedNewsPosts,
    List<String>? bookmarkedQuestionPosts,
  }) {
    return User(
      username: username ?? this.username,
      email: email ?? this.email,
      occupations: occupations ?? this.occupations,
      mainOccupationIndex: mainOccupationIndex ?? this.mainOccupationIndex,
      profilePicture: profilePicture ?? this.profilePicture,
      bio: bio ?? this.bio,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      interests: interests ?? this.interests,
      phone: phone ?? this.phone,
      isVerified: isVerified ?? this.isVerified,
      bookmarkedNewsPosts: bookmarkedNewsPosts ?? this.bookmarkedNewsPosts,
      bookmarkedQuestionPosts: bookmarkedQuestionPosts ?? this.bookmarkedQuestionPosts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'occupations': occupations,
      'mainOccupationIndex': mainOccupationIndex,
      'profilePicture': profilePicture,
      'bio': bio,
      'city': city,
      'state': state,
      'country': country,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'interests': interests,
      'phone': phone,
      'isVerified': isVerified,
      'bookmarkedNewsPosts': bookmarkedNewsPosts,
      'bookmarkedQuestionPosts': bookmarkedQuestionPosts,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      occupations: List<String>.from(map['occupations'] ?? []),
      mainOccupationIndex: map['mainOccupationIndex'],
      profilePicture: map['profilePicture'],
      bio: map['bio'],
      city: map['city'],
      state: map['state'],
      country: map['country'],
      dateOfBirth: map['dateOfBirth'] != null ? DateTime.parse(map['dateOfBirth']) : null,
      interests: List<String>.from(map['interests'] ?? []),
      phone: map['phone'],
      isVerified: map['isVerified'] ?? false,
      bookmarkedNewsPosts: List<String>.from(map['bookmarkedNewsPosts'] ?? []),
      bookmarkedQuestionPosts: List<String>.from(map['bookmarkedQuestionPosts'] ?? []),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(username: $username, email: $email, occupations: $occupations, mainOccupationIndex: $mainOccupationIndex, profilePicture: $profilePicture, bio: $bio, city: $city, state: $state, country: $country, dateOfBirth: $dateOfBirth, interests: $interests, phone: $phone, isVerified: $isVerified, bookmarkedNewsPosts: $bookmarkedNewsPosts, bookmarkedQuestionPosts: $bookmarkedQuestionPosts)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.username == username &&
        other.email == email &&
        other.occupations == occupations &&
        other.mainOccupationIndex == mainOccupationIndex &&
        other.profilePicture == profilePicture &&
        other.bio == bio &&
        other.city == city &&
        other.state == state &&
        other.country == country &&
        other.dateOfBirth == dateOfBirth &&
        other.interests == interests &&
        other.phone == phone &&
        other.isVerified == isVerified &&
        other.bookmarkedNewsPosts == bookmarkedNewsPosts &&
        other.bookmarkedQuestionPosts == bookmarkedQuestionPosts;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        email.hashCode ^
        occupations.hashCode ^
        mainOccupationIndex.hashCode ^
        profilePicture.hashCode ^
        bio.hashCode ^
        city.hashCode ^
        state.hashCode ^
        country.hashCode ^
        dateOfBirth.hashCode ^
        interests.hashCode ^
        phone.hashCode ^
        isVerified.hashCode ^
        bookmarkedNewsPosts.hashCode ^
        bookmarkedQuestionPosts.hashCode;
  }
}
