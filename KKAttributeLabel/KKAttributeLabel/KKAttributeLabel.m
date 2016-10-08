//
//  KKAttributeLable.m
//  PZJ
//
//  Created by MR.KING on 16/5/16.
//  Copyright © 2016年 EBJ. All rights reserved.
//

#import "KKAttributeLabel.h"


@interface KKAttributeLabel ()
@property(nonatomic,strong)NSMutableAttributedString * attStr;
@property(nonatomic,strong)NSMutableParagraphStyle *paragraphStyle;
@property(nonatomic,strong)NSMutableSet * arrAtt;
@property(nonatomic,strong)NSShadow * shadow;
@end

#define SetParaStyle(min,max)\
-(void)set##max:(CGFloat)min{\
_##min = min;\
self.paragraphStyle.min = _##min;\
[self reSet];\
}\

#define SetPara(min,max,style)\
-(void)set##max:(style)min{\
_##min = min;\
self.paragraphStyle.min = _##min;\
[self reSet];\
}\

@implementation KKAttributeLabel



-(NSMutableSet *)arrAtt{
    if (!_arrAtt) {
        _arrAtt = [[NSMutableSet alloc]init];
    }
    return _arrAtt;
}

-(NSRange)fullRange{
    return NSMakeRange(0, self.attStr.string.length);
}

-(void)setCharactorSpacing:(CGFloat)charactorSpacing{
    _charactorSpacing = charactorSpacing;
    if ([self.arrAtt containsObject:NSKernAttributeName]) {
        [self.attStr removeAttribute:NSKernAttributeName range:self.fullRange];
    }
    [self.arrAtt addObject:NSKernAttributeName];
    [self.attStr addAttribute:NSKernAttributeName value:@(_charactorSpacing) range:self.fullRange];
    [self reSet];
}

-(void)setObliqueness:(CGFloat)obliqueness{
    _obliqueness = obliqueness;
    if ([self.arrAtt containsObject:NSObliquenessAttributeName]) {
        [self.attStr removeAttribute:NSObliquenessAttributeName range:self.fullRange];
    }
    [self.arrAtt addObject:NSObliquenessAttributeName];
    [self.attStr addAttribute:NSObliquenessAttributeName value:@(obliqueness) range:self.fullRange];
    [self reSet];
}

-(void)setLinkUrl:(NSURL *)linkUrl{
    _linkUrl = linkUrl;
    if ([self.arrAtt containsObject:NSLinkAttributeName]) {
        [self.attStr removeAttribute:NSLinkAttributeName range:self.fullRange];
    }
    [self.arrAtt addObject:NSLinkAttributeName];
    [self.attStr addAttribute:NSLinkAttributeName value:linkUrl range:self.fullRange];
    [self reSet];
}

-(void)setTextAlignment:(NSTextAlignment)textAlignment{
    self.paragraphStyle.alignment = textAlignment;
    [self reSet];
}

-(NSTextAlignment)textAlignment{
    return self.paragraphStyle.alignment;
}

-(void)setShadowBlurRadius:(CGFloat)shadowBlurRadius{
    _shadowBlurRadius = shadowBlurRadius;
    self.shadow.shadowBlurRadius = shadowBlurRadius;
    [self reSet];
}



-(void)setShadowOffset:(CGSize)shadowOffset{
    self.shadow.shadowOffset = shadowOffset;
    [self reSet];
}

-(CGSize)shadowOffset{
    return self.shadow.shadowOffset;
}



-(void)setShadowColor:(id)shadowColor{
    self.shadow.shadowColor = shadowColor;
}

-(id)shadowColor{
    return self.shadow.shadowColor;
}



-(void)setStrokeColor:(UIColor *)strokeColor{
    _strokeColor = strokeColor;
    if ([self.arrAtt containsObject:NSStrokeColorAttributeName]) {
        [self.attStr removeAttribute:NSStrokeColorAttributeName range:self.fullRange];
    }
    [self.arrAtt addObject:NSStrokeColorAttributeName];
    [self.attStr addAttribute:NSStrokeColorAttributeName value:_strokeColor range:self.fullRange];

}

-(void)setStrokeWidth:(CGFloat)strokeWidth{
    _strokeWidth = strokeWidth;
    if ([self.arrAtt containsObject:NSStrokeWidthAttributeName]) {
        [self.attStr removeAttribute:NSStrokeWidthAttributeName range:self.fullRange];
    }
    [self.arrAtt addObject:NSStrokeWidthAttributeName];
    [self.attStr addAttribute:NSStrokeWidthAttributeName value:@(_strokeWidth) range:self.fullRange];
}

-(void)setNumOfTrikethrough:(unsigned int)numOfTrikethrough{
    _numOfTrikethrough = numOfTrikethrough;
    if ([self.arrAtt containsObject:NSStrikethroughStyleAttributeName]) {
        [self.attStr removeAttribute:NSStrikethroughStyleAttributeName range:self.fullRange];
    }
    [self.arrAtt addObject:NSStrikethroughStyleAttributeName];
    
    [self.attStr addAttribute:NSStrikethroughStyleAttributeName value:@(_numOfTrikethrough) range:self.fullRange];
    [self reSet];
}

-(void)setStrikeColor:(UIColor *)strikeColor{
    _strikeColor = strikeColor;
    if ([self.arrAtt containsObject:NSStrikethroughColorAttributeName]) {
        [self.attStr removeAttribute:NSStrikethroughColorAttributeName range:self.fullRange];
    }
    [self.arrAtt addObject:NSStrikethroughColorAttributeName];
    [self.attStr addAttribute:NSStrikethroughColorAttributeName value:_strikeColor range:self.fullRange];
    [self reSet];
}

