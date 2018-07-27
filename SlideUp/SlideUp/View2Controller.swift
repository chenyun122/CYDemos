//
//  View2Controller.swift
//  SlideUp
//
//  Created by Yun CHEN on 2018/7/27.
//  Copyright © 2018年 Yun CHEN. All rights reserved.
//

import UIKit

class View2Controller: UIViewController {

    var viewToAnimate:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let view1Controller = self.storyboard?.instantiateViewController(withIdentifier: "View1Controller") {
            self.addChildViewController(view1Controller)
            self.view.addSubview(view1Controller.view)
            self.viewToAnimate = view1Controller.view
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            let frame = self.view.frame
            UIView.animate(withDuration: 0.3, animations: {
                self.viewToAnimate?.frame = CGRect(x: 0, y: -frame.height, width: frame.width, height: frame.height)
            }, completion: { (finished) in
                if finished {
                    self.viewToAnimate?.removeFromSuperview()
                }
            })
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.viewToAnimate?.frame = self.view.bounds
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
