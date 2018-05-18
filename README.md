
# 模仿QQ: [![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)
模仿iOS v7.5.8.422版QQ界面及实现一些功能,以达到学习的目的

有一个小 bug , push 到另一个界面, pop 回来后的 tableview 位置不对,用网上的方法没有解决,目前还没找到解决办法

陆续添加功能中.

## 暂时用到的第三方库:
😈 [Leancloud](https://leancloud.cn/).

## 完成的功能:

 - 主界面登录判断(账号系统待续)

 - 实现tabBar中image点击的动画效果以及拖动动画效果(利用 KVC 取得tabbar中的image,以免tabbar上的文字和image一起动画)

 - 实现点击头像打开或关闭侧滑菜单,滑动侧边打开或关闭侧边菜单(中间经历过一次代码重构,除了保留登录系统的LeanCloud SDK外,去除了其他所有第三方,改为手写代码实现侧滑菜单)

 - 实现侧滑菜单tableViewCell 点击后push页面

 - 搜索功能界面实现(实时显示搜索结果待续)

 - 右上角菜单 

 - tableView左滑删除

 - 待续

## 动态图演示

#### 登录逻辑判断
* ![img](https://github.com/chinghoi/image/blob/master/%E7%99%BB%E5%BD%95%E9%80%BB%E8%BE%91.gif)

#### tabbar 中的 每项的 image 点击动画和拖动动画
* ![img](https://github.com/chinghoi/image/blob/master/tabbarImageView%E6%8B%96%E5%8A%A8%E5%8A%A8%E7%94%BB.gif)

#### 侧边菜单中push
* ![img](https://github.com/chinghoi/image/blob/master/%E4%BE%A7%E6%BB%91%E8%8F%9C%E5%8D%95push%E6%BC%94%E7%A4%BA.gif)

#### 利用 UIButton 和 imageView UITextField 模仿的搜索界面
* ![img](https://github.com/chinghoi/image/blob/master/%E6%90%9C%E7%B4%A2%E7%95%8C%E9%9D%A2%E6%BC%94%E7%A4%BA.gif)