//
//  SelectedCourseTableViewController.swift
//  HarpreetCambrianCoursesIosApp
//
//  Created by Apple on 16/08/21.
//

import UIKit

class SelectedCourseTableViewController: UITableViewController {

//    @IBAction func reload(_ sender: Any) {
//        tableView.reloadData()
//    }
    
  var courseList = selectedcourselist()//list which store selected course
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
           tableView.reloadData()//reload table with list
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectedcourse", for: indexPath)

         //Configure the cell...
//        let todo = todos[indexPath.row]
//               cell.textLabel!.text = todo
//               cell.detailTextLabel!.text = ""
        cell.textLabel?.text = String(indexPath.row + 1)
               let index = indexPath.row
               cell.detailTextLabel?.text = courseList.list[index].title//set data from list  to table
               
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
            courseList.removeTodo(index: indexPath.row)//remove from list
            courseList.save()//save to phone memory
            tableView.deleteRows(at: [indexPath], with: .fade)
            
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
//        if segue.identifier == "addCourse" {
//                   let dst = segue.destination as! SeCourseViewController
//                   dst.courseList = courseList
//               }
        
        
    }
    
    

}
