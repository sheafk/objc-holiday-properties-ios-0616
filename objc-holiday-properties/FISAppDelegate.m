//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    
    NSArray *newArray = self.database[season];
    
    return newArray;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    
    NSMutableArray *supplies = [[NSMutableArray alloc]init];
    
    [supplies addObjectsFromArray: self.database[season][holiday]];
    
    return supplies;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
    BOOL value =[[self.database[season] allKeys] containsObject:holiday];
    
    return value;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    
    BOOL answer =[self.database[season][holiday] containsObject:supply];
    
    return answer;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    NSMutableArray *emptyArray = [[NSMutableArray alloc]init];
    [self.database[season] setObject:emptyArray forKey:holiday];
    
    // no return
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    [self.database[season][holiday]addObject:supply];
    // no return
}

@end
