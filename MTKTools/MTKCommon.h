//
//  MTKCommon.h
//  MTKTools
//
//  Created by Maxthon Chan on 5/8/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#ifndef _MTKTools_MTKCommon_
#define _MTKTools_MTKCommon_

#include <objc/objc.h>
#include <sys/cdefs.h>

#if __OBJC__

#define _class @class
#define _selector(_sel) @selector(_sel)

#define MTKString(_fmt, ...) [NSString stringWithFormat:_fmt, ##__VA_ARGS__]

#else // __OBJC__

#define _class typedef struct objc_object
#define _selector(_sel) sel_getUid(#_sel);

#endif // __OBJC__

#endif
