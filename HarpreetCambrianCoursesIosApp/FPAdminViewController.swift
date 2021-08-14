//
//  FPAdminViewController.swift
//  HarpreetCambrianCoursesIosApp
//
//  Created by Apple on 14/08/21.
//

import UIKit

class FPAdminViewController: UIViewController {

   
    @IBOutlet weak var newPassword: UITextField!
    
    var admin: AdminLogin!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          
          // save new password
          if newPassword.text! != "" {
              admin.pwd = newPassword.text!
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
