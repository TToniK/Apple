//
//  GameViewController.swift
//  DiceRoll
//
//  Created by Toni Kari on 06/04/2021.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var roll: UIButton!
    @IBOutlet weak var leftdice: UIImageView!
    @IBOutlet weak var rightdice: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        let firstNumber = arc4random_uniform(5) + 1
        let secondNumber = arc4random_uniform(5) + 1
        label.text = "You rolled number \(firstNumber + secondNumber)"
        leftdice.image = UIImage(named: "Dice\(firstNumber)")
        rightdice.image = UIImage(named: "Dice\(secondNumber)")
        
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
