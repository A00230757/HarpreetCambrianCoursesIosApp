//
//  StudentLoginViewController.swift
//  HarpreetCambrianCoursesIosApp
//
//  Created by Apple on 05/08/21.
//

import UIKit

class StudentLoginViewController: UIViewController {

 
    @IBOutlet weak var studentpass: UITextField!
    
    @IBOutlet weak var studentid: UITextField!
    var suser: StudentLogin!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            suser = StudentLogin(sname: "abc" ,spwd: "123")
            print(#function)
            
        }

        override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            switch identifier{
            case "studentsignin":
                if studentid.text! == suser.sname {
                    if studentpass.text! == suser.spwd {
                        return true
                    }
                }
                studentid.backgroundColor = .red
                studentpass.backgroundColor = .red
                print("username: \(suser.sname) ,\(studentid.text!) and password \(suser.spwd) , \(studentpass.text!)")
            return false
                
            default:
             return true
            
            }
        }
        
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            switch segue.identifier{
            case "studentsignin":
                let dst = segue.destination as! StudentHomeViewController
                dst.name = suser.sname
                
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

