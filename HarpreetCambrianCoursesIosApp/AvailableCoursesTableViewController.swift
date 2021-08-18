//
//  AvailableCoursesTableViewController.swift
//  HarpreetCambrianCoursesIosApp
//
//  Created by Apple on 13/08/21.
//

import UIKit

class AvailableCourseTableViewController: UITableViewController {

//    @IBAction func reload(_ sender: Any) {
//        tableView.reloadData()
//    }
    
  var courseList = CourseList()//all courses added by admin list object
    var courseList2 = selectedcourselist()//this list store selected courses by student
    //var todoList: TodoList!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
        print(courseList.courseURL)
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           tableView.reloadData()
       }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return todos.count
        return courseList.list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "availablecourse", for: indexPath)

         //Configure the cell...
//        let todo = todos[indexPath.row]
//               cell.textLabel!.text = todo
//               cell.detailTextLabel!.text = ""
        cell.textLabel?.text = String(indexPath.row + 1)
               let index = indexPath.row
               cell.detailTextLabel?.text = courseList.list[index].title
       
        
        //to show button to select a particular course
       //cell.accessoryType = .detailDisclosureButton
        //new code added for table item click
        let customDetailDisclosureButton = UIButton.init(type: .detailDisclosure)

        // set the image for .normal and .selected
        customDetailDisclosureButton.setImage(UIImage(named: "select")?.withRenderingMode(.alwaysTemplate), for: .normal)
        customDetailDisclosureButton.setImage(UIImage(named: "select")?.withRenderingMode(.alwaysTemplate), for: .selected)

        // add a target action
//        customDetailDisclosureButton.addTarget(self, action: #selector(tableView(_:accessoryButtonTappedForRowWith:)), for: .touchUpInside)
        customDetailDisclosureButton.addTarget(self, action: #selector(AvailableCourseTableViewController.accessoryButtonTapped(sender:)), for: .touchUpInside)
        
        cell.accessoryView = customDetailDisclosureButton//custom button set in each table cell
        
               return cell

       
    }
    
    //new function for table item click
    @objc func accessoryButtonTapped(sender : UIButton){
            let buttonPosition: CGPoint = (sender as! UIButton).convert(.zero, to: tableView)
            let indexPath = tableView.indexPathForRow(at: buttonPosition)
            // do what you gotta do with the indexPath
//        print(courseList.list[indexPath!.row].title)
        var v = courseList.list[indexPath!.row].title
        var refreshAlert = UIAlertController(title: "Want to choose course", message: "Click ok to confirm otherwise cancel", preferredStyle: UIAlertController.Style.alert)

        
        //if ok clicked this will run
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
          print("Handle Ok logic here")
            print(v)
            self.courseList2.list.append(selectedcourse(title: v))
            self.courseList2.save()//saved to selected course list and phone memory
            
            
          }))

        //if cancel clicked this will run
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
          print("Handle Cancel Logic here")
          }))

        present(refreshAlert, animated: true, completion: nil)
        }
    
   func touchUpInside() {
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            courseList.removeTodo(index: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        courseList.moveTodo(from: fromIndexPath.row, to: to.row)
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "addCourse" {
                   let dst = segue.destination as! AddCourseViewController
                   dst.courseList = courseList
               }
    }
    

}
