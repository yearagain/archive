[toc]

## 更新日志

2021.1.31 项目已经停止更新，POE版本变动较大，项目仅供思路参考

2020.3.31	基于腾讯3.1000.12.1重新制作	更新原因：部分地图无法正常显示

## 说明

POE的补丁用法都是一样的，如果你没用过任何补丁可以参考17173上A大的补丁

该补丁和A大的功能补丁没有任何冲突

更新版本后如果没有更新地图相关的内容 补丁是不会出现问题的 如果出现问题请联系我 我将尽可能的更新

# 免责声明

如果因为修改了程序文件导致的封号，或因补丁导致的程序崩溃造成门票损失皆与作者无关

# Optimized POE  Patch

# 流放之路性能优化补丁

~~基于腾讯版本3.1000.8.1(S11第一个版本)制作，理论上可维持整个赛季，但也有可能出现意外~~

应用补丁前一定要备份备份备份，重要的事情说三遍 使用方法和功能补丁一样

推荐使用VPatchGGPK图形工具，自己去论坛扒扒就有

- 屏蔽阴影
- 屏蔽阴影和传统fog
- 屏蔽阴影和传统fog+屏蔽地图天气
- 屏蔽怪物尸体
- 仅屏蔽天气

注意：天气，fog，阴影类型的补丁是互斥的，你打了三重效果再打二重那么三重的就失效了

## 屏蔽阴影

Metadata检索

"shadows_enabled": true to "shadows_enabled": false

"use_forced_screenspace_shadows": true to "use_forced_screenspace_shadows": false

Shaders\ScreenspaceShadows.hlsl 屏蔽代码

## 屏蔽传统fog

Metadata检索

"exp_fog_is_enabled": true to "exp_fog_is_enabled": false

"linear_fog_is_enabled": true to "linear_fog_is_enabled": false

## 屏蔽地图内天气

Metadata检索

"player_environment_ao" to "wao_nil"

"global_particle_effect" to "wpet_nil"

## 屏蔽尸体

该补丁对于腾讯版本是高度风险的，如果你的配置不是过低请尽量不要使用该补丁

修改了程序流程

