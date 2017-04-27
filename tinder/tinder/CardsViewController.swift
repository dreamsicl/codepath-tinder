//
//  CardsViewController.swift
//  tinder
//
//  Created by Vanna L Phong on 4/26/17.
//  Copyright © 2017 Vanna L Phong. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    @IBOutlet weak var navBar: UIImageView!
    @IBOutlet weak var navBar2: UIImageView!
    @IBOutlet weak var actionButtons: UIImageView!
    @IBOutlet weak var personView: UIImageView!

    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Here we use the method didPan(sender:), which we defined in the previous step, as the action.
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan))
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        personView.isUserInteractionEnabled = true
        personView.addGestureRecognizer(panGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
    
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            cardInitialCenter = personView.center
        } else if sender.state == .changed {
            personView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
        } else if sender.state == .ended {
            print("Gesture ended")
        }
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
