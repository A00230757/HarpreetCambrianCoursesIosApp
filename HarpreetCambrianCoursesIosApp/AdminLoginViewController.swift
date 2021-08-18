//
//  AdminLoginViewController.swift
//  HarpreetCambrianCoursesIosApp
//
//  Created by Apple on 05/08/21.
//

import UIKit

class AdminLoginViewController: UIViewController {

    @IBOutlet weak var adminusername: UITextField!//reference to textfield admin name
    @IBOutlet weak var adminpassword: UITextField!//reference of textfield admin password
   
    var user: AdminLogin!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            user = AdminLogin(name: "Admin" ,pwd: "1234")//onject of class with values
            print(#function)
            
        }

        override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            switch identifier{
            case "adminsignin"://if credentials match or not
                if adminusername.text! == user.name {
                    if adminpassword.text! == user.pwd {
                        return true
                    }
                }
                adminusername.backgroundColor = .red//in case invalid credentials
                adminpassword.backgroundColor = .red
                print("username: \(user.name) and password \(user.pwd)")
            return false
                
            default:
             return true
            
            }
        }
        
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {//when activity prepares
            
            switch segue.identifier{
            case "adminsignin":
                let dst = segue.destination as! AdminHomeViewController
                dst.name = user.name
                
            case "forgotpassword":
                print("forgot password")
                let dst = segue.destination as! FPAdminViewController
                dst.admin = user
            
            default:
                preconditionFailure("seque identifier: \(segue.identifier) was not found")

            }
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
