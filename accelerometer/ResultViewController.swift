//
//  ResultViewController.swift
//  accelerometer
//
//  Created by tatsuomi kikawa on 2020/09/20.
//

import UIKit

class ResultViewController: UIViewController {

    var acclerationX: Double!
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let result: Double = fabs(acclerationX * 100)//fabs引数の値の絶対値を受け取る
        
        label.text = String(format: "%.1f˚", result)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
