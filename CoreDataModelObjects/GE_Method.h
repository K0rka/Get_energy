//
//  GE_Method.h
//  Get_Energy
//
//  Created by Catherine Korovkina on 05.07.14.
//  Copyright (c) 2014 Korovkina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface GE_Method : NSManagedObject

@property (nonatomic, retain) NSNumber * cost;
@property (nonatomic, retain) NSNumber * doneCount;
@property (nonatomic, retain) NSNumber * duration;
@property (nonatomic, retain) NSNumber * maxDoneCount;
@property (nonatomic, retain) NSString * methodDescription;
@property (nonatomic, retain) NSNumber * peopleNumber;
@property (nonatomic, retain) NSString * place;
@property (nonatomic, retain) NSString * preparedList;
@property (nonatomic, retain) NSNumber * star;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *tags;
@end

@interface GE_Method (CoreDataGeneratedAccessors)

- (void)addTagsObject:(NSManagedObject *)value;
- (void)removeTagsObject:(NSManagedObject *)value;
- (void)addTags:(NSSet *)values;
- (void)removeTags:(NSSet *)values;

@end
