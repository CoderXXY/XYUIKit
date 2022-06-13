//
//  NSString+XYStringExtension.h
//  XYUIKit
//
//  Created by 许须耀 on 2022/4/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (XYStringExtension)
/// if content.lenght is zero, the method will return CGZero, and the title default font-value is 15,return CGSize.
/// @param content content
+ (CGSize)getSizeWithContent:(NSString *)content;
/// if content.lenght is zero, the method will return CGZero, and the title default font-value is 15,return CGSize.
/// @param content content
/// @param limitSize the limit-size
+ (CGSize)getSizeWithContent:(NSString *)content limitSize:(CGSize)limitSize;
/// if content.lenght is zero, the method will return CGZero, and if you do not take font-value,the title default font-value is 15.
/// @param content content description
/// @param fontValue the font-value,default is 15
/// @param weight the weight-value
+ (CGSize)getSizeWithContent:(NSString *)content fontValue:(CGFloat)fontValue weight:(CGFloat)weight;
/// if content.lenght is zero, the method will return CGZero, and if you do not take font-value,the title default font-value is 15.
/// @param content content description
/// @param fontValue the font-value,default is 15
/// @param weight the weight-value
/// @param maxLimitSize maxLimitSize
+ (CGSize)getSizeWithContent:(NSString *)content fontValue:(CGFloat)fontValue weight:(CGFloat)weight maxLimitSize:(CGSize)maxLimitSize;
/** check url */
+ (BOOL)isLegalUrl:(NSString *)url;
/** check email  */
+ (BOOL)isLegalEmail:(NSString *)email;
/** 手机号以13， 15，18开头，八个 \d 数字字符 */
+ (BOOL)isLegalMobile:(NSString *)mobile;

@end

NS_ASSUME_NONNULL_END
