// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GE_Method.h instead.

#import <CoreData/CoreData.h>

extern const struct GE_MethodAttributes {
	__unsafe_unretained NSString *cost;
	__unsafe_unretained NSString *duration;
	__unsafe_unretained NSString *methodDescription;
	__unsafe_unretained NSString *peopleNumber;
	__unsafe_unretained NSString *place;
	__unsafe_unretained NSString *preparedList;
	__unsafe_unretained NSString *star;
	__unsafe_unretained NSString *title;
} GE_MethodAttributes;

extern const struct GE_MethodRelationships {
} GE_MethodRelationships;

extern const struct GE_MethodFetchedProperties {
} GE_MethodFetchedProperties;











@interface GE_MethodID : NSManagedObjectID {}
@end

@interface _GE_Method : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (GE_MethodID*)objectID;





@property (nonatomic, strong) NSNumber* cost;



@property float costValue;
- (float)costValue;
- (void)setCostValue:(float)value_;

//- (BOOL)validateCost:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* duration;



@property float durationValue;
- (float)durationValue;
- (void)setDurationValue:(float)value_;

//- (BOOL)validateDuration:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* methodDescription;



//- (BOOL)validateMethodDescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* peopleNumber;



@property int32_t peopleNumberValue;
- (int32_t)peopleNumberValue;
- (void)setPeopleNumberValue:(int32_t)value_;

//- (BOOL)validatePeopleNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* place;



//- (BOOL)validatePlace:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* preparedList;



//- (BOOL)validatePreparedList:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* star;



@property int32_t starValue;
- (int32_t)starValue;
- (void)setStarValue:(int32_t)value_;

//- (BOOL)validateStar:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;






@end

@interface _GE_Method (CoreDataGeneratedAccessors)

@end

@interface _GE_Method (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveCost;
- (void)setPrimitiveCost:(NSNumber*)value;

- (float)primitiveCostValue;
- (void)setPrimitiveCostValue:(float)value_;




- (NSNumber*)primitiveDuration;
- (void)setPrimitiveDuration:(NSNumber*)value;

- (float)primitiveDurationValue;
- (void)setPrimitiveDurationValue:(float)value_;




- (NSString*)primitiveMethodDescription;
- (void)setPrimitiveMethodDescription:(NSString*)value;




- (NSNumber*)primitivePeopleNumber;
- (void)setPrimitivePeopleNumber:(NSNumber*)value;

- (int32_t)primitivePeopleNumberValue;
- (void)setPrimitivePeopleNumberValue:(int32_t)value_;




- (NSString*)primitivePlace;
- (void)setPrimitivePlace:(NSString*)value;




- (NSString*)primitivePreparedList;
- (void)setPrimitivePreparedList:(NSString*)value;




- (NSNumber*)primitiveStar;
- (void)setPrimitiveStar:(NSNumber*)value;

- (int32_t)primitiveStarValue;
- (void)setPrimitiveStarValue:(int32_t)value_;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




@end
