//
//  ViewController.swift
//  DiarySampler
//
//  Created by 剱物蒼太 on 2017/02/01.
//  Copyright © 2017年 剱物蒼太. All rights reserved.
//

import UIKit
import JBDatePicker

class ViewController: UIViewController, JBDatePickerViewDelegate {
    
    @IBOutlet var datePicker: JBDatePickerView!
    @IBOutlet var writeButton: UIButton!
    var date: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        datePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        datePicker.updateLayout()
    }
    
    func didSelectDay(_ dayView: JBDatePickerDayView) {
        print("date selected: \(dateFormatter.string(from: dayView.date!))")
        date = dateFormatter.string(from: dayView.date!)
        
    }
    
    @IBAction func writeButtonPushed(_ sender:UIButton) {
        self.performSegue(withIdentifier: "toDiary", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        if (segue.identifier == "toDiary") {
            let diaryView = segue.destination as! DiaryViewController
            diaryView.date = self.date
        }
    }
    
    lazy var dateFormatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        return formatter
    }()
    
    
}

