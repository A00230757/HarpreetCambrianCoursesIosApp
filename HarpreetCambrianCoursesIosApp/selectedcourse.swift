//
//  selectedcourse.swift
//  HarpreetCambrianCoursesIosApp
//
//  Created by Apple on 16/08/21.
//


import Foundation

class selectedcourse: NSObject, NSCoding{
    
    
    var title: String//to store selected course
    
    init(title: String){
        self.title = title
    }
    
    func encode(with coder: NSCoder) {//crud
        coder.encode(title , forKey: "title")
    }
    
    required init?(coder: NSCoder) {//crud
        title = coder.decodeObject(forKey: "title") as! String
    }
}

