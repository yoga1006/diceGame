//
//  ViewController.swift
//  diceGame
//
//  Created by Yoga on 2022/7/4.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet var diceImageViews: [UIImageView]!
    @IBOutlet var diceImageViews2: [UIImageView]!
    
    
    @IBOutlet weak var playerScoreTextField: UITextField!
    @IBOutlet weak var computerScoreTextField: UITextField!
    
    
    @IBOutlet weak var playerWinLabel: UILabel!
    @IBOutlet weak var computerWinLabel: UILabel!
    
    
    @IBOutlet weak var playerNo1ImageView: UIImageView!
    @IBOutlet weak var computerNo1ImageView: UIImageView!
    
    @IBOutlet weak var rollButton: UIButton!
    
    var playerScore = 0
    var computerScore = 0
    var playerWin = 0
    var computerWin = 0
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        super.viewDidLoad()
           let skView = SKView(frame: view.frame)
           view.insertSubview(skView, at: 0)
           let scene = SKScene(size: skView.frame.size)
           scene.anchorPoint = CGPoint(x: 0.5, y: 1)
           let emitterNode = SKEmitterNode(fileNamed: "MySnowParticle")
           scene.addChild(emitterNode!)
           skView.presentScene(scene)
        emitterNode?.particleBirthRate=1 //指定一秒發射一個圖
        emitterNode?.particleLifetime=10 //指定圖停留的時間為五秒
        emitterNode?.particleSpeed=100 //指定圖的移動速度

 
    }

    func reset() {
        playerWin = 0
        computerWin = 0
        playerScore = 0
        computerScore = 0
        playerWinLabel.text = "\(playerWin)"
        computerWinLabel.text = "\(computerWin)"
        playerScoreTextField.text="\(playerScore)"
        computerScoreTextField.text="\(computerScore)"
        playerNo1ImageView.isHidden=true
        computerNo1ImageView.isHidden=true
    }
    
    @IBAction func play(_ sender: UIButton) {
    
        playerScore = 0
        computerScore = 0
        
        //玩家骰子
        for diceImageView in diceImageViews{
            let number = Int.random(in: 1...6)
            diceImageView.image=UIImage(named: "dice\(number)")
            playerScore += number
            playerScoreTextField.text = "\(playerScore)"
        }
        //電腦骰子
        for diceImageView2 in diceImageViews2{
            let number = Int.random(in: 1...6)
            diceImageView2.image=UIImage(named: "dice\(number)")
            computerScore += number
            computerScoreTextField.text = "\(computerScore)"
        }
        
        //贏方局數+1，若平手局數比分不變
        if playerScore > computerScore{
            playerWin += 1
            playerWinLabel.text = "\(playerWin)"
        }else if playerScore < computerScore {
            computerWin += 1
            computerWinLabel.text = "\(computerWin)"
        }else {
            playerWin += 0
            computerWin += 0
        }
        
        //先拿下三勝者獲勝
        if playerWin==3 || computerWin==3{
        if playerWin > computerWin{
            playerNo1ImageView.isHidden = false
            rollButton.isHidden = true
            
        }else{
            computerNo1ImageView.isHidden = false
            rollButton.isHidden = true
        }
        }
        
     
    }
    
        

    @IBAction func playAgain(_ sender: UIButton) {
        reset()
        rollButton.isHidden=false
    }
    

}
