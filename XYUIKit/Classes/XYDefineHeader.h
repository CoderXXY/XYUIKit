//
//  XYDefineHeader.h
//  XYUIKit
//
//  Created by 许须耀 on 2022/4/28.
//

#ifndef XYDefineHeader_h
#define XYDefineHeader_h

#ifdef __OBJC__

#ifdef DEBUG
/** DEBUG 打印信息 */
#define XYUIKitLog(format, ...) NSLog(format, ## __VA_ARGS__)
#else
/** release 打印信息 */
#define XYUIKitLog(format, ...)
#endif

#ifdef DEBUG
/** DEBUG 打印具体信息 */
# define XYUIKitDetailLog(fmt, ...) NSLog((@"\n文件名->%s\n" "函数名->%s\n" "行号->%d \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
/** release 打印具体信息 */
# define XYUIKitDetailLog(...);
#endif

#endif

#endif /* XYDefineHeader_h */
