//
//  Player.swift
//  dogRunner iOS
//
//  Created by Klaus Fischer on 14.12.20.
//

import SpriteKit

class Player: SKSpriteNode{
    let keyReceiver: KeyReceiver
    let playerSpeed: CGFloat = 100.0
    
    var lastUpdate: TimeInterval
    
    init(key receiver: KeyReceiver){
        self.keyReceiver = receiver
        lastUpdate = TimeInterval()
        super.init(texture: nil, color: .red, size: CGSize(width: 20, height: 40))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func update(_ currentTime: TimeInterval){
        let keys = self.keyReceiver.GetKeys()
        let delta =  CGFloat(currentTime - lastUpdate)
        lastUpdate = currentTime
        
        
        if keys.left{
            self.position = CGPoint(x: CGFloat(playerSpeed * delta) + self.position.x, y: self.position.y)
            
        } else if keys.right{
            self.position = CGPoint(x: CGFloat(-playerSpeed * delta) + self.position.x, y: self.position.y)
        }
        
        if keys.jump{
            physicsBody?.applyImpulse(CGVector(dx:0.0, dy:20))
        }

    }
    
}

struct ControlKeys{
    var right: Bool
    var left: Bool
    var jump: Bool
}

protocol KeyReceiver {
    func GetKeys() -> ControlKeys
}
