### 对flutter屏幕适配的一点思考

在进行flutter的布局之中，有这么几个比较重要的概念:  
Logical pixels : 这个是实际布局中所用到的概念，类似于android中的dp  
physical pixels(device pixels) : 指的就是物理设备中的像素点  
devicePixelRatio : 指的是一个Logical pixels所对应的physical pixels的数量，实际上就是类似于android中的density  

flutter提供了非常强大的Layout widgets,实际上配合这些Layout Widget，用Logical pixels这个概念是可以做到在不同分辨率，不同像素密度的屏幕上进行拉伸与缩放而不至于有太大的变形，但这样做势必会增加我们适配的难度。  
因为flutter对屏幕适配的概念与android的屏幕适配相似，所以可以将android平台上的屏幕适配的相关经验移到flutter平台上。  
实际上如果不考虑Logical pixels而只考虑physical pixels,，可以引申出一种拉伸适配的概念，对于一个指定的ui设计稿，可以采取以下这种方式:  
designW : 设计稿的宽  
designH : 设计稿的高  
deviceW : 设备的宽
deviceH : 设备的高
如果我们以宽进行适配，也就说将设计稿的宽拉伸或者缩小到设备的宽，那么可以以如下的公式进行转换:  
dw : 设计稿中某个控件的位置  
vw : 最终在实际的设备中的位置  

&emsp;&emsp;&emsp;&emsp;$\frac{deviceW}{designW}=\frac{vw}{dw}$  
&emsp;&emsp;&emsp;&emsp;$vw = dw * \frac{deviceW}{designW} = vw * x$ 其中$x=\frac{deviceW}{designW}$  

如果我们以高进行适配，也就是说将设计稿的高拉伸或缩小到设备的高，那么与宽拉伸相似:  

&emsp;&emsp;&emsp;&emsp;$\frac{deviceH}{designH}=\frac{vw}{dw}$  
&emsp;&emsp;&emsp;&emsp;$vw = dw * \frac{deviceH}{designH} = vw * x$ 其中$x=\frac{deviceH}{designH}$  

比如说分辨率为1080x1920的ui稿，要适配到1440x2560的屏幕上，可以这样做:  
宽适配:  
&emsp;&emsp;&emsp;&emsp;$x = \frac{deviceW}{designW} = \frac{1440}{1080} = 1.333333333333333$  
&emsp;&emsp;&emsp;&emsp;$vx = vw * x$  
高适配:  
&emsp;&emsp;&emsp;&emsp;$x = \frac{deviceH}{designH} = \frac{2560}{1920} = 1.333333333333333$  
&emsp;&emsp;&emsp;&emsp;$vx = vw * x$  
经过这样的计算，可以将设计稿完美的拉伸到任意设备的屏幕上去，但是有一点需要注意，如果目标设备的屏幕的宽高比与设计稿的宽高比不一致，那么会导致如下两种情况:  
&emsp;1.如果是宽适配，那么如果目标设备的宽高比小于设计稿的宽高比(也就是说目标设备的屏幕比设计稿长,例如现在的全面屏或刘海屏)那么就会导致有一个部分留白，如果目标设备的宽高比大于大于设计稿的宽高比(例如iphone4这样的屏幕)那么就会导致导致当前的屏幕无法完全显示设计稿的内容，这两种情况就需要在设计界面的时候充分的考虑到，提前做好处理  
&emsp;2.高适配和宽适配是一样的，只不过是会产生横向的留白或者无法完全显示  

适配后的图片如下:  









