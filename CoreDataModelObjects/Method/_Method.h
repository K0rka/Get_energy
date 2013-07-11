// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Method.h instead.

#import <CoreData/CoreData.h>


extern const struct MethodAttributes {
	__unsafe_unretained NSString *cost;
	__unsafe_unretained NSString *duration;
	__unsafe_unretained NSString *methoddescription;
	__unsafe_unretained NSString *place;
	__unsafe_unretained NSString *star;
	__unsafe_unretained NSString *title;
} MethodAttributes;

extern const struct MethodRelationships {
} MethodRelationships;

extern const struct MethodFetchedProperties {
} MethodFetchedProperties;









@interface MethodID : NSManagedObjectID {}
@end

@interface _Method : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MethodID*)objectID;





@property (nonatomic, strong) NSNumber* cost;



@property int32_t costValue;
- (int32_t)costValue;
- (void)setCostValue:(int32_t)value_;

//- (BOOL)validateCost:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* duration;



@property double durationValue;
- (double)durationValue;
- (void)setDurationValue:(double)value_;

//- (BOOL)validateDuration:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* methoddescription;



//- (BOOL)validateMethoddescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* place;



//- (BOOL)validatePlace:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* star;



@property int32_t starValue;
- (int32_t)starValue;
- (void)setStarValue:(int32_t)value_;

//- (BOOL)validateStar:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



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




- (NSNumber*)primitiveStar;
- (void)setPrimitiveStar:(NSNumber*)value;

- (int32_t)primitiveStarValue;
- (void)setPrimitiveStarValue:(int32_t)value_;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




@end
