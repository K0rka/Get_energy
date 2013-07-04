// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Method.h instead.

#import <CoreData/CoreData.h>
#import "NSManagedObject.h.h"

extern const struct MethodAttributes {
	 NSString *cost;
	 NSString *duration;
	 NSString *methoddescription;
	 NSString *place;
	 NSString *title;
} MethodAttributes;

extern const struct MethodRelationships {
} MethodRelationships;

extern const struct MethodFetchedProperties {
} MethodFetchedProperties;








@interface MethodID : NSManagedObjectID {}
@end

@interface _Method : NSManagedObject.h {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MethodID*)objectID;





@property (nonatomic, retain) NSNumber* cost;



@property int32_t costValue;
- (int32_t)costValue;
- (void)setCostValue:(int32_t)value_;

//- (BOOL)validateCost:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSNumber* duration;



@property double durationValue;
- (double)durationValue;
- (void)setDurationValue:(double)value_;

//- (BOOL)validateDuration:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSString* methoddescription;



//- (BOOL)validateMethoddescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSString* place;



//- (BOOL)validatePlace:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;






@end

@interface _Method (CoreDataGeneratedAccessors)

@end

@interface _Method (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveCost;
- (void)setPrimitiveCost:(NSNumber*)value;

- (int32_t)primitiveCostValue;
- (void)setPrimitiveCostValue:(int32_t)value_;




- (NSNumber*)primitiveDuration;
- (void)setPrimitiveDuration:(NSNumber*)value;

- (double)primitiveDurationValue;
- (void)setPrimitiveDurationValue:(double)value_;




- (NSString*)primitiveMethoddescription;
- (void)setPrimitiveMethoddescription:(NSString*)value;




- (NSString*)primitivePlace;
- (void)setPrimitivePlace:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




@end
