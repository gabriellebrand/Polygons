//
//  ViewController2.swift
//  CollectionViewChallenge2
//
//  Created by Gabrielle Brandenburg dos Anjos on 3/11/16.
//  Copyright © 2016 Gabrielle Brandenburg dos Anjos. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
   var sid: Int = 0
    var imgView = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgView.frame.size = CGSize(width: width-150, height: width-150)
        imgView.center = view.center
        //imgView.layer.borderWidth = 4
        
        if sid > 2 {
        var v = polygonView()
        v.frame.size = CGSize(width: width-50, height: width-50)
        v.center = view.center
        v.sides = sid
        v.backgroundColor = UIColor.clear
        view.addSubview(v)
        v.rotate()
        
        } else {
            imgView.image = drawPointOrLine(sid)
            view.addSubview(imgView)
            self.imgView.rotate()
        }
    
        // Do any additional setup after loading the view, typically from a nib.
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func drawPointOrLine (_ sides: Int) -> UIImage {
        let larg = width/3
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: larg, height: larg), false, 0)
        
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.randomColor().cgColor)
        
        if sides == 1 {
        context?.move(to: CGPoint(x: larg/2, y: larg/2))
        context?.setFillColor(UIColor.randomColor().cgColor)
        context?.fillEllipse(in: CGRect(x: larg/2 - 1, y: larg/2 - 1, width: 2, height: 2))
        } else {
        context?.move(to: CGPoint(x: 0, y: larg))
        context?.addLine(to: CGPoint(x: larg, y: 0))
        }
        
        context?.strokePath()
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
