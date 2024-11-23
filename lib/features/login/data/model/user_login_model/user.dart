import 'package:equatable/equatable.dart';

class User extends Equatable {
	final String? email;
	final String? password;

	const User({this.email, this.password});

	factory User.fromJson(Map<String, dynamic> json) => User(
				email: json['email'] as String?,
				password: json['password'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'email': email,
				'password': password,
			};

	@override
	List<Object?> get props => [email, password];
}
