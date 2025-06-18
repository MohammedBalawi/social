import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/app_config.dart';
import 'package:marrige_app/config/extensions/is_arabic_extension.dart';
import 'package:marrige_app/controller/base_tab/myList/iblockedhim_cubit.dart';
import 'package:marrige_app/libs/debug_it.dart';
import 'package:marrige_app/libs/lang/localization_helper.dart';
import 'package:marrige_app/models/structure/tab_bar/mylist/iblockedhim_response.dart';
import 'package:marrige_app/models/structure/tab_bar/mylist/iblockedhimstate.dart';


class IblockedhimScreen extends StatefulWidget {
  /// لنحفظ الحالة عند التحريك بين التابات الداخلية ونحفظ كلشي ولانطلبه كل مرة يعيد انشاءه
  @override
  _iblockedhimScreenState createState() => _iblockedhimScreenState();
}

class _iblockedhimScreenState extends  State<IblockedhimScreen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  String _tag =  "IblockedhimScreen";
  final ScrollController _scrollController = ScrollController();
  IBlockedHimCubit cubit = IBlockedHimCubit();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(()  async{
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
           DebugIT.printLog(_tag, "load more date ");
          //await cubit.LoadDataAPI();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<IBlockedHimCubit, IBlockedHimState>(
        builder: (context, state) {
          if (state.members.isEmpty) {
            return
              Visibility(
                  visible: state.noData,
              child :Center(
              child: Text(
                AppLocalizations.of(context)!.tr('favlist_empty'),
                style: TextStyle(
                  fontSize: 18,
                  color: _isDarkMode
                      ? AppColors.blockedUsersEmptyMessageTextDark
                      : AppColors.blockedUsersEmptyMessageTextLight,
                ),
              ),
            ));
          }
          return _buildMembersList(context, state.members, _isDarkMode);
        },
      ),
    );
  }

  Widget _buildMembersList(
      BuildContext context, List<IblockedHimData> members, bool isDark) {

    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 100),
      itemCount: members.length + 1,
      separatorBuilder: (_, __) => const SizedBox(height: 2),
      itemBuilder: (context, index) {
        if (index == 0) return _buildTableHeader(isDark,context);
        final member = members[index - 1];
        return _buildMemberRow(member, context, isDark);
      },
    );
  }

  Widget _buildTableHeader(bool isDark , BuildContext context) {
    final ap = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.blockedUsersHeaderDark
            : AppColors.blockedUsersHeaderLight,
        borderRadius: BorderRadius.circular(8),
      ),
      child:  Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(ap.tr("username_list"),
                  style:  Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.surfaceLight,
                  ),
                  textAlign: TextAlign.center)

          ),
          Expanded( flex: 1,child: Text(ap.tr("block_date"),
              style:  Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.surfaceLight,
              ),
              textAlign: TextAlign.center)),
          Expanded( flex: 1,child: Text(ap.tr("cancel_block"),
              style:  Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.surfaceLight,
              ),
              textAlign: TextAlign.center)),
        ],
      ),
    );
  }


  Widget _buildMemberRow(
      IblockedHimData member, BuildContext context, bool isDark) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.blockedUsersRowBackgroundDark
            : AppColors.blockedUsersRowBackgroundLight,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark
              ? AppColors.blockedUsersRowBorderDark
              : AppColors.blockedUsersRowBorderLight,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextButton(
              onPressed: () => {},
              child: Text(
                member.userName!,
                textAlign: TextAlign.center,
                style:  Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontFamily: member.userName!.isArabic ? AppConfig.arDefaultFont : null,
                  color: AppColors.blockedUsersUserNameText,
                  ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              member.addDate!,
              textAlign: TextAlign.center,
              style:  Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isDark
                    ? AppColors.blockedUsersDateTextDark
                    : AppColors.blockedUsersDateTextLight,
              ),

            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              icon: Icon(Icons.close,
                  size: 20, color: AppColors.blockedUsersDeleteIcon),
              onPressed: () => {//cubit.DeleteFromList(member.bandedID!)
                 },
            ),
          ),
        ],
      ),
    );
  }
}
