//
//  NSObject+XYSwizzleHook.m
//  XYUIKit
//
//  Created by 许须耀 on 2022/4/23.
//

#import "NSObject+XYSwizzleHook.h"
#import <objc/runtime.h>
#import "XYDefineHeader.h"
#import "XYException.h"

int CrashInfo(id slf, SEL selector){
    return 0;
}
// 交换类方法
void swizzleClassMethod(Class cls, SEL originSel, SEL swizzleSel){
    if (!cls) return;
    Method originMethod = class_getClassMethod(cls, originSel);
    Method swizzleMethod = class_getClassMethod(cls, swizzleSel);
    Class metaCls = objc_getMetaClass(NSStringFromClass(cls).UTF8String);
    /** addMethod can judge the origin-method  is exist. return yes,successed. Then call  class_replaceMethod ,but call method_exchangeImplementations. */
    BOOL addMethod = class_addMethod(metaCls, originSel, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    if (addMethod) {
        class_replaceMethod(metaCls, swizzleSel, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
        return;
    }
    /** swizzleMethod maybe belong to super */
    class_replaceMethod(metaCls, swizzleSel, class_replaceMethod(metaCls, originSel, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod)), method_getTypeEncoding(originMethod));
//    method_exchangeImplementations(originMethod, swizzleMethod);
}

void swizzleInstanceMethod(Class cls, SEL originSel, SEL swizzleSel){
    if (!cls) return;
    /** if current class not exist selector, then get super*/
    Method originMethod = class_getInstanceMethod(cls, originSel);
    Method swizzleMethod = class_getInstanceMethod(cls, swizzleSel);
    BOOL addMethod = class_addMethod(cls, originSel, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    /** add selector if not exist, implement append with method */
    if (addMethod) {
        /* replace class instance method, added if selector not exist,for class cluster , it always add new selector here */
        class_replaceMethod(cls, swizzleSel, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
        return;
    }
    /** swizzleMethod maybe belong to super */
    class_replaceMethod(cls, swizzleSel, class_replaceMethod(cls, originSel, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod)), method_getTypeEncoding(originMethod));
//    method_exchangeImplementations(originMethod, swizzleMethod);
}

@implementation NSObject (XYSwizzleHook)

+ (void)xy_swizzleClassMethod:(SEL)originSelector withSwizzleMethod:(SEL)swizzleSelector{
    swizzleClassMethod([self class], originSelector, swizzleSelector);
}

- (void)xy_swizzleInstanceMethod:(SEL)originSelector withSwizzleMethod:(SEL)swizzleSelector{
    swizzleInstanceMethod([self class], originSelector, swizzleSelector);
}

@end

@implementation NSObject (XYExceptionMessage)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzleInstanceMethod([self class], @selector(methodSignatureForSelector:), @selector(xy_instanceMethodSignatureForSelector:));
        swizzleInstanceMethod([self class], @selector(forwardInvocation:), @selector(xy_instanceForwardInvocation:));
        //
        swizzleClassMethod([self class], @selector(methodSignatureForSelector:), @selector(xy_classMethodSignatureForSelector:));
        swizzleClassMethod([self class], @selector(forwardInvocation:), @selector(xy_classForwardInvocation:));
    });
}
// instance method
- (NSMethodSignature *)xy_instanceMethodSignatureForSelector:(SEL)aSelector{
    NSMethodSignature *methodSignature = [self xy_instanceMethodSignatureForSelector:aSelector];
    if (methodSignature) return methodSignature;
    return [[self class] checkObjectSignatureAndCurrentClass:[self class]];
}

- (void)xy_instanceForwardInvocation:(NSInvocation *)anInvocation{
    NSString *errClassName = NSStringFromClass([self class]);
    NSString *errSel = NSStringFromSelector(anInvocation.selector);
    XYUIKitDetailLog(@"Unrecognized instance class: %@,\nUnrecognized instance method: %@", errClassName, errSel);
    XYException *exception = [[XYException alloc] init];
    anInvocation.selector = @selector(xyShowExceptionMessgage:);
    [anInvocation invokeWithTarget:exception];
}
// class method
+ (NSMethodSignature *)xy_classMethodSignatureForSelector:(SEL)aSelector{
    NSMethodSignature *methodSignature = [self xy_classMethodSignatureForSelector:aSelector];
    if (methodSignature) return methodSignature;
    return [[self class] checkObjectSignatureAndCurrentClass:[self class]];
}

+ (void)xy_classForwardInvocation:(NSInvocation *)anInvocation{
    NSString *errClassName = NSStringFromClass([self class]);
    NSString *errSel = NSStringFromSelector(anInvocation.selector);
    XYUIKitDetailLog(@"Unrecognized instance class: %@,\nUnrecognized class method: %@", errClassName, errSel);
//    [exception xyShowExceptionMessgage:nil];
}



#pragma mark - 判断是否实现methodSignatureForSelector且定义方法
+ (NSMethodSignature *)checkObjectSignatureAndCurrentClass:(Class)currentClass{
    IMP originIMP = class_getMethodImplementation([NSObject class], @selector(methodSignatureForSelector:));
    IMP currentClassIMP = class_getMethodImplementation(currentClass, @selector(methodSignatureForSelector:));
    // If current class override methodSignatureForSelector return nil
    // 前提是当前类没有重写methodSignatureForSelector
    if (originIMP != currentClassIMP) return nil;
    // void xxx(id,sel,id)
    return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
}


@end