SetParaStyle(paragraphSpacing, ParagraphSpacing)
SetParaStyle(headIndent, HeadIndent)
SetParaStyle(tailIndent, TailIndent)
SetParaStyle(minimumLineHeight, MinimumLineHeight)
SetParaStyle(maximumLineHeight, MaximumLineHeight)
SetParaStyle(lineHeightMultiple, LineHeightMultiple)
SetParaStyle(paragraphSpacingBefore, ParagraphSpacingBefore)

SetPara(baseWritingDirection,BaseWritingDirection,NSWritingDirection)

-(void)setParagLineBreakMode:(NSLineBreakMode)paragLineBreakMode{
    _paragLineBreakMode = paragLineBreakMode;
    [self.arrAtt addObject:NSStrikethroughStyleAttributeName];
    self.paragraphStyle.lineBreakMode = _paragLineBreakMode;
    [self reSet];
}

-(void)setSingleUnderLine{
    self.underLineStyle = NSUnderlineStyleSingle;
}

-(void)setDoubleUnderLine{
    self.underLineStyle = NSUnderlineStyleDouble;
}

-(void)setUnderLineColor:(UIColor *)underLineColor{
    _underLineColor = underLineColor;
    if ([self.arrAtt containsObject:NSUnderlineColorAttributeName]) {
        [self.attStr removeAttribute:NSUnderlineColorAttributeName range:self.fullRange];
    }
    [self.arrAtt addObject:NSUnderlineColorAttributeName];
    [self.attStr addAttributes:@{NSUnderlineColorAttributeName:_underLineColor} range:self.fullRange];
    [self reSet];
}

-(void)setUnderLineStyle:(NSUnderlineStyle)underLineStyle{
    _underLineStyle = underLineStyle;
    if ([self.arrAtt containsObject:NSUnderlineStyleAttributeName]) {
        [self.attStr removeAttribute:NSUnderlineStyleAttributeName range:self.fullRange];
    }
    [self.arrAtt addObject:NSUnderlineStyleAttributeName];
    [self.attStr addAttributes:@{NSUnderlineStyleAttributeName:@(_underLineStyle)} range:self.fullRange];
    [self reSet];
}

-(void)setLineSpace:(CGFloat)lineSpace{
    _lineSpace = lineSpace;
    self.paragraphStyle.lineSpacing = lineSpace;
    [self reSet];
}

-(void)setFont:(UIFont *)font{
    [super setFont:font];
    if ([self.arrAtt containsObject:NSFontAttributeName]) {
        [self.attStr removeAttribute:NSFontAttributeName range:self.fullRange];
    }
    [self.arrAtt addObject:NSFontAttributeName];
    [self.attStr addAttributes:@{NSFontAttributeName:font} range:self.fullRange];
    [self reSet];
}



-(void)setTextColor:(UIColor *)textColor{
    [super setTextColor:textColor];
    if ([self.arrAtt containsObject:NSForegroundColorAttributeName]) {
        [self.attStr removeAttribute:NSForegroundColorAttributeName range:self.fullRange];
    }
    [self.arrAtt addObject:NSForegroundColorAttributeName];
    [self.attStr addAttributes:@{NSForegroundColorAttributeName:textColor} range:self.fullRange];
    [self reSet];
}

-(void)setText:(NSString *)text{
    [self.attStr replaceCharactersInRange:self.fullRange withString:text];;
    [self reSet];
}

-(NSString *)text{
    return self.attStr.string;
}

-(void)reSet{
    
    if ([self.arrAtt containsObject:NSParagraphStyleAttributeName]) {
        [self.attStr removeAttribute:NSParagraphStyleAttributeName range:self.fullRange];
    }
    [self.arrAtt addObject:NSParagraphStyleAttributeName];
    [self.attStr addAttribute:NSParagraphStyleAttributeName value:self.paragraphStyle range:self.fullRange];
    
    if ([self.arrAtt containsObject:NSShadowAttributeName]) {
        [self.attStr removeAttribute:NSShadowAttributeName range:self.fullRange];
    }
    [self.arrAtt addObject:NSShadowAttributeName];
    [self.attStr addAttribute:NSShadowAttributeName value:self.shadow range:self.fullRange];
    
    self.attributedText = self.attStr;
}

-(NSMutableParagraphStyle *)paragraphStyle{
    if (!_paragraphStyle) {
        _paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    }
    return _paragraphStyle;
}

-(NSMutableAttributedString *)attStr{
    if (!_attStr) {
        _attStr = [[NSMutableAttributedString alloc]init];
        [_attStr addAttribute:NSParagraphStyleAttributeName value:self.paragraphStyle range:self.fullRange];
    }
    return _attStr;
}

-(NSShadow *)shadow{
    if (!_shadow) {
        _shadow =[[NSShadow alloc]init];
    }
    return _shadow;
}


-(void)addImage:(UIImage *)image index:(NSUInteger)index
{
    KKTextAttachment * attach =[[KKTextAttachment alloc]init];
    attach.image = image;
    
    NSAttributedString * new = [NSAttributedString attributedStringWithAttachment:attach];
    
    [self.attStr insertAttributedString:new atIndex:index];
    
    
//    [self.attStr appendAttributedString:new];
    self.attributedText = self.attStr;
}


@end



@implementation KKTextAttachment

//让加载的内容与对应的富文本大小对应

-(CGRect)attachmentBoundsForTextContainer:(NSTextContainer *)textContainer proposedLineFragment:(CGRect)lineFrag glyphPosition:(CGPoint)position characterIndex:(NSUInteger)charIndex

{
    
    return CGRectMake(0, 0, lineFrag.size.height, lineFrag.size.height);
    
}
@end