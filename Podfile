source 'https://github.com/CocoaPods/Specs.git'
#source 'https://github.com/yhl714387953/privatePodSpec.git'

platform :ios, '10.0'

#忽略所有警告（治疗强迫症）
inhibit_all_warnings!

#use_frameworks! #build phases 里会成.framework  默认是 .a
target 'SpecModule' do

#网络请求，放在模块的spec文件里    inhibit_warnings：忽略警告
#pod 'AFNetworking', '~> 3.1.0', :inhibit_warnings => true

#***      以上是模块化基础，以下是模块-------------模块是由版块去控制的，以后这里没有模块，只有版块，版块中的s.dependency 会添加对模块的依赖，以上是基础模块的依赖，以后都要添加到基础模块的依赖中


#测试模块  spec文件存放的位置
pod 'ZuiyeModule', :path => 'Modules/ZuiyeModule'


end

