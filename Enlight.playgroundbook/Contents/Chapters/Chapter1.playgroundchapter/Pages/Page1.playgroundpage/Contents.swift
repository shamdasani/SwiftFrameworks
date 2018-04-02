/*: scenekit
 
 # Welcome to Swift!
 
 Swift is an incredibly powerful programming language. In this playground, we'll be taking a look at some of Swift's most useful and powerful frameworks! Prepare to be **Enlightened** 😄
 
First up, we have `SceneKit`, Swift's powerful 3D rendering engine. We'll be using SceneKit to build Earth in 3D.
 */
import SceneKit
import PlaygroundSupport
/*:
 ## Rendering the Scene
 To render our `SCNView`, we establish our width and height, along with our preferred bakground color. To create planet Earth, we initialize a SceneKit `SCNNode()` with `Sphere` geometry. Then, we bring in all our map images (materials) and wrap them around our sphere.
 
 # **Instructions:**
 ## Scroll to the bottom, call the **`renderScene()`** function, and then run the code.
 
 */

let sceneView = SCNView(frame: CGRect(x:0, y:0, width:500, height:500))
let scene = SCNScene()
sceneView.scene = scene
sceneView.backgroundColor = UIColor.black
sceneView.autoenablesDefaultLighting = true

func renderScene() {
    
    let sphere = SCNNode()
    sphere.geometry = SCNSphere(radius:1)
    sphere.geometry?.firstMaterial?.diffuse.contents = UIImage(named:"earth.png")
    sphere.geometry?.firstMaterial?.specular.contents = UIImage(named:"specular.png")
    sphere.geometry?.firstMaterial?.normal.contents = UIImage(named:"normal.png")
    
    sphere.geometry?.firstMaterial?.isDoubleSided = true
    scene.rootNode.addChildNode(sphere)
    
    let animation = SCNAction.rotate(by: 360 * CGFloat((Double.pi)/180), around: SCNVector3(x:0, y:1, z:0), duration: 60)
    let repeatAnimation = SCNAction.repeatForever(animation)
    
    sphere.runAction(repeatAnimation)
    

}
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, renderScene())
//#-editable-code Tap to write your code
// call the renderScene() function here:


//#-end-editable-code

//#-hidden-code
PlaygroundPage.current.liveView = sceneView
PlaygroundPage.current.assessmentStatus = .pass(message: "👏 You did it! Let's discover what else we can do with the power of Swift. [Next Page](@next)")
//#-end-hidden-code




