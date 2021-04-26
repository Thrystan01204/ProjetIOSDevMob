//
//  SnakeBoard.swift
//  Snake
//
//  Created by etudiant on 4/26/21.
//  Copyright © 2021 TheSmurf. All rights reserved.
//

import Foundation

struct SnakeBoard {
    static let cols:Int = 18
    static let rows : Int = 30
    
    var score: Int = 0
    
    var fruitCol: Int = 2
    var fruitRow: Int = 1
    
    var snake:  [SnakeCell] = []
    
    mutating func randomizeFruit(){
        fruitCol = Int(arc4random())%SnakeBoard.cols
        fruitRow = Int(arc4random())%SnakeBoard.rows
        
        while isOnSnake(col: fruitCol, row: fruitRow){
            fruitCol = Int(arc4random())%SnakeBoard.cols
            fruitRow = Int(arc4random())%SnakeBoard.rows
            
        }
    }
    
    mutating func moveLeft(){
        updateSnakeAndFruit(newHead: SnakeCell(col: snake[0].col - 1, row: snake[0].row))
    }
    
    mutating func moveUp(){
        updateSnakeAndFruit(newHead: SnakeCell(col: snake[0].col, row: snake[0].row - 1))
    }
    
    mutating func moveRight(){
        updateSnakeAndFruit(newHead: SnakeCell(col: snake[0].col + 1, row: snake[0].row))
    }
    
    mutating func moveDown(){
        updateSnakeAndFruit(newHead: SnakeCell(col: snake[0].col, row: snake[0].row + 1))
    }
    
    mutating func updateSnakeAndFruit(newHead: SnakeCell){
        var newSnake: [SnakeCell] = []
        newSnake.append(newHead)
        for i in 0..<snake.count - 1 {
            newSnake.append(snake[i])
        }
        let oldTail = snake[snake.count-1]
        if snake[0].col == fruitCol && snake[0].row == fruitRow{
            newSnake.append(oldTail)
            randomizeFruit()
            score+=1
        }
        snake = newSnake
    }
    
    func isOnSnake(col: Int, row: Int)-> Bool {
        for cell in snake{
            if cell.col == col && cell.row == row{
                return true
            }
        }
        return false
    }
    func isDead() -> Bool{
        if snake[0].col < 1 || snake[0].col > Int(6.5)*SnakeBoard.cols {
            return true
        }
        else if snake[0].row < 10 || snake[0].row > 10*SnakeBoard.rows {
            return true
        }
        return false
    }
    
    
}
