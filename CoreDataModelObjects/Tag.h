//
//  Tag.h
//  Get_Energy
//
//  Created by Catherine Korovkina on 05.07.14.
//  Copyright (c) 2014 Korovkina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GE_Method;

@interface Tag : NSManagedObject

@property (nonatomic, retain) NSString * tagName;
@property (nonatomic, retain) NSSet *methods;
@end

@interface Tag (CoreDataGeneratedAccessors)

- (void)addMethodsObject:(GE_Method *)value;
- (void)removeMethodsObject:(GE_Method *)value;
- (void)addMethods:(NSSet *)values;
- (void)removeMethods:(NSSet *)values;

@end
