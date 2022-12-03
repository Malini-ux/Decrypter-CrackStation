# CrackStation, a Decrypter implementation

Crack passwords that are encrypted with SHA1 and SHA256 hash values

# OverView 

A crack station uses lookup tables to crack hash values. As part of this implementation the functionality reads the lookuptuable for a given hash value and returns the password if a match is found for the hash value. The password that can be cracked should be up to three chracters long and matches the regular expression [A-Za-z0-9?!]{1,3}

# Mission Statement 

The CrackStation library cracks unsalted hashes. <br/>
This library is used for an assignment in my Software Engineering class to understand how a crackstation works in an ethical manner. The CrackStation is not used for cracking anyone’s password’s or confidential data. It is for learning purposes.

# Installation 

The  [Swift Package Manager](https://www.swift.org/package-manager)  is "a tool for managing the distribution of Swift code. It's integrated with Swift build system to automate the process of downloading, compiling, and linking dependencies."
<br/>
<br/>
Once you have your Swift package set up, add CrackStation to the list of dependencies in your file:

```
dependencies: [
    .package(url: "git@github.com:Malini-ux/CrackStation.git", .upToNextMajor(from : "2.2.2" ))
]
```

# Usage

**The API**<br/>

Below are the two functions signatures in my CrackStation that implement the abstract Decrypter protocol:
1)Function name is  `decrypt` .
Function parameter: The hash value "shaHash" of String type that needs to be decrypted.
The function returns the password of typr String optional for the corresponding hash value matched with the shaHash parameter value. If no value is found in the lookup table, it returns `nil`.

Function signature for the decrypt function:
```
public func decrypt(shaHash: String) -> String?
```

2) Function name is `init`.
Function doesnt take any parameters.
Function doesnt return anything. It is used to initialize the lookup table with the hash values and corresponding password values  
This is the function signature for the decrypt function:
```
public init()
```
<br/>

**An Example**<br/>

To access the library in another package, the "CrackStation" library needs to be included in your Swift package as depedancy specifying the link of the github and the lastest stable realease>  
1)Import the "CrackStation" library
2)Create instance for Crackstation()
3)Invoke the decrypt function using the CrackStation instance by passing an input string hash value. The decrypt function will also return an optional String value. 

```
import CrackStation
public struct CrackStationWrapper: Decrypter {
    private let CrackStationObject: Decrypter
    public init() {
        CrackStationObject = CrackStation()
    }
    public func decrypt(shaHash: String) -> String? {
        let crackedPassword = CrackStationObject.decrypt(shaHash: shaHash)
        return crackedPassword
    }
}
```

# Author 

Malini Masilamani








