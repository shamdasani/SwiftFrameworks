/*:
 
 # Emitting  Particles
 This is where Core Animation comes in. We are using the `CAEmitterLayer` to emit particles to the scene.
 
 # **Instructions:**
 ## - Scroll to the bottom, call the **`particleEmitter()`** function, and then run the code.
 ## - Try changing the **`scale`**, **`birthRate`**, and **`yAcceleration`** to see how our animation is affected!
 */
//#-hidden-code

import UIKit
import PlaygroundSupport
import AVFoundation

func createUIView() -> UIView {
    let myUIView = UIView(frame: CGRect(x: 0, y: 0, width: 800, height: 800))
    myUIView.backgroundColor = UIColor.black
    return myUIView
}

func createUIImageView() -> UIImageView {
    let myUIImageView = UIImageView(frame: CGRect(x: 180, y: 250, width: 150, height: 150))
    myUIImageView.image = UIImage(named: "apple.png")
    myUIImageView.contentMode = .scaleAspectFit
    return myUIImageView
}

let background = createUIView()
let image = createUIImageView()

background.addSubview(image)

//#-end-hidden-code
func particleEmitter() -> CAEmitterLayer {
    let particles = CAEmitterLayer()
    particles.emitterPosition = CGPoint(x: background.frame.midX, y:-300)
    
    //#-editable-code
    let particle = CAEmitterCell()
    particle.scale = 0.25
    particle.birthRate = 200
    particle.lifetime = 20
    particle.lifetimeRange = 2
    particle.velocityRange = 100
    particle.yAcceleration = 10
    //#-end-editable-code
    
    particle.contents = UIImage(named: "particle")?.cgImage
    particles.emitterCells = [particle]
    background.layer.addSublayer(particles)
    return particles
    
}
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, particleEmitter())
//#-editable-code Tap to write your code
// call the particleEmitter() function here:

//#-end-editable-code

//#-hidden-code

var player: AVAudioPlayer?

func playSound() {
    guard let url = Bundle.main.url(forResource: "startup", withExtension: "mp3") else { return }
    
    do {
        try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try AVAudioSession.sharedInstance().setActive(true)
        
        player = try AVAudioPlayer(contentsOf: url)
        
        guard let player = player else { return }
        
        player.play()
        
    } catch let error {
        print(error.localizedDescription)
    }
}

playSound()

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = background

PlaygroundPage.current.assessmentStatus = .pass(message: "👏 Great Job! Looks awesome right? Feel free to play around with the different animation parameters. [Next Page](@next)")

//#-end-hidden-code

