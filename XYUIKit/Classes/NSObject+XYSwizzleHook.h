//
//  NSObject+XYSwizzleHook.h
//  XYUIKit
//
//  Created by 许须耀 on 2022/4/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** exchange class-method for c. */
void swizzleClassMethod(Class cls, SEL originSel, SEL swizzleSel);
/** exchange instance-method for c. */
void swizzleInstanceMethod(Class cls, SEL originSel, SEL swizzleSel);

@interface NSObject (XYSwizzleHook)

+ (void)xy_swizzleClassMethod:(SEL)originSelector withSwizzleMethod:(SEL)swizzleSelector;

- (void)xy_swizzleInstanceMethod:(SEL)originSelector withSwizzleMethod:(SEL)swizzleSelector;

@end

@interface NSObject (XYExceptionMessage)

@end

NS_ASSUME_NONNULL_END
