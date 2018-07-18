//
//  GameViewController.swift
//  Farm Dash
//
//  Created by Douglas W. Palme on 6/20/18.
//  Copyright © 2018 Douglas W. Palme. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

class GameViewController: UIViewController {
    
    // MARK: Properties
    
    // The scene draws the tiles and cookie sprites, and handles swipes.
    var scene: GameScene!
    var level: Level!
    
    var movesLeft = 0
    var score = 0
    
    lazy var backgroundMusic: AVAudioPlayer? = {
        guard let url = Bundle.main.url(forResource: "Mining by Moonlight", withExtension: "mp3") else {
            return nil
        }
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = -1
            return player
        } catch {
            return nil
        }
    }()
    
    // MARK: IBOutlets
    @IBOutlet weak var gameOverPanel: UIImageView!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var movesLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var shuffleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the view
        let skView = view as! SKView
        skView.isMultipleTouchEnabled = false
        
        // Create and configure the scene.
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .aspectFill
        level = Level(filename: "Level_1")
        scene.level = level
        
        scene.swipeHandler = handleSwipe
        
        // Present the scene.
        skView.presentScene(scene)
        scene.addTiles()
        beginGame()
    }
    
    // MARK: IBActions
    @IBAction func shuffleButtonPressed(_: AnyObject) {
        
    }
    
    // MARK: View Controller Functions
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    func beginGame() {
        shuffle()
    }
    
    func shuffle() {
        let newCookies = level.shuffle()
        scene.addSprites(for: newCookies)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.portrait, .portraitUpsideDown]
    }
    
    func handleSwipe(_ swap: Swap) {
        view.isUserInteractionEnabled = false
        
        level.performSwap(swap)
        scene.animate(swap) {
            self.view.isUserInteractionEnabled = true
        }
    }
    
    
}
