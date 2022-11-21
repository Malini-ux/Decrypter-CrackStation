import Foundation
public struct CrackStation: Decrypter {
    private let lookuptable : [String : String]  
    //Load the dictionary once during object creation  
    public init() {
        do {lookuptable = try GetLookUpTable().loadDictionaryFromDisk()}
        catch{ lookuptable = ["":""]}
    }
    public func decrypt(shaHash: String) -> String? {
        if let password = lookuptable[shaHash]
        {return password}
        else
        {return nil}
    }
   }
   public class GetLookUpTable {
     func loadDictionaryFromDisk() throws -> [String : String] {
        guard let path = Bundle.module.url(forResource: "data", withExtension: "json") else { return [:] }        
        let data = try Data(contentsOf: path)
        let jsonResult = try JSONSerialization.jsonObject(with: data)        
        if let lookupTable: Dictionary = jsonResult as? Dictionary<String, String> {
            return lookupTable
         } 
         else {return [:]}
     }
   }