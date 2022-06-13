//
//  XYException.h
//  XYUIKit
//
//  Created by 许须耀 on 2022/4/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYException : NSObject
/** 异常信息 */
@property (nonatomic, copy) NSString *exceptionMessage;
@property (nonatomic, copy) NSString *exceptionClassName;
@property (nonatomic, copy) NSString *exceptionMethod;

+ (void)xyShowExceptionMessgage:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
