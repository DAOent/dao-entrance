import 'dart:async';
import 'dart:ui';
import 'package:dtim/application/store/app/org.dart';
import 'package:dtim/application/store/chain_ctx.dart';
import 'package:dtim/domain/utils/functions.dart';
import 'package:dtim/domain/utils/platform_infos.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dtim/domain/utils/theme.dart';
import 'package:dtim/infra/router/router.dart';
import 'package:dtim/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dtim/infra/components/components.dart';
import 'package:dtim/infra/components/sider_bar.dart';
import 'package:dtim/application/store/app/app.dart';
import 'package:dtim/application/service/apis/apis.dart';
import 'package:dtim/domain/models/models.dart';
import 'package:dtim/application/store/theme.dart';

@RoutePage(name: "pcRoute")
class PCPage extends StatefulWidget {
  const PCPage({
    super.key,
  });

  @override
  State<PCPage> createState() => _PCPageState();
}

const url = ["im", "gov", "work", "integrate"];

class _PCPageState extends State<PCPage> {
  final StreamController<int> currentId = StreamController<int>();
  List<AccountOrg>? aorgs;
  late AppCubit im;
  double rightWidth = 200.w;
  String rightUrl = "";
  Uri? avatar;
  List<OrgApp> apps = [];

  final mainPages = [
    const OrgRoute(),
    const IntegrateRoute(),
    const WebviewRoute(),
  ];

  @override
  void initState() {
    super.initState();
    im = context.read<AppCubit>();
    currentId.add(url.indexOf(context.router.currentPath.replaceAll("/app/", "")));
    getData();
    final org = context.read<OrgCubit>();
    org.stream.listen((event) async {
      await getData();
    });
  }

  getData() async {
    final accountOrgApi = await AccountOrgApi.create();
    final os = await (await AccountOrgApi.create()).listByAccount(im.me!.address);
    if (mounted) {
      setState(() {
        aorgs = os;
      });
    }
    if (im.currentState != null) {
      var u = await im.currentState!.client.getAvatarUrl(im.currentState!.client.userID ?? "");
      AccountOrg? org = accountOrgApi.getOrg(im.me!.address, im.currentState!.org.nodeHash);
      if (org != null) {
        // apps = org.apps ?? [];
      }
      if (mounted) {
        setState(() {
          avatar = u;
        });
      }

      chainCtx.setOrg(im.currentState!.org, im.me!);
      chainCtx.connectChain(() async {
        apps = trans(await chainCtx.client.query.weTEEOrg.orgApps(BigInt.tryParse(im.currentState!.org.nodeId)!));
        await accountOrgApi.saveApp(im.me!.address, im.currentState!.org.nodeHash, apps);
        if (mounted) {
          setState(() {});
        }
      });
    }
  }

  @override
  void dispose() {
    printDebug("PCPage dispose");
    super.dispose();
  }

