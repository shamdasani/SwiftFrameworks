/*: uikit
 
 # UIKit
 In this next example, we'll be building the boot animation that appears everytime you open up an iOS device. We'll also animate particles because you know, think different. 😁
 
 ### Creating our Views
 
 In the code below, we write functions to create a `UIView` and `UIImageView`. As you can see, our `UIView` is our background with a black background color, and our `UIImageView` contains the Apple Logo which we add as a subview to the background.
 */

 import UIKit
 import PlaygroundSupport
 import AVFoundation

/*: instructions
 
 # Instructions:
 ## - Run the code
 
 */

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

PlaygroundPage.current.assessmentStatus = .pass(message: "👏 Congrats! Let's add some particles now! [Next Page](@next)")

//#-end-hidden-code


