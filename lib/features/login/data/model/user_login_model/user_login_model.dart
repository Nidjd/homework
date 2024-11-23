import 'package:equatable/equatable.dart';

import 'user.dart';

class UserLoginModel extends Equatable {
	final User? user;
	final String? token;

	const UserLoginModel({this.user, this.token});

	factory UserLoginModel.fromJson(Map<String, dynamic> json) {
		return UserLoginModel(
			user: json['user'] == null
						? null
						: User.fromJson(json['user'] as Map<String, dynamic>),
			token: json['Token'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'user': user?.toJson(),
				'Token': token,
			};

	@override
	List<Object?> get props => [user, token];
}
