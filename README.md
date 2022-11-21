# CrackStation, a Decrypter implementation

Decrypter to crack passwords encrypted with SHA1 and SHA256.

# OverView 

Passwords are encrypted in different way . There are a lot of crackstation that you can find in internet ( for example https://crackstation.net ). The goal for these website are to find the passwords by decrypt there hash  .

# Mission Statement 

My Swift library is a cracking station for passwords coded with sha1 and sha256. My Decrypter cracks unsalted hashes. <br/>
It is able to crack to any password up to three characters in length, which matches the regular expression `[A-Za-z0-9!?]{1,3}` and is encrypted 
using `SHA-1` or `SHA-256`.
This library is for a project in my school and the first purpose of it is not to crack password of real person.
You can use it to understand how a crackstation works.

# Installation 

The  [Swift Package Manager](https://www.swift.org/package-manager)  is "a tool for managing the distribution of Swift code. It's integrated with Swift build system to automate the process of downloading, compiling, and linking dependencies."
<br/>
<br/>
Once you have your Swift package set up, add CrackStation to the list of dependencies in your file:

```
dependencies: [
    .package(url: "git@github.com:arthurolivier1/CrackStation.git", .upToNextMajor(from : "1.0.6" ))
]
```

# Usage

**The API**<br/>

There are two functions signatures in my CrackStation. 
* The first one comes from the CrackStation Decrypter , the name of the function is `decrypt` .
This function need one parameter : the shaHash that we want to crack ( a String ).
This function return the password who correspond to the shaHash. ( a String too ). If there is no correpondance, it returns `nil`.
This is the function signature for the decrypt function :
```
public func decrypt(shaHash: String) -> String?
```

* The second one is used to import the data.json file who contains the lookuptable , the name of the function is `loadDictionaryFromDisk` .
This function doesn't need parameters .
This function return a dictionnary who correspond to our lookuptable. ( [ String : String ] ). 
This is the function signature for the decrypt function :
```
func loadDictionaryFromDisk() throws -> [String : String]
```
<br/>

**An Example**<br/>

To use this library , you have to import the crackstation in your Swift project with the link of the github and the lastest stable realease> 
After the importation, you will be able to use the files of the library in your project.
To use the crackstation in your source code, you have to import the packacge "CrackStation". 
After, you have to create a Decrypter with two function and an object decrypter :
- an init function in witch you will assign to the decrypter Crackstation()
- a decrypt function which ask a String and which return a string . In this function, you have to use the decrypt(shaHash: String) of the Crackstation 
object to crack the password.
You can verify that the code was cracked by using unit tests.
```
import CrackStation

public struct CrackStationWrapper: Decrypter {
    private let testObject: Decrypter

    public init() {
        testObject = CrackStation()
    }

    public func decrypt(shaHash: String) -> String? {
        let crackedPassword = testObject.decrypt(shaHash: shaHash)
        return crackedPassword
    }
}
```

# Author 

Malini Masilamani , student in Oregon State University







