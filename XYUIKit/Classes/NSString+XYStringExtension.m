//
//  NSString+XYStringExtension.m
//  XYUIKit
//
//  Created by 许须耀 on 2022/4/22.
//

#import "NSString+XYStringExtension.h"

const CGFloat defaultFontValue = 15.0;  // 文字默认大小

@implementation NSString (XYStringExtension)

+ (CGSize)getSizeWithContent:(NSString *)content{
    CGSize size = CGSizeZero;
    if (content.length <= 0) return size;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    CGRect rect = [content boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:defaultFontValue], NSParagraphStyleAttributeName:paragraphStyle} context:nil];
    size = rect.size;
    return size;
}

+ (CGSize)getSizeWithContent:(NSString *)content limitSize:(CGSize)limitSize{
    CGSize size = CGSizeZero;
    if (content.length <= 0) return size;
    CGRect rect = [content boundingRectWithSize:limitSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:defaultFontValue]} context:nil];
    size = rect.size;
    return size;
}

+ (CGSize)getSizeWithContent:(NSString *)content fontValue:(CGFloat)fontValue weight:(CGFloat)weight{
    CGSize size = CGSizeZero;
    if (content.length <= 0) return size;
    CGRect rect = [content boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:(fontValue == 0)?defaultFontValue:fontValue weight:weight]} context:nil];
    size = rect.size;
    return size;
}

+ (CGSize)getSizeWithContent:(NSString *)content fontValue:(CGFloat)fontValue weight:(CGFloat)weight maxLimitSize:(CGSize)maxLimitSize{
    CGSize size = CGSizeZero;
    if (content.length <= 0) return size;
    CGRect rect = [content boundingRectWithSize:maxLimitSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:(fontValue == 0)?defaultFontValue:fontValue weight:weight]} context:nil];
    size = rect.size;
    return size;
}

+ (BOOL)isLegalUrl:(NSString *)url{
    NSString *regex = @"(https?|http|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]";
    NSPredicate *urlTemp = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [urlTemp evaluateWithObject:url];
}

+ (BOOL)isLegalEmail:(NSString *)email{
//    NSString *regex = @"(^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(.[a-zA-Z0-9_-]+)+$)";
//    NSString *regex = @"(^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(.[a-zA-Z0-9_-]+)+$)";
//    NSPredicate *emailTemp = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
//    return [emailTemp evaluateWithObject:email];
    BOOL isEmail = [email hasSuffix:@"@163.com"]||[email hasSuffix:@"@126.com"]||[email hasSuffix:@"@gmail.com"];
    return isEmail;
}

+ (BOOL)isLegalMobile:(NSString *)mobile{
    /** 手机号以13,15,17,18开头，八个 \d 数字字符 */
    NSString *regex = @"^((13[0-9])|(15[^4,\\D])|(17[0,0-9])|(18[0,0-9]))\\d{8}$";
    NSPredicate *mobileTemp = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [mobileTemp evaluateWithObject:mobile];
}



@end
