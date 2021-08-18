//
//  Course.swift
//  HarpreetCambrianCoursesIosApp
//
//  Created by Apple on 11/08/21.
//

import Foundation

class Course: NSObject, NSCoding{
    
    
    var title: String//to store course title
    
    init(title: String){//initialization
        self.title = title
    }
    
    func encode(with coder: NSCoder) {//CRUD
        coder.encode(title , forKey: "title")
    }
    
    required init?(coder: NSCoder) {//CRUD
        title = coder.decodeObject(forKey: "title") as! String
    }
}

