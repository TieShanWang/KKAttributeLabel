//
//  KKAttributeLable.h
//  PZJ
//
//  Created by MR.KING on 16/5/16.
//  Copyright © 2016年 EBJ. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface KKAttributeLabel : UILabel

/************  shadow  ************/
@property (nonatomic, assign          ) CGSize             shadowOffset;// offset in user space of the shadow from the original drawing
@property (nonatomic, assign          ) CGFloat            shadowBlurRadius;// blur radius of the shadow in default user space units
@property (nonatomic, strong          ) id                 shadowColor;// color used for the shadow (default is black with an alpha value of 1/3)


@property (nonatomic, strong          ) NSURL              * linkUrl;   // URL
@property (NS_NONATOMIC_IOSONLY,assign) CGFloat            lineSpace;   // 行间距
@property (NS_NONATOMIC_IOSONLY,assign) NSUnderlineStyle   underLineStyle;  // 下划线风格
@property (NS_NONATOMIC_IOSONLY,strong) UIColor            * underLineColor;    // 下划线颜色
@property (NS_NONATOMIC_IOSONLY,assign) unsigned int  numOfTrikethrough  ;  // 删除线条数
@property (NS_NONATOMIC_IOSONLY,strong) UIColor            * strikeColor; // 删除线颜色
@property (NS_NONATOMIC_IOSONLY,assign) CGFloat            strokeWidth; // 边线宽度
@property (NS_NONATOMIC_IOSONLY,strong) UIColor            * strokeColor;   // 边线颜色
@property (NS_NONATOMIC_IOSONLY,assign) CGFloat            obliqueness;// 倾斜度
@property (NS_NONATOMIC_IOSONLY       ) CGFloat            charactorSpacing;    // 字间距
@property (NS_NONATOMIC_IOSONLY       ) CGFloat            lineSpacing; // 行间距
@property (NS_NONATOMIC_IOSONLY       ) CGFloat            paragraphSpacing;    // 段间距
@property (NS_NONATOMIC_IOSONLY       ) NSTextAlignment    alignment;   // 对齐方式
@property (NS_NONATOMIC_IOSONLY       ) CGFloat            firstLineHeadIndent;
@property (NS_NONATOMIC_IOSONLY       ) CGFloat            headIndent;  // 头缩进
@property (NS_NONATOMIC_IOSONLY       ) CGFloat            tailIndent;  // 尾缩进
@property (NS_NONATOMIC_IOSONLY       ) NSLineBreakMode    paragLineBreakMode;  // 分割方式
@property (NS_NONATOMIC_IOSONLY       ) CGFloat            minimumLineHeight;   // 最小行高
@property (NS_NONATOMIC_IOSONLY       ) CGFloat            maximumLineHeight;   // 最大行高
@property (NS_NONATOMIC_IOSONLY       ) NSWritingDirection baseWritingDirection;    // 文字方向
@property (NS_NONATOMIC_IOSONLY       ) CGFloat            lineHeightMultiple;
@property (NS_NONATOMIC_IOSONLY       ) CGFloat            paragraphSpacingBefore;

-(void)addImage:(UIImage *)image index:(NSUInteger)index; // 在指定位置添加一个图片

-(void)setDoubleUnderLine; // 设置双下划线

-(void)setSingleUnderLine;  // 设置单下划线

@end


@interface KKTextAttachment : NSTextAttachment

@end
