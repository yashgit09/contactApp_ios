//
//  DetailsViewController.swift
//  ContactApp
//
//  Created by Cambrian on 2022-03-23.
//
import UIKit

class DetailsViewController: UIViewController {
    
    var contactList = ContactList()
    var index: Int!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (index != nil) {
                nameField.text =  contactList.contacts[index].name
                numberField.text = contactList.contacts[index].number
            
        }
    }
    
    
    @IBAction func save(_ sender: Any) {
       
        
        let contacts = Contact(name: nameField.text!, number: numberField.text!)

        let str = nameField.text
        
        if(str?.count ?? 0>0){
        if (index == nil) {
    
            contactList.addContact(contact: contacts)
            navigationController?.popViewController(animated: true)
        }
        else {
            contactList.editContact(contact: contacts, row: index)
            navigationController?.popViewController(animated: true)
            
        }
        }
        else{
            // Create new Alert
            var dialogMessage = UIAlertController(title: "Alert", message: "Please Enter A Valid Name", preferredStyle: .alert)
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                //print("Ok button tapped")
             })
            
            //Add OK button to a dialog message
            dialogMessage.addAction(ok)
            // Present Alert to
            self.present(dialogMessage, animated: true, completion: nil)
        }
        
        
      //  print(items.name)
        
       }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
