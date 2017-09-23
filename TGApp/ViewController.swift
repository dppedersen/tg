//
//  ViewController.swift
//  TGApp
//
//  Created by Duncan Pedersen on 9/22/17.
//  Copyright © 2017 dppedersen. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    var todd = SCNNode()
    
    func make2dNode(image: UIImage, width: CGFloat = 1.0, height: CGFloat = 3.0) -> SCNNode {
        let plane = SCNPlane(width: width, height: height)
        plane.firstMaterial!.diffuse.contents = image
        let node = SCNNode(geometry: plane)
        node.constraints = [SCNBillboardConstraint()]
        return node
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = SCNScene()
        sceneView.scene = scene
        
        let img: UIImage? = UIImage(named: "gurley1.jpg")
        todd = make2dNode(image: img!)
        todd.position = SCNVector3(0.0, -1.0, -2.0)
        sceneView.scene.rootNode.addChildNode(todd)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

