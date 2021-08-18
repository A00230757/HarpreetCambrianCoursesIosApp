//
//  StudentHomeViewController.swift
//  HarpreetCambrianCoursesIosApp
//
//  Created by Apple on 05/08/21.
//

import UIKit

class StudentHomeViewController: UIViewController {
    var name: String!
    @IBOutlet weak var welcomeMessage: UILabel!//reference of label to show welcome message
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           welcomeMessage.text = "welcome back \(name!)"//value /name set to label
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
