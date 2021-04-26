//
//  ViewController.swift
//  Snake
//
//  Created by etudiant on 4/26/21.
//  Copyright © 2021 TheSmurf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var board: SnakeBoard = SnakeBoard()
    var direction : MovingDirection = .down
    @IBOutlet var boardView: BoardView!
    @IBOutlet var score: UILabel!
    
    var timerTest: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        board.snake.append(SnakeCell(col: 2, row: 1))
        board.snake.append(SnakeCell(col: 3, row: 1))
        board.snake.append(SnakeCell(col: 3, row: 2))
        board.snake.append(SnakeCell(col: 4, row: 2))
        board.snake.append(SnakeCell(col: 5, row: 2))
        
        
        
        boardView.shadowSnake = board.snake
        updateUI()
        
        startTimer()
        if(board.isDead()){
            stopTimerTest()
        }
        
    }


    @IBAction func left(_ sender: Any) {
        direction = .left
        
    }
    @IBAction func right(_ sender: Any) {
        direction = .right
    }
    @IBAction func down(_ sender: Any) {
        direction = .down
    }
    @IBAction func up(_ sender: Any) {
        direction = .up
    }
    
    func updateUI(){
        boardView.shadowSnake = board.snake
        boardView.shadowFruitCol=board.fruitCol
        boardView.shadowFruitRow=board.fruitRow
        score.text = "\(board.score)"
        boardView.setNeedsDisplay()
    }
    
    func startTimer() {
        guard timerTest == nil else { return }
        
        timerTest = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (Timer) in
            switch self.direction {
            case .left:
                self.board.moveLeft()
            case .right:
                self.board.moveRight()
            case .up:
                self.board.moveUp()
            case .down:
                self.board.moveDown()
            }
            self.updateUI()
        })
    }
    
    func stopTimerTest() {
        timerTest?.invalidate()
        timerTest = nil
    }
}

