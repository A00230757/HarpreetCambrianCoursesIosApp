//
//  AdminHomeViewController.swift
//  HarpreetCambrianCoursesIosApp
//
//  Created by Apple on 05/08/21.
//

import UIKit

class AdminHomeViewController: UIViewController {
    var name: String!
    @IBOutlet weak var welcomeMessage: UILabel!//laabel to show welcome message
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           welcomeMessage.text = "welcome back \(name!)"//name set on label
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
