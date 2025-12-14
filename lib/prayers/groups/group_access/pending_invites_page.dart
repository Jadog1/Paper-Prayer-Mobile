import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/account_permissions_model.dart';
import 'package:prayer_ml/prayers/groups/repos/pending_invites_repo.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';
import 'package:intl/intl.dart';

class PendingInvitesPage extends ConsumerWidget {
  const PendingInvitesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = paginatedPendingInvitesNotifierProvider(10);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Group Invites'),
        backgroundColor: const Color(0xFF8B7355),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: PagingHelperView(
          provider: provider,
          futureRefreshable: provider.future,
          notifierRefreshable: provider.notifier,
          contentBuilder: (data, widgetCount, endItemView) {
            if (data.items.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.inbox_outlined,
                      size: 80,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No pending invites',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'You\'ll see group invitations here',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: widgetCount,
              itemBuilder: (context, index) {
                if (index == widgetCount - 1) {
                  return endItemView;
                }
                final invite = data.items[index];
                return PendingInviteCard(
                  invite: invite,
                  onAccept: () async {
                    try {
                      await ref
                          .read(acceptInviteProvider(invite.groupId).future);
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('✓ Joined ${invite.groupName}'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Failed to accept invite: $e'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  },
                  onReject: () async {
                    try {
                      await ref
                          .read(rejectInviteProvider(invite.groupId).future);
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                '✓ Rejected invite to ${invite.groupName}'),
                            backgroundColor: Colors.orange,
                          ),
                        );
                      }
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Failed to reject invite: $e'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class PendingInviteCard extends StatelessWidget {
  final PendingInvite invite;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const PendingInviteCard({
    super.key,
    required this.invite,
    required this.onAccept,
    required this.onReject,
  });

  String _formatDate(String isoDate) {
    try {
      final date = DateTime.parse(isoDate);
      return DateFormat('MMM d, y').format(date);
    } catch (e) {
      return isoDate;
    }
  }

  String _getRoleLabel(int role) {
    switch (role) {
      case 1:
        return 'Owner';
      case 2:
        return 'Leader';
      case 3:
        return 'Member';
      default:
        return 'Role $role';
    }
  }

  @override
  Widget build(BuildContext context) {
    final expiresAt = _formatDate(invite.expiresAt);
    final createdAt = _formatDate(invite.createdAt);
    final roleLabel = _getRoleLabel(invite.role);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: const Color(0xFF8B7355).withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF8B7355).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.groups,
                    color: Color(0xFF8B7355),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        invite.groupName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF8B7355)
                                  .withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              roleLabel,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF8B7355),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_outline,
                          size: 16, color: Colors.grey[700]),
                      const SizedBox(width: 8),
                      Text(
                        'Invited by ${invite.invitedByName}',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.calendar_today,
                          size: 16, color: Colors.grey[700]),
                      const SizedBox(width: 8),
                      Text(
                        'Invited on $createdAt',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.access_time,
                          size: 16, color: Colors.orange[700]),
                      const SizedBox(width: 8),
                      Text(
                        'Expires on $expiresAt',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.orange[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onAccept,
                    icon: const Icon(Icons.check_circle, size: 18),
                    label: const Text(
                      'Accept',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onReject,
                    icon: const Icon(Icons.cancel, size: 18),
                    label: const Text(
                      'Reject',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
