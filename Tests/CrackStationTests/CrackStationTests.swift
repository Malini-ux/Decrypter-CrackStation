import XCTest
@testable import CrackStation
final class CrackStationTests: XCTestCase 
{
     func testLoadingLookupTableFromDisk() throws
     {  //Given
        let password = "m"
        let shaHash = "6b0d31c0d563223024da45691584643ac78c96e8"
       //When
       if let crackedPassword = CrackStation().decrypt(shaHash: shaHash)
       //Then
       {
       print("CrackedPassword",crackedPassword)
       XCTAssertEqual(crackedPassword,password)
       }
       else {print("nothing")}
     }
       func testTwoLetter_aL() throws
     {  //Given
        let password = "aL"
        let shaHash = "f53e1d8e6cfe27e2e3f1ce86632ef02097c0f453"
    
       //When
       if let crackedPassword = CrackStation().decrypt(shaHash: shaHash)
       //Then
       {
       print("CrackedPassword",crackedPassword)
       XCTAssertEqual(crackedPassword,password)
       }
       else {print("hash value not found.Password could not be cracked")}
     }
      func testTwoLetter_99() throws {
        // Given
        let password = "99"
        let shaHash = "9a79be611e0267e1d943da0737c6c51be67865a0"

        // When
        if let crackedPassword = CrackStation().decrypt(shaHash: shaHash)

        // Then
        {
        print("CrackedPassword",crackedPassword)
        XCTAssertEqual(crackedPassword, password)
        }
        else {print("hash value not found.Password could not be cracked")}
    }
    func testEmptyString() throws {
        // Given
        let shaHash = ""

        // When
        if let crackedPassword = CrackStation().decrypt(shaHash: shaHash)

        // Then
       {print("CrackedPassword",crackedPassword)
         XCTAssertEqual(crackedPassword, nil)}
         else {print("invalid /empty password")}
       }
    }
    

