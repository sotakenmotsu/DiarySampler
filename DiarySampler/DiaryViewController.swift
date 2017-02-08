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

class DiaryViewController: UIViewController {
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var contextTextView: UITextView!
    var date: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dateLabel.text = date
        
        DispatchQueue(label: "Background").async {
            let realm = try! Realm()
            if let saveDiary = realm.objects(Diary.self).filter("date = '\(self.date!)'").last {
                let context = saveDiary.context
                DispatchQueue.main.async {
                    self.contextTextView.text = context
                }
            }
        }
    }
    
    @IBAction func saveButtonPushed(_ sender:UIButton) {
        let realm = try! Realm()
//        print(Realm.Configuration.defaultConfiguration.fileURL!)
        let diary = Diary()
        diary.date = date
        diary.context = contextTextView.text
        try! realm.write {
            realm.add(diary)
        }
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
