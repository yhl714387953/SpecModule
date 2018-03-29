# ―――  PodFile 中的写法可以如下 ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

#source 'https://github.com/CocoaPods/Specs.git'
#source 'https://github.com/yhl714387953/privatePodSpec.git'

#platform :ios, '10.0'

#忽略所有警告
#inhibit_all_warnings!

#use_frameworks! #build phases 里会成.framework  默认是 .a
#网络请求，放在模块的spec文件里    inhibit_warnings：忽略警告
#pod 'AFNetworking', '~> 3.1.0', :inhibit_warnings => true

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


#
#  Be sure to run `pod spec lint JSPatchModule.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "ZuiyeModule"
  s.version      = "1.0.0"
  s.summary      = "测试资源文件，png、 xib、 bundle、 a、 framework"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
                      测试资源文件
                   DESC

  s.homepage     = "www.zuiye.com"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "yuhailong" => "714387953@qq.com" }
  # Or just: s.author    = "yuhailong"
  # s.authors            = { "yuhailong" => "714387953@qq.com" }
  # s.social_media_url   = "http://twitter.com/yuhailong"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  s.platform     = :ios
  s.platform     = :ios, "8.0"
  # deployment_target或者s.platform不开启，那在使用的时候会有arc问题(后续podspec文件中设置只支持arc)
  # 比如__weak不能使用
  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

# source的写法可以参照下面的写法
#pod 'VenderName', :git => 'https://github.com/zuiye/ZuiyeSDK.git', :tag => '0.7.0'
#pod 'VenderName', :git => 'https://github.com/zuiye/ZuiyeSDK.git', :branch => 'develop'
#pod 'VenderName', :git => 'https://github.com/zuiye/ZuiyeSDK.git', :commit => '082f8319af'
# 当引用本地的时候这个参数就没有用了
  s.source       = { :git => "local" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #
  # 所有需要引用的文件都要添加进来 /**/表示所有文件夹 *.{文件后缀}代表所有符合后缀名的文件
  s.source_files  = "Classes", "Classes/**/*.{h,m,mm}", "Resources/**/*.{h,m}"
  #s.exclude_files = "Classes/Exclude"

  #s.public_header_files = "Classes/Adapter.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  ="Classes/View/JSTableView.xib"
  #s.resource  = ['Classes/**/*.png','Classes/View/*.xib']

  # png,xib,bundle 等必须当资源文件去添加  framework,a不能加进去，否则包的体积就包含了整个.a文件了
  s.resources  = 'Resources/**/*.{png,xib,bundle,xcassets}', 'Classes/**/*.{png,xib,bundle,xcassets}'
  # s.resources = "Resources/*.png"

# framework 要加preserve_paths 预加载路径
  s.preserve_paths = "Resources/**/*.{framework,a}"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  #s.framework  = 'JavaScriptCore'
  s.frameworks = 'SystemConfiguration','CoreGraphics','CoreTelephony','Security','CoreLocation','JavaScriptCore'
  
  # s.library   = 'z'
  s.libraries =  'iconv','sqlite3','stdc++','z','stdc++'

  s.vendored_libraries  = 'Resources/lib/**/*.{a}','Classes/**/*.{a}'
  s.vendored_frameworks = 'Resources/Framework/**/*.{framework}'

  # ――― Linking 相关参数说明―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  # s.libraries  表示这个pod依赖的 苹果官方的库，也就是类似libstdc++.a ,libsqlite.a 等等的a文件；
  # s.vendored_libraries 就表示用户自己的a文件，比如新浪微博SDK的libWeiboSDK.a ；
  # s.frameworks 表示pod依赖的 苹果的framework， 比如 UIKit，SystemConfiguration等等
  # s.vendored_frameworks， 表示pod依赖的自己的framework，比如QQSDK的TencentOpenAPI.framework;
  # .a 或者 libz.tbd 后缀不要，名字里lib开头的三个字母不要，libz.tbd 应写成 'z'

  # ――― Linking 相关参数说明 ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  s.requires_arc = true

  #s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SRCROOT)/usr/include/libxml2" }
  #s.xcconfig = { 'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/xxx/xxx"' }
  #s.xcconfig = { "FRAMEWORK_SEARCH_PATHS" => "Resources/Framework" }
  # s.dependency "JSONKit", "~> 1.4"

  #这里用来指定预编译的配置
  #s.prefix_header_contents = 'Classes/**/*.{pch}'

#网络请求
s.dependency 'AFNetworking', '~> 3.2.0'

#模型转换
#s.dependency 'MJExtension', '~> 3.0.13'

#本地数据存储
#s.dependency 'GYDataCenter', '~> 0.1.1'

#图片加载
s.dependency 'SDWebImage'

#下拉刷新
#s.dependency 'MJRefresh', '~> 3.1.12'

#键盘处理
#s.dependency 'IQKeyboardManager', '~> 4.0.8'

#仿头条多控制器滑动
#s.dependency 'WMPageController', '~> 1.9.9'

#仿QQ侧滑
#s.dependency 'YRSideViewController', '~> 1.0.6'

#空视图处理
s.dependency 'DZNEmptyDataSet', '~> 1.8.1'

#视图布局
s.dependency 'Masonry', '~> 1.0.2'

#提示
#s.dependency 'JGProgressHUD', '~> 1.4'

#轮播
#s.dependency 'SDCycleScrollView', '~> 1.65'

#全局滑动返回
#s.dependency 'FDFullscreenPopGesture', '~> 1.1'

#提示框
#s.dependency 'MMPopupView', '~> 1.7.2'

#照片浏览器
#s.dependency 'PhotoBrowser', '~> 0.3.2'

#富文本label
#s.dependency 'MLEmojiLabel', '~> 1.0.2'

#弹出菜单
#s.dependency 'XHPopMenu'

#照片选择器
#s.dependency 'TZImagePickerController'

#组件通信
#pod 'CTMediator', '~> 0.0.3'

#文字提示
#pod 'LSMessageHUD'



  

end
