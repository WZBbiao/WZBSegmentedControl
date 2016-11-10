# WZBSegmentedControl
一个仿网易的Segment

使用方法
  将WZBSegmentedControl.h和WZBSegmentedControl.m拖入工程
  
  在需要使用的地方调用
  ```
    /** 初始化方法
     *  titles: 所有标题
     *  titleClick: 点击标题的block回调
     */
    WZBSegmentedControl *segmentedControl = [WZBSegmentedControl segmentWithFrame:(CGRect){0, 0, 170, 25} titles:[self titles] titleClick:^(NSInteger index) {
          // do soming
    }];
    self.navigationItem.titleView = segmentedControl;
 ```
   
   效果如下：
   
   
 ![image](https://github.com/WZBbiao/WZBSegmentedControl/blob/master/1.gif?raw=true)
 

 
 您还可以加入我们的群，大家庭期待您的加入！
 
 ![image](https://raw.githubusercontent.com/WZBbiao/WZBSwitch/master/IMG_1850.JPG)
