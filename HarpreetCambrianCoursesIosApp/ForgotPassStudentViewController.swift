//
//  ForgotPassStudentViewController.swift
//  HarpreetCambrianCoursesIosApp
//
//  Created by Apple on 17/08/21.
//


import UIKit

class ForgotPassStudentViewController: UIViewController {

   
    @IBOutlet weak var newPassword: UITextField!//reference of textfield to add new passsword
    
    
    var student: StudentLogin!//class object
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          
          // save new password
          if newPassword.text! != "" {
              student.spwd = newPassword.text!//save to class member variable
            print(newPassword.text!)
          }
      }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

    */

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//        if (segue.identifier == "changePWD"){
//            let dest = segue.destination as! ViewController
//            dest.pwd = newPassword.text!
//            print(dest.pwd)
//        }
//    }
    
}
