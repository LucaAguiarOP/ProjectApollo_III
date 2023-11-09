import SpriteKit
import SwiftUI


class GameScene: SKScene, ObservableObject {
    
    private var videoNode: SKVideoNode!
    let background = SKSpriteNode(imageNamed: "nebula")
    var player = SKSpriteNode()
    //var dougPower = SKSpriteNode()
    var playerFire = SKSpriteNode()
    var fireTimer = Timer()
    var dougTimer = Timer()
    
    
    override func didMove(to view: SKView) {
        scene?.size = CGSize(width: 750, height: 1335)
        background.position = CGPoint(x: size.width / 2, y:  size.height / 2)
        background.setScale(1.5)
        background.zPosition = 1
        addChild(background)
        makePlayer(playerCh: 1)
        //DougPowerz()
        fireTimer = .scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(playerFireFunc), userInfo: nil, repeats: true)
        //        dougTimer = .scheduledTimer(timeInterval: 20.0, invocation: NSInvocation, repeats: true)
    }
    
    func makePlayer(playerCh: Int) {
        var shipName = ""
        
        switch playerCh {
        case 1:
            shipName = "playerShip1"
            
        case 2:
            shipName = "playerShip2"
            
        default:
            shipName = "playerShip3"
        }
        player = .init(imageNamed: shipName)
        player.position = CGPoint(x: size.width / 2, y: 120)
        player.zPosition = 10
        player.setScale(1.5)
        addChild(player)
    }
    
    @objc func playerFireFunc() {
        let moveAction = SKAction.moveTo(y: 1400, duration: 1)
        let deleteAction = SKAction.removeFromParent()
        let combine = SKAction.sequence([moveAction,deleteAction])
        
        playerFire = .init(imageNamed: "playerShot")
        playerFire.position = player.position
        playerFire.zPosition = 3
        playerFire.setScale(5.0)
        addChild(playerFire)
        playerFire.run(combine)
    }
    
    //    func DougPowerz() {
    //        dougPower = .init(imageNamed:"dougPower")
    //        dougPower.position = CGPoint(x: size.width / 2, y: 1020)
    //        dougPower.zPosition = 10
    //        dougPower.setScale(1.5)
    //        addChild(dougPower)
    //    }
}

//        let video = SKVideoNode(fileNamed: "video")
//        video.size = CGSize(width: 750, height: 1335)
//        addChild(video)
//        videoNode.position = CGPoint(x: frame.midX, y: frame.midY)
//        videoNode.play()