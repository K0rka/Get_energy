// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GE_Method.m instead.

#import "_GE_Method.h"

const struct GE_MethodAttributes GE_MethodAttributes = {
	.cost = @"cost",
	.duration = @"duration",
	.methodDescription = @"methodDescription",
	.peopleNumber = @"peopleNumber",
	.place = @"place",
	.preparedList = @"preparedList",
	.star = @"star",
	.title = @"title",
};

const struct GE_MethodRelationships GE_MethodRelationships = {
};

const struct GE_MethodFetchedProperties GE_MethodFetchedProperties = {
};

@implementation GE_MethodID
@end

@implementation _GE_Method

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"GE_Method" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"GE_Method";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"GE_Method" inManagedObjectContext:moc_];
}

- (GE_MethodID*)objectID {
	return (GE_MethodID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"costValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"cost"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"durationValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"duration"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"peopleNumberValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"peopleNumber"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"starValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"star"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic cost;



- (float)costValue {
	NSNumber *result = [self cost];
	return [result floatValue];
}

- (void)setCostValue:(float)value_ {
	[self setCost:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveCostValue {
	NSNumber *result = [self primitiveCost];
	return [result floatValue];
}

- (void)setPrimitiveCostValue:(float)value_ {
	[self setPrimitiveCost:[NSNumber numberWithFloat:value_]];
}





@dynamic duration;



- (float)durationValue {
	NSNumber *result = [self duration];
	return [result floatValue];
}

- (void)setDurationValue:(float)value_ {
	[self setDuration:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveDurationValue {
	NSNumber *result = [self primitiveDuration];
	return [result floatValue];
}

- (void)setPrimitiveDurationValue:(float)value_ {
	[self setPrimitiveDuration:[NSNumber numberWithFloat:value_]];
}





@dynamic methodDescription;






@dynamic peopleNumber;



- (int32_t)peopleNumberValue {
	NSNumber *result = [self peopleNumber];
	return [result intValue];
}

- (void)setPeopleNumberValue:(int32_t)value_ {
	[self setPeopleNumber:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitivePeopleNumberValue {
	NSNumber *result = [self primitivePeopleNumber];
	return [result intValue];
}

- (void)setPrimitivePeopleNumberValue:(int32_t)value_ {
	[self setPrimitivePeopleNumber:[NSNumber numberWithInt:value_]];
}





@dynamic place;






@dynamic preparedList;






@dynamic star;



- (int32_t)starValue {
	NSNumber *result = [self star];
	return [result intValue];
}

- (void)setStarValue:(int32_t)value_ {
	[self setStar:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveStarValue {
	NSNumber *result = [self primitiveStar];
	return [result intValue];
}

- (void)setPrimitiveStarValue:(int32_t)value_ {
	[self setPrimitiveStar:[NSNumber numberWithInt:value_]];
}





@dynamic title;











@end
