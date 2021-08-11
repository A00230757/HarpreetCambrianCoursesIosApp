//
//  AddCourseViewController.swift
//  HarpreetCambrianCoursesIosApp
//
//  Created by Apple on 11/08/21.
//

import UIKit

class AddCourseViewController: UIViewController {
  

    @IBOutlet weak var courseTitle: UITextField!
    var courseList: CourseList!
      
      override func viewDidLoad() {
          super.viewDidLoad()

          // Do any additional setup after loading the view.
      }
      
      override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
        courseList.list.append(Course(title: courseTitle.text!))
        courseList.save()
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

