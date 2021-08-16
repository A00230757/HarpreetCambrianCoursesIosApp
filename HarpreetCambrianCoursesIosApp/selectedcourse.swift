//
//  selectedcourse.swift
//  HarpreetCambrianCoursesIosApp
//
//  Created by Apple on 16/08/21.
//


import Foundation

class selectedcourse: NSObject, NSCoding{
    
    
    var title: String
    
    init(title: String){
        self.title = title
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(title , forKey: "title")
    }
    
    required init?(coder: NSCoder) {
        title = coder.decodeObject(forKey: "title") as! String
    }
}

