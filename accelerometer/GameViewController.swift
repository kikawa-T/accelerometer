//
//  GameViewController.swift
//  accelerometer
//
//  Created by tatsuomi kikawa on 2020/09/20.
//

import UIKit
import CoreMotion

class GameViewController: UIViewController {
    
    @IBOutlet private weak var awaImageView: UIImageView!
    
    let motionManager = CMMotionManager()
    
    var accelerationX: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //加速度計が使用できるかどうか
        if motionManager.isAccelerometerAvailable {
            //間隔
            motionManager.accelerometerUpdateInterval = 0.01
            //加速度計が更新された時
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: { (data, Error) in
                //加速度の習得と座標の更新
                self.accelerationX = (data?.acceleration.x)!
                self.awaImageView.center.x =
                    self.awaImageView.center.x - CGFloat(self.accelerationX! * 20)
                //x座標の限界値
                if self.awaImageView.frame.origin.x < 40 {
                    self.awaImageView.frame.origin.x = 40
                }
                if self.awaImageView.frame.origin.x > 260 {
                    self.awaImageView.frame.origin.x = 260
                }
            })
        }
        // Do any additional setup after loading the view.
    }
    //値の受け渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController: ResultViewController = segue.destination as! ResultViewController
        resultViewController.acclerationX = self.accelerationX
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
