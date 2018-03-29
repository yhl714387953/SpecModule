# 使用cocoapods定义自己的组件模块



**在命令行里输命令太麻烦，把命令放到脚本里，clone下来后直接双击 `customShell` 即可。**

具体项目什么结构可clone下来瞅瞅，如有不妥之处望指正。肯定有的，还不少~

---
在PodFile中需要找到对应的 `podspec` 文件，的写法如下：

```
pod 'ZuiyeModule', :path => 'Modules/ZuiyeModule'
```

`PodFile ` 所在的路径可不写，直接同目录接着往里找到 `ZuiyeModule.podspec` 即可。


[COCOAPODS官网](https://guides.cocoapods.org/making/making-a-cocoapod.html)
更多使用方式详见官网。

---

**Git资源**
这里我们根据资源的存放位置分为三种：
> * public server (比如gitHub，谁都能看到)
> * private server (自己的git服务器了，自己和管理员能看见)
> * local (存在本地磁盘的一个角落里，自己偷着看)


**spec文件参数配置**

我们看一下都需要配置哪些参数，没加#注释的都是必要的字段

***

```
s.name         = "ZuiyeModule"
s.version      = "0.0.1"
s.summary      = "A short description of ZuiyeModule."

```

name、version、summary这个比较直观哈
***

```
  s.description  = <<-DESC
                   DESC
```
 
描述，在**DESC**中间写，比如

```
 s.description  = <<-DESC
		  这个是我测试的，这个模块主要实现自定义功能
                   DESC
```
***

```
s.homepage     = "http://EXAMPLE/ZuiyeModule"
```

主页么，没要求，随便写，但也别太随便了，最好是当前模块在git的主页（如果你是本地的pod类库，那这个也没有用）

***

```
 s.license      = "MIT (example)"
```
 
 如果你在gitHub上创建项目这个是必选的
 
 
 ```
  s.license      = "MIT"
 ```
 ***
 
 ```
 s.author             = { "yuhailong" => "714387953@qq.com" }
 ```
 
 作者： 嘴爷
 ***
 
 ```
  # s.platform     = :ios, "8.0"
 ```
 
 平台：IOS 	最低版本：8.0
 ***

 
 ```
 # deployment_target或者s.platform不开启，那在使用的时候会有arc问题(后续podspec文件中设置只支持arc)
  # 比如__weak不能使用
  
  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"
  
 ```
 
 部署版本
 
  deployment_target或者s.platform不开启，那在使用的时候会有arc问题(后续podspec文件中设置只支持arc) 比如__weak不能使用， 
  设置了 **s.platform** 后，这个可以不用管
 
 ***
 
 ```
 s.source       = { :git => "http://EXAMPLE/ZuiyeModule.git", :tag => "#{s.version}" }
 ```

资源的git 地址，四种写法，喜欢哪种随意

```
# source的写法可以参照下面的写法
#pod 'VenderName', :git => 'https://github.com/zuiye/ZuiyeSDK.git', :tag => '0.7.0'
#pod 'VenderName', :git => 'https://github.com/zuiye/ZuiyeSDK.git', :branch => 'develop'
#pod 'VenderName', :git => 'https://github.com/zuiye/ZuiyeSDK.git', :commit => '082f8319af'
# 当引用本地的时候这个参数就没有用了
  s.source       = { :git => "local" }
```

***

```
s.source_files  = "Classes", "Classes/**/*.{h,m}"
```

代码文件，**Classes** 文件夹，/\*\*/表示文件夹下的所有文件和文件夹， *.{h,m,mm} 表匹配该文件夹下的所有.h .m .mm文件，多个文件路径用逗号分开

```
# 所有需要引用的文件都要添加进来 /**/表示所有文件夹 *.{文件后缀}代表所有符合后缀名的文件
  s.source_files  = "Classes", "Classes/**/*.{h,m,mm}", "Resources/**/*.{h,m,mm}"
```
***

```
# s.resource  = "icon.png"
  # s.resources = "Resources/*.png"
```
资源文件，我理解的是除了代码之外的所有文件.asset .a .framework. .xib .storyboard等等

```
# png,xib,bundle 等必须当资源文件去添加  framework,a 不能引用，否则打包之后体积将包含该整个a文件
  s.resource  = 'Resources/**/*.{png,xib,bundle,xcassets}'
  # s.resources = "Resources/*.png"

```

当然我们在写代码的时候也不方便去吧xib跟关联的类分开，所以我们可以把资源文件跟类文件放一起，把 **Resources** 文件夹换成  **Classes** 文件夹就好了


```
s.resource  = 'Classes/**/*.{png,xib,bundle,xcassets}'

```


***

```
# s.preserve_paths = "FilesToSave", "MoreFilesToSave"
```

framework要加preserve_paths 预加载路径

```
# framework要加preserve_paths 预加载路径
  s.preserve_paths = "Resources/**/*.{framework,a}"
```

***

```
# s.framework  = "SomeFramework"
# s.frameworks = "SomeFramework", "AnotherFramework"

# s.library   = "iconv"
# s.libraries = "iconv", "xml2"
```

以上要注意多个framework或者library用逗号分开就行，这个是系统的，如果是三方的framework 或者 library呢

```
# ――― Linking 相关参数说明―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  # s.libraries  表示这个pod依赖的 苹果官方的库，也就是类似libstdc++.a ,libsqlite.a 等等的a文件；
  # s.vendored_libraries 就表示用户自己的a文件，比如新浪微博SDK的libWeiboSDK.a, 微信libWeChatSDK.a；
  # s.frameworks 表示pod依赖的 苹果的framework， 比如 UIKit，SystemConfiguration等等
  # s.vendored_frameworks， 表示pod依赖的自己的framework，比如QQSDK的TencentOpenAPI.framework，JSPatch热更新JSPatchPlatform.framework;
  # .a 或者 libz.tbd 后缀不要，名字里lib开头的三个字母不要，libz.tbd 应写成 'z'

# ――― Linking 相关参数说明 ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
```

针对本模块的写法示例

```
 # s.library   = 'z'
  s.libraries =  'iconv','sqlite3','stdc++','z'

  s.vendored_libraries  = 'Resources/lib/**/*.{a}'
  s.vendored_frameworks = 'Resources/Framework/**/*.{framework}'
```

***

```
# s.requires_arc = true
```
ARC

***

```
#s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SRCROOT)/usr/include/libxml2" }
#s.xcconfig = { 'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/xxx/xxx"' }
#s.xcconfig = { "FRAMEWORK_SEARCH_PATHS" => "Resources/Framework" }
```
这个配制想必大家在没用pod的时候，引入三方的时候，多多少少都要改点

***

```
# s.dependency "JSONKit", "~> 1.4"
```

依赖，可以依赖本地写法就好比podFile中的写法，多个依赖，那就多写几行

```
s.dependency "JSONKit", "~> 1.4"
s.dependency 'BaseModel', :path => 'BaseProject/BaseModel'
```
**因为有依赖了，所以AFNetworking、SDWebImage什么的可以不用写的podFile里了**


###podFile中的写法

```
# ―――  PodFile 中的写法可以如下 ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#组件通信  如果提交到spec仓库，并审核通过
#pod 'CTMediator', '~> 0.0.3'

# 以下所有的spec文件都没有提交到spec仓库
#首页   代码在git上
#pod 'EHomePage', :git =>  'https://github.com/yhl714387953/EHomePage.git'

#首页使用本地代码   git上有相关的代码  这里用的绝对路径，不建议，可仿如下用相对路径
#pod 'EHomePage', :podspec => '~/Desktop/EHomePage/EHomePage.podspec'

#首页使用本地代码  代码只在本地了，文件路径可以直接简写成PodFile所在文件夹之后的路径
#pod 'BaseModel', :path => 'BaseProject/BaseModel'
# ―――  PodFile 中的写法可以如上 ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

```

我们podspec写完了，执行下

```
pod update --no-repo-update
```

当三方的选定了之后就没必要每次都更新pod 索引了，所以我们加上 `--no-repo-update` ，这样只更新本地的，执行速度会很快。