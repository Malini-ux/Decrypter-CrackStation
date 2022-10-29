import XCTest
@testable import CrackStation
import Crypto
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

     func testAllOneLetterSha1Permutations() throws {
        for letter in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" {
            // Given
            let password = String(letter)
            let shaHash = encrypt(password)

            // When
            let crackedPassword = CrackStation().decrypt(shaHash: shaHash)

            // Then
            XCTAssertEqual(crackedPassword, password)
        }
     }
       func testTwoLetter_aL() throws
     {  //Given
        let password = "aL"
        //let shaHash = "f53e1d8e6cfe27e2e3f1ce86632ef02097c0f453"
        let shaHash = encrypt(password)
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
        let password = "aaaaaaaa"
        let shaHash = encrypt(password)

        // When
        let crackedPassword = CrackStation().decrypt(shaHash: shaHash)
        // Then
        XCTAssertEqual(crackedPassword, nil)
       }

      func testInvalidShaHash() throws
      {
        //Given
       let password = "MaliniMasilamani"
       let shaHash = encrypt(password)
        //When
         if let crackedPassword = CrackStation().decrypt(shaHash: shaHash)
        // Then
          {print("CrackedPassword",crackedPassword)
          XCTAssertEqual(crackedPassword, password)}
          else {
            //print("CrackedPassword",crackedPassword)
            print("invalid password")}
       }
      //helper function
      private func encrypt(_ password: String) -> String
      {
        let dataToHash = Data(password.utf8)
        let prefix = "SHA 1 digest: "
        let shaHashDescription = String(Insecure.SHA1.hash(data: dataToHash).description)
        let shaHash = String(shaHashDescription.dropFirst(prefix.count - 1))
        return shaHash
      }

    }
    

