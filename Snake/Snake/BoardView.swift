//
//  BoardView.swift
//  Snake
//
//  Created by etudiant on 4/26/21.
//  Copyright © 2021 TheSmurf. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    
    
    let originX : CGFloat = 6.5
    let originY : CGFloat = 10
    let cellSide : CGFloat = 20
    
    var shadowSnake: [SnakeCell] = []
    var shadowFruitCol: Int = Int.min
    var shadowFruitRow : Int = Int.min
    var score: Int = 0
    
    override func draw(_ rect: CGRect) {
        drawGrid()
        drawSnake()
        drawFruit()
    }
    
    func drawFruit(){
        #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1).setFill()
        
        UIBezierPath(roundedRect: CGRect(x: originX + CGFloat(shadowFruitCol) * cellSide, y: originY + CGFloat(shadowFruitRow) * cellSide, width: cellSide, height: cellSide), cornerRadius: 6).fill()
    }
    
    func drawSnake(){
        
        if shadowSnake.isEmpty{
            return
        }
        let snakeHead = shadowSnake.first!
        
        UIColor.purple.setFill()
        UIBezierPath(roundedRect: CGRect(x: originX + CGFloat(snakeHead.col) * cellSide, y: originY + CGFloat(snakeHead.row) * cellSide, width: cellSide, height: cellSide), cornerRadius: 6).fill()
        
        UIColor.green.setFill()
        for i in 1..<shadowSnake.count {
            let cell = shadowSnake[i]
            
            UIBezierPath(roundedRect: CGRect(x: originX + CGFloat(cell.col) * cellSide, y: originY + CGFloat(cell.row) * cellSide, width: cellSide, height: cellSide), cornerRadius: 6).fill()
        }
    }
    
    func drawGrid(){
        let gridPath = UIBezierPath()
        
        for i in 0...SnakeBoard.rows{
            gridPath.move(to: CGPoint(x:originX, y:originY + CGFloat(i) * cellSide))
            gridPath.addLine(to: CGPoint(x:originX + CGFloat(SnakeBoard.cols) * cellSide, y:originY + CGFloat(i) * cellSide))
        }
        
        for i in 0...SnakeBoard.cols{
            gridPath.move(to: CGPoint(x:originX + CGFloat(i) * cellSide, y:originY))
            gridPath.addLine(to: CGPoint(x:originX + CGFloat(i) * cellSide, y:originY + CGFloat(SnakeBoard.rows) * cellSide))
        }
        
        UIColor.lightGray.setStroke()
        gridPath.stroke()
    }

}
