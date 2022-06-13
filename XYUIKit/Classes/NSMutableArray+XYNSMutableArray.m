//
//  NSMutableArray+XYNSMutableArray.m
//  XYUIKit
//
//  Created by 许须耀 on 2022/4/23.
//

#import "NSMutableArray+XYNSMutableArray.h"
#import <objc/runtime.h>
#import "NSObject+XYSwizzleHook.h"
#import "XYDefineHeader.h"

@implementation NSMutableArray (XYNSMutableArray)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class cls = NSClassFromString(@"__NSArrayM");
//        NSLog(@"self class->%@, cls->%@", [self class], cls);
        swizzleInstanceMethod(cls, @selector(addObject:), @selector(xy_safeAddObject:));
        swizzleInstanceMethod(cls, @selector(addObjectsFromArray:), @selector(xy_safeAddObjectsFromArray:));
        swizzleInstanceMethod(cls, @selector(insertObject:atIndex:), @selector(xy_safeInsertObject:atIndex:));
        swizzleInstanceMethod(cls, @selector(objectAtIndex:), @selector(xy_safeObjectAtIndex:));
        swizzleInstanceMethod(cls, @selector(objectAtIndexedSubscript:), @selector(xy_safeObjectAtIndexedSubscript:));
        
    
//        Method originalMethod = class_getInstanceMethod([self class], @selector(addObject:));
//        Method swizzleMethod = class_getInstanceMethod([self class], @selector(xy_safeAddObject:));
//        BOOL addMethod = class_addMethod([self class], @selector(addObject:), method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
//        if (addMethod) {
//            class_replaceMethod([self class], (SEL)swizzleMethod, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
//            return;
//        }
//        method_exchangeImplementations(originalMethod, swizzleMethod);
    });
}

//- (void)addObject:(id)anObject
//- (void)addObjectsFromArray:(NSArray *)otherArray
- (void)xy_safeAddObject:(id)anObject{
    if (!anObject){
        // TODO: 此处可以用封装的获取崩溃信息的类进行获取 XYException :
        // @"NSMutableArray addObject nil object"
//        NSLog(@"instance method addObject nil object!");
        XYUIKitDetailLog(@"instance method addObject nil object!");
        return;
    }
    [self xy_safeAddObject:anObject];
}
- (void)xy_safeAddObjectsFromArray:(NSArray *)otherArray{
    if (!otherArray) {
        XYUIKitDetailLog(@"The otherArray is nil!");
        return;
    }
    [self xy_safeAddObjectsFromArray:otherArray];
}

//- (void)insertObject:(id)anObject atIndex:(NSUInteger)index
//- (void)insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes
- (void)xy_safeInsertObject:(id)anObject atIndex:(NSUInteger)index{
    if (!anObject) {
        XYUIKitDetailLog(@"the object is nil!");
        return;
    }
    [self xy_safeInsertObject:anObject atIndex:index];
}

//- (id)objectAtIndex:(NSUInteger)index
//- (id)objectAtIndexedSubscript:(NSUInteger)idx
- (id)xy_safeObjectAtIndex:(NSUInteger)index{
    if (index > self.count) {
        XYUIKitDetailLog(@"out of index!");
        return nil;
    }
    return [self xy_safeObjectAtIndex:index];
}
- (id)xy_safeObjectAtIndexedSubscript:(NSUInteger)idx{
    if (idx > self.count) {
        XYUIKitDetailLog(@"the index out of bounds the datasource!");
        return nil;
    }
    return [self xy_safeObjectAtIndexedSubscript:idx];
}


@end
