//
//  XYException.m
//  XYUIKit
//
//  Created by 许须耀 on 2022/4/23.
//

#import "XYException.h"
#import "XYDefineHeader.h"

@implementation XYException

/** show exception message */
+ (void)xyShowExceptionMessgage:(NSString *)message{
//    XYUIKitDetailLog(@"%@", [NSString stringWithFormat:@"exceptionClassName:%@\n, exceptionMethod:%@\n", self.exceptionClassName, self.exceptionMethod]);
}

- (void)setExceptionClassName:(NSString *)exceptionClassName{
    _exceptionClassName = exceptionClassName;
}

- (void)setExceptionMethod:(NSString *)exceptionMethod{
    _exceptionMethod = exceptionMethod;
}

- (void)setExceptionMessage:(NSString *)exceptionMessage{
    _exceptionMessage = exceptionMessage;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"exceptionClassName:%@\n, exceptionMethod:%@\n", self.exceptionClassName, self.exceptionMethod];
}

@end
