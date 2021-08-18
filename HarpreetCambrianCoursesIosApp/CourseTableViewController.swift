//
//  CourseTableViewController.swift
//  HarpreetCambrianCoursesIosApp
//
//  Created by Apple on 11/08/21.
//

import UIKit

class CourseTableViewController: UITableViewController {

//    @IBAction func reload(_ sender: Any) {
//        tableView.reloadData()
//    }
    
  var courseList = CourseList()//class courselist refenrence and object
    //var todoList: TodoList!
    
//    courseList.append(NSLocalizedString("key", comment: "value"))
    
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
           tableView.reloadData()//to reload data
       }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return todos.count
        return courseList.list.count//return total items in list
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "course", for: indexPath)

         //Configure the cell...
//        let todo = todos[indexPath.row]
//               cell.textLabel!.text = todo
//               cell.detailTextLabel!.text = ""
        cell.textLabel?.text = String(indexPath.row + 1)
               let index = indexPath.row
               cell.detailTextLabel?.text = courseList.list[index].title//set values of list to table cells
               
               return cell

       
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            courseList.removeTodo(index: indexPath.row)//remove from list and phone memory
            courseList.save()//save to list again
            tableView.deleteRows(at: [indexPath], with: .fade)
            //to delete a particular cell data
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    

    
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {//to move to add new course segue
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "addCourse" {
                   let dst = segue.destination as! AddCourseViewController
                   dst.courseList = courseList
               }
    }
    

}