  onSelect(index) {
    currentId.add(index);
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final iconbg = constTheme.sidebarText.withOpacity(0.08);
    final iconbt = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(iconbg),
      foregroundColor: MaterialStateProperty.all(constTheme.sidebarText),
      // elevation: MaterialStateProperty.all(24),
      elevation: MaterialStateProperty.all<double>(0),
      shape: MaterialStateProperty.all(
        const CircleBorder(),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AutoTabsRouter.pageView(
        routes: mainPages,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        builder: (context, child, _) {
          if (im.currentState == null) {
            return Center(child: CircularProgressIndicator.adaptive(strokeWidth: 4.w));
          }
          final pageRouter = AutoTabsRouter.of(context);
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              moveWindow(
                SizedBox(
                  width: 55.w,
                  height: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (PlatformInfos.isMacOS) SizedBox(height: 20.w),
                      SizedBox(height: 16.w),
                      // 用户
                      SizedBox(
                        width: 32.w,
                        height: 32.w,
                        child: MePop(
                          im.me!.address,
                          im.me!.name ?? "-",
                          mxContent: avatar,
                          true,
                          32.w,
                          bg: iconbg,
                          color: constTheme.sidebarText,
                        ),
                      ),
                      SizedBox(height: 13.w),
                      ElevatedButton(
                        onPressed: () {
                          printDebug("discover and join");
                          context.router.pushNamed("/select_org?t=back").then((value) {
                            getData();
                          });
                        },
                        style: iconbt,
                        child: SizedBox(
                          width: 32.w,
                          height: 32.w,
                          child: Center(
                            child: Icon(
                              AppIcons.search,
                              size: 18.w,
                              color: constTheme.sidebarText,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 13.w),
                      ElevatedButton(
                        onPressed: () {
                          printDebug("discover and join");
                          context.router.pushNamed("/select_org?t=back").then((value) {
                            getData();
                          });
                        },
                        style: iconbt,
                        child: SizedBox(
                          width: 32.w,
                          height: 32.w,
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 18.w,
                              color: constTheme.sidebarText,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 13.w),
                      Flexible(
                        child: StreamBuilder(
                          stream: currentId.stream,
                          builder: (BuildContext context, AsyncSnapshot<int> id) {
                            return Column(
                              children: [
                                SiderBarItem(
                                  "Chat",
                                  icon: AppIcons.chat,
                                  key: const Key("Chat"),
                                  selected: id.data == 0,
                                  bg: iconbg,
                                  onTap: () {
                                    pageRouter.setActiveIndex(0);
                                    onSelect(0);
                                  },
                                ),
                                for (var app in apps)
                                  SiderBarItem(
                                    app.name ?? "",
                                    img: app.icon,
                                    key: Key("app_${app.hash}"),
                                    selected: id.data == app.appId! + 1,
                                    bg: iconbg,
                                    onTap: () {
                                      if (app.appId! < 2) {
                                        pageRouter.setActiveIndex(app.appId! + 1);
                                        onSelect(app.appId! + 1);
                                      }
                                    },
                                  ),
                                // DAO管理
                                // SiderBarItem(
                                //   "Apps",
                                //   icon: AppIcons.shujujicheng,
                                //   key: const Key("Integrate"),
                                //   selected: id.data == 3,
                                //   onTap: () {
                                //     pageRouter.setActiveIndex(3);
                                //     onSelect(3);
                                //   },
                                // ),
                                // DAO管理
                                // SiderBarItem(
                                //   "Dapps",
                                //   icon: AppIcons.shujujicheng,
                                //   key: const Key("Dapps"),
                                //   selected: id.data == 4,
                                //   onTap: () {
                                //     pageRouter.setActiveIndex(4);
                                //     onSelect(4);
                                //   },
                                // ),
                              ],
                            );
                          },
                        ),
                      ),
                      // IconButton(
                      //   tooltip: "discover and join",
                      //   onPressed: () {
                      //     printDebug("discover and join");
                      //     context.router.pushNamed("/select_org?t=back").then((value) {
                      //       getData();
                      //     });
                      //   },
                      //   icon: SizedBox(
                      //     width: 36.w,
                      //     height: 36.w,
                      //     child: Center(
                      //       child: Icon(
                      //         AppIcons.discoverfill,
                      //         size: 23.w,
                      //         color: constTheme.sidebarText,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //   width: 6.w,
                      //   height: 4.w,
                      //   margin: EdgeInsets.only(top: 0.w, bottom: 5.w),
                      //   decoration: BoxDecoration(
                      //     color: constTheme.sidebarText,
                      //     borderRadius: BorderRadius.circular(2.w),
                      //   ),
                      // ),
                      if (aorgs != null)
                        for (var i = 0; i < aorgs!.length; i++)
                          GestureDetector(
                            onTap: () async {
                              if (im.currentState!.org.nodeId == aorgs![i].nodeId) {
                                return;
                              }
                              if (im.sign == "") {
                                if (!await im.login(im.me!)) {
                                  return;
                                }
                              }
                              // ignore: use_build_context_synchronously
                              final org = globalCtx().read<OrgCubit>();
                              org.setChannelId("");
                              await waitFutureLoading(
                                context: globalCtx(),
                                future: () async {
                                  im.currentState!.client.dispose(closeDatabase: false);
                                  await im.connect(aorgs![i]);
                                  im.setCurrent(aorgs![i]);
                                },
                              );
                              await loadThemeFromOrg(aorgs![i]);
                              pageRouter.setActiveIndex(0);
                              onSelect(0);
                              await getData();
                            },
                            child: Container(
                              width: im.currentState!.org.nodeId == aorgs![i].nodeId ? 40.w : 42.w,
                              height: im.currentState!.org.nodeId == aorgs![i].nodeId ? 40.w : 42.w,
                              padding: im.currentState!.org.nodeId == aorgs![i].nodeId ? EdgeInsets.all(2.w) : null,
                              margin: EdgeInsets.fromLTRB(0, 10.w, 0, 0),
                              decoration: BoxDecoration(
                                color: constTheme.sidebarHeaderTextColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8.w),
                                border: Border.all(
                                  color: im.currentState!.org.nodeId == aorgs![i].nodeId
                                      ? constTheme.sidebarTextActiveBorder.withOpacity(0.7)
                                      : constTheme.sidebarBg,
                                  width: 2.w,
                                ),
                              ),
                              child: Container(
                                width: im.currentState!.org.nodeId == aorgs![i].nodeId ? 36.w : 42.w,
                                height: im.currentState!.org.nodeId == aorgs![i].nodeId ? 36.w : 42.w,
                                decoration: BoxDecoration(
                                  color: aorgs![i].nodeColor != null
                                      ? hexToColor(aorgs![i].nodeColor!)
                                      : constTheme.sidebarText.withOpacity(0.02),
                                  borderRadius: BorderRadius.circular(4.w),
                                ),
                                child: aorgs![i].nodeAvater == null
                                    ? Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          if (aorgs![i].nodeAvater == null)
                                            Text(
                                              aorgs![i].nodeName ?? "",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: constTheme.sidebarHeaderTextColor.withOpacity(0.8),
                                                fontSize: 14.w,
                                              ),
                                            ),
                                        ],
                                      )
                                    : Center(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(6.w),
                                          child: Image.network(
                                            fit: BoxFit.cover,
                                            aorgs![i].nodeAvater!,
                                            width: im.currentState!.org.nodeId == aorgs![i].nodeId ? 36.w : 42.w,
                                            height: im.currentState!.org.nodeId == aorgs![i].nodeId ? 36.w : 42.w,
                                            loadingBuilder:
                                                (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                              if (loadingProgress == null) return child;
                                              return Center(
                                                child: Text(
                                                  aorgs![i].nodeName != null ? aorgs![i].nodeName![0] : "-",
                                                  style: TextStyle(fontSize: 16.w, color: constTheme.sidebarText),
                                                ),
                                              );
                                            },
                                            errorBuilder:
                                                (BuildContext context, Object exception, StackTrace? stackTrace) {
                                              return Center(
                                                child: Text(
                                                  aorgs![i].nodeName != null ? aorgs![i].nodeName![0] : "-",
                                                  style: TextStyle(fontSize: 16.w, color: constTheme.sidebarText),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                      SizedBox(height: 10.w),
                    ],
                  ),
                ),
              ),
              Flexible(child: child),
              // Flexible(child: CefView())
              // GestureDetector(
              //   child: MouseRegion(
              //     cursor: SystemMouseCursors.resizeColumn,
              //     child: SizedBox(
              //       width: 1.w,
              //       height: double.infinity,
              //       child: Container(color: constTheme.sidebarText.withOpacity(0.08)),
              //     ),
              //   ),
              //   onPanUpdate: (details) {
              //     setState(() {
              //       if (rightWidth - details.delta.dx < 180.w || rightWidth - details.delta.dx > 350.w) {
              //         return;
              //       }
              //       rightWidth = rightWidth - details.delta.dx;
              //     });
              //   },
              // ),
              // if (rightUrl != "") Container(width: rightWidth, height: double.maxFinite, color: Colors.red),
            ],
          );
        },
      ),
    );
  }
}
