# android studio template
android studio template

一个android studio 的代码template库

模板的使用
	
	下载相应模板拷入android studio的如下路径中，然后重启studio
	 /plugins/android/lib/templates/activities

目前支持的template：

1. RefreshLayout Activity.
	使用前提：项目使用FastAndroid开发框架。该模板会生成具有上拉刷新，下来加载功能的Activity类以及Layout文件，生成完会将Activity自动加入到AndroidManifest文件中。

	在Activity 中已经生成view查找的代码、recycleview，adapter，Refreshlayout，data相关绑定的代码，用户只用实现TODO标记的地方,完

	成item项的布局以及处理网络请求即可。

	此外，支持一些可选，比如，支持是否生成Adapter以及item布局文件，支持是否生成使用androidannotations的代码，是否支持上拉加载更多，是否使用toolbar等。
	
	一览：
	![RefreshActivityTempalte](http://oav23hfp9.bkt.clouddn.com/16-7-25/10576456.jpg)



原理介绍篇参考：

	http://blog.csdn.net/lmj623565791/article/details/51635533
	http://robusttechhouse.com/tutorial-how-to-create-custom-android-code-templates/