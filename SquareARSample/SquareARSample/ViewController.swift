//
//  ViewController.swift
//  SquareARSample
//
//  Created by Rayan Sequeira on 28/07/17.
//  Copyright © 2017 Rayan Sequeira. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {
    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let configuration = ARWorldTrackingSessionConfiguration()
        configuration.planeDetection = .horizontal
        
        sceneView.session.run(configuration)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addCube(_ sender: Any) {
        let cubeNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
        let cameraCoordinates = self.getCameraCoordinates(sceneView: self.sceneView)
        cubeNode.position = SCNVector3(cameraCoordinates.x, cameraCoordinates.y, cameraCoordinates.z)
        sceneView.scene.rootNode.addChildNode(cubeNode)
    }
    
    struct myCamerCoordinates {
        var x = Float()
        var y = Float()
        var z = Float()
    }
    
    func getCameraCoordinates(sceneView: ARSCNView) -> myCamerCoordinates {
        if let camersTransform = sceneView.session.currentFrame?.camera.transform {
            let cameraCoordinates = MDLTransform(matrix: camersTransform)
            var cc = myCamerCoordinates()
            cc.x = cameraCoordinates.translation.x
            cc.y = cameraCoordinates.translation.y
            cc.z = cameraCoordinates.translation.z
            return cc
        }
        return myCamerCoordinates(x: 0, y: 0, z: 0)
    }
    
    @IBAction func addCup(_ sender: Any) {
        let cupNode = SCNNode()
        let cameraCoordinates = self.getCameraCoordinates(sceneView: self.sceneView)
        cupNode.position = SCNVector3(cameraCoordinates.x, cameraCoordinates.y, cameraCoordinates.z)
        
        guard let virtualObjectScene = SCNScene(named: "cup.scn", inDirectory: "Models.scnassets/cup") else {
            print("Could not load the scene")
            return
        }
        
        let wrapperNode = SCNNode()
        for node in virtualObjectScene.rootNode.childNodes {
            node.geometry?.firstMaterial?.lightingModel = .physicallyBased
            wrapperNode.addChildNode(node)
        }
        
        cupNode.addChildNode(wrapperNode)
        sceneView.scene.rootNode.addChildNode(cupNode)
    }
}

