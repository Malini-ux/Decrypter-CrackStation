import XCTest
@testable import CrackStation
import Crypto
final class CrackStationTests: XCTestCase {    
    public func testCrackPasswordTwoCharactersSHA256() throws  {        
       // Given
        let password = "3!"
        let shaHash = "fe98796a19658454aadaa2a42bf75a14ebb1f4c88ad00ccf5ddc276546ba1299"
        // When
        if let crackedPassword = CrackStation().decrypt(shaHash: shaHash)
        // Then
        {
        print("CrackedPassword",crackedPassword)
        XCTAssertEqual(crackedPassword, password)
        }
        else {print("Password could not be cracked")}
    }
    public func testCrackPasswordThreeCharactersSHA1() throws  {    
       // Given
        let password = "3!A"
        let shaHash = "eb1ae4d5f92a8042540bcc82a1119dc95bf475b08264fcca5f9a155b6fb1b0d3"
        // When
        if let crackedPassword = CrackStation().decrypt(shaHash: shaHash)
        // Then
        {
        print("CrackedPassword",crackedPassword)
        XCTAssertEqual(crackedPassword, password)
        }
        else {print("Password could not be cracked")}
    }
    public func testCrackPasswordOneCharacterSHA1() throws  {
       // Given
        let password = "!"
        let shaHash = "0ab8318acaf6e678dd02e2b5c343ed41111b393d"
        // When
        if let crackedPassword = CrackStation().decrypt(shaHash: shaHash)
        // Then
        {
        print("CrackedPassword",crackedPassword)
        XCTAssertEqual(crackedPassword, password)
        }
        else {print("Password could not be cracked")}
    }
    func testEmptyString() throws {
      // Given
        let shaHash = ""
        // When
        if let crackedPassword = CrackStation().decrypt(shaHash: shaHash)
        // Then
        {
         print("CrackedPassword",crackedPassword)
         XCTAssertEqual(crackedPassword, nil)
         }
        else {print("error")}
       }
    public func testCrackPasswordThreeCharactersSHA256() throws  {    
       // Given
        let password = "a3?"
        let shaHash = "e1e388ce26fff681abf75ad7989ebef8e7f97bc68198cf394f05096141f69bd1"
        // When
        if let crackedPassword = CrackStation().decrypt(shaHash: shaHash)
        // Then
        {
        print("CrackedPassword",crackedPassword)
        XCTAssertEqual(crackedPassword, password)
        }
        else {print("Password could not be cracked")}
    }
}
