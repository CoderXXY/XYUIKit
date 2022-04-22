//
//  NSString+XYStringExtension.m
//  XYUIKit
//
//  Created by 许须耀 on 2022/4/22.
//

#import "NSString+XYStringExtension.h"

const CGFloat defaultFontValue = 12.0;  // 文字默认大小

@implementation NSString (XYStringExtension)

+ (CGSize)getSizeWithContent:(NSString *)content{
    CGSize size = CGSizeZero;
    if (content.length <= 0) return size;
    CGRect rect = [content boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:defaultFontValue]} context:nil];
    size = rect.size;
    return size;
}

+ (CGSize)getSizeWithContent:(NSString *)content limitSize:(CGSize)limitSize{
    CGSize size = CGSizeZero;
    if (content.length <= 0) return size;
    CGRect rect = [content boundingRectWithSize:limitSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:defaultFontValue]} context:nil];
    size = rect.size;
    return size;
}

+ (CGSize)getSizeWithContent:(NSString *)content fontValue:(CGFloat)fontValue weight:(CGFloat)weight{
    CGSize size = CGSizeZero;
    if (content.length <= 0) return size;
    CGRect rect = [content boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:(fontValue == 0)?defaultFontValue:fontValue weight:weight]} context:nil];
    size = rect.size;
    return size;
}



@end
