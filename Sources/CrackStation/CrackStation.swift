import Foundation
import Glibc
import XCTest
public class CrackStation: Decrypter
{
   //Decryption begins
   public required init(){}
   public func decrypt(shaHash: String) -> String? 
      {
         guard let lookUpTable = try? CrackStation.loadDictionaryFromDisk() else {return nil }
         let hashValue = lookUpTable[shaHash] 
         return hashValue
      }

//load data from data.json file
   static func loadDictionaryFromDisk() throws -> [String : String] 
      {
         guard let path = Bundle.module.url(forResource: "sha1", withExtension: "json") else { return [:] }
         let data = try Data(contentsOf: path)
         let jsonResult = try JSONSerialization.jsonObject(with: data)
         if let lookupTable: Dictionary = jsonResult as? Dictionary<String, String> 
            {return lookupTable}
            else
            {return [:]}
      }
}