//
//  Item.swift
//  ContactApp
//


import Foundation

class Contact: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = false
   
    var name: String
    var number: String
   
    
    init(name: String, number: String){
        self.name = name
        self.number = number
        
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        number = coder.decodeObject(forKey: "number") as! String
       
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(number, forKey: "number")
      
    }
    

}
