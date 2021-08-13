//
//  CourseList.swift
//  HarpreetCambrianCoursesIosApp
//
//  Created by Apple on 11/08/21.
//

import Foundation

class CourseList{
    var list = [Course]()
    let courseURL:URL  = {
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentDirectories.first!
        return documentDirectory.appendingPathComponent("course.archive")
        //return documentDirectory
    }()
 
    init(){
//        let todos = ["feed the dog","do homework",
//
//                    "sleep","play video games"]
//
//        for todo in todos{
//            list.append(Course(title: todo))
//        }
        do{
            let data = try Data(contentsOf: courseURL)
            list = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [Course]
        }
        catch{
            
        }
    }
    
    func removeTodo(index: Int){
           list.remove(at: index)
       }
    
    func moveTodo(from fromIndex: Int, to toIndex: Int){
          let temp = list[fromIndex]
          list.remove(at: fromIndex)
          list.insert(temp, at: toIndex)
      }
    
    @discardableResult   func save() -> Bool{
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: list, requiringSecureCoding: false)
            try data.write(to: courseURL)
        }
        catch{
            print("error cannot save data")
            return false
        }
        print("data saved")
        return true
    }
}
