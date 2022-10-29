# CrackStation

TITLE : Crack Station POC v1 and v2
AUTHOR: Malini Masilamani

DESCRIPTION: 
The CrackStation library consists of the implementation to decrypt a password from a hash value to plain-text.
The password fo length one or two characters that can be either an uppercase,lowercase or a digit.

PURPOSE AND USES: 
Password decryption can be used by people to ensure data privacy and protection where the credentials can be secured and monitored.

LOOKUPTABLE GENERATION: 
A python file called genLookUpTable.py when run, creates the sha1.json file with the look up table based on the sha1 hash algorithm.
The file path for the JSON file must be configured in the python file.
This lookuptable is read to fetch the hash values needed for password decryption.

HOW TO USE/REFERENCE API: 
The github repositry consisting of the source code is available here:git@github.com:Malini-ux/CrackStation.git
Any package or program that wants to use this library must import CrackStation in the source code and include it as a dependancy in the swift package
The protocol Decrypter is a public API that can be used to decrypt the input hash value.










