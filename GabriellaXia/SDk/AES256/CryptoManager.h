#import <Foundation/Foundation.h>

@interface CryptoManager : NSObject  {

}

+ (CryptoManager*)getInstance;
- (NSString*)encryptDataWithDataString:(NSString*) rawDataStr withSeed:(NSString*) seed;
- (NSString*)decryptDataWithDataString:(NSString*) rawDataStr withSeed:(NSString*) seed;

@end
