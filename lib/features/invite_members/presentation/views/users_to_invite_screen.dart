import 'package:final_project/core/utils/service_locator.dart';
import 'package:final_project/core/utils/shared_pref.dart';
import 'package:final_project/core/widgets/custom_error_widget.dart';
import 'package:final_project/core/widgets/custom_progress_indicator.dart';
import 'package:final_project/features/invite_members/data/repository/get_users_to_invite_repository/get_users_to_invite_repo_impl.dart';
import 'package:final_project/features/invite_members/data/repository/invite_members_repository/invite_members_repo_impl.dart';
import 'package:final_project/features/invite_members/presentation/manager/get_users_to_invite_cubit/get_users_to_invite_cubit.dart';
import 'package:final_project/features/invite_members/presentation/manager/invite_members_cubit/invite_members_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersToInviteScreen extends StatefulWidget {
  final int id;

  const UsersToInviteScreen({super.key, required this.id});

  @override
  State<UsersToInviteScreen> createState() => _UsersToInviteScreenState();
}

class _UsersToInviteScreenState extends State<UsersToInviteScreen> {
  final List<int> selectedIds = [];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetUsersToInviteCubit(
            getIt.get<GetUsersToInviteRepoImpl>(),
          )..getUsersToInvite(
              token: prefs.getString('token')!,
              id: widget.id,
            ),
        ),
        BlocProvider(
          create: (context) => InviteMembersCubit(
            getIt.get<InviteMembersRepoImpl>(),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Select Users to Invite'),
          actions: [
            BlocListener<InviteMembersCubit, InviteMembersState>(
              listener: (context, state) {
                if (state is InviteMembersSuccess) {
                  // عند نجاح العملية، إظهار رسالة نجاح
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Success: ${state.message}'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else if (state is InviteMembersFailure) {
                  // إظهار رسالة فشل عند حدوث خطأ
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error: ${state.errMessage}'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: BlocBuilder<InviteMembersCubit, InviteMembersState>(
                builder: (context, state) {
                  if (state is InviteMembersLoading) {
                    // عرض مؤشر التحميل أثناء العملية
                    return const CustomProgressIndicator();
                  } else {
                    // إظهار زر الـ "Check" عند عدم وجود تحميل
                    return IconButton(
                      icon: const Icon(Icons.check),
                      onPressed: () {
                        // استدعاء الكيوبت لإرسال البيانات
                        context.read<InviteMembersCubit>().invite(
                              membersIds: selectedIds,
                              groupId: widget.id,
                              token: prefs.getString('token')!,
                            );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
        body: BlocBuilder<GetUsersToInviteCubit, GetUsersToInviteState>(
          builder: (context, state) {
            if (state is GetUsersToInviteSuccess) {
              return ListView.builder(
                itemCount: state.getUsersToInviteModel.user?.length ?? 0,
                itemBuilder: (context, index) {
                  final user = state.getUsersToInviteModel.user![index];
                  final isSelected = selectedIds.contains(user.id);

                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(user.id.toString()),
                      ),
                      title: Text(user.name.toString()),
                      subtitle: Text(user.email.toString()),
                      selected: isSelected,
                      selectedTileColor: Colors.lightBlue.shade50,
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedIds.remove(user.id);
                          } else {
                            selectedIds.add(user.id!);
                          }
                        });
                        print(selectedIds);
                      },
                      trailing: isSelected
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : const Icon(Icons.circle_outlined),
                    ),
                  );
                },
              );
            } else if (state is GetUsersToInviteFailure) {
              return ErrorWidgetWithRetry(errorMessage: state.errMessage);
            } else {
              return const CustomProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
