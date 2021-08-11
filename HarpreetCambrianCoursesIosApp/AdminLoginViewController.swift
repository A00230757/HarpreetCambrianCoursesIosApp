//
//  AdminLoginViewController.swift
//  HarpreetCambrianCoursesIosApp
//
//  Created by Apple on 05/08/21.
//

import UIKit

class AdminLoginViewController: UIViewController {

    @IBOutlet weak var adminusername: UITextField!
    @IBOutlet weak var adminpassword: UITextField!
   
    var user: AdminLogin!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            user = AdminLogin(name: "Josh" ,pwd: "1234")
            print(#function)
            
        }

        override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            switch identifier{
            case "adminsignin":
                if adminusername.text! == user.name {
                    if adminpassword.text! == user.pwd {
                        return true
                    }
                }
                adminusername.backgroundColor = .red
                adminpassword.backgroundColor = .red
                print("username: \(user.name) and password \(user.pwd)")
            return false
                
            default:
             return true
            
            }
        }
        
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            switch segue.identifier{
            case "adminsignin":
                let dst = segue.destination as! AdminHomeViewController
                dst.name = user.name
                
            case "forgotpassword":
                print("forgot password")
//                let dst = segue.destination as! FPViewController
//                dst.user = user
            
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
