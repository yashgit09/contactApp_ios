//
//  ContactList.swift
//  ContactApp
//


import Foundation

class ContactList{

    var contacts = [Contact]()

    var contactURL: URL = {
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in:
                .userDomainMask)
        let documentDirectory = documentDirectories.first!
        return documentDirectory.appendingPathComponent("contact.archive")
    }()
    
    init(){
        do{
            let data = try Data(contentsOf: contactURL)
            contacts = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [Contact]
        } catch let err {
            print(err)
        }
    }
    
    func editContact(contact: Contact, row: Int){
        contacts.remove(at: row)
        contacts.insert(contact, at: row)
        
    }
    
    
    func addContact(contact: Contact){
        contacts.append(contact)
        
    }
    
    func deleteContact(row: Int){
        
        contacts.remove(at: row)
    }
    
    func moveContact(from: Int, to: Int){
        let contactToMove = contacts[from]
        contacts.remove(at: from)
        contacts.insert(contactToMove, at: to)
    }
    
    func save(){
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: contacts, requiringSecureCoding: false)
            try data.write(to: contactURL)
        }
        catch let err{
            print(err)
        }
    }
    
}
