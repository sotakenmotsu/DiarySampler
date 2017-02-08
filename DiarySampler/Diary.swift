//
//  DiaryViewController.swift
//  DiarySampler
//
//  Created by 剱物蒼太 on 2017/02/08.
//  Copyright © 2017年 剱物蒼太. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift

class Diary: Object {
    dynamic var date = ""
    dynamic var context = ""
    dynamic var photo: NSData? = nil

 
 }
