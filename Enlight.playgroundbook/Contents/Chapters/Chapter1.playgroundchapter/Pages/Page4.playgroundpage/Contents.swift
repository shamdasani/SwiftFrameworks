/*:
 
 # Face Detection with Vision
 I hope you're enjoying the tutorials so far! Our final project is face detection using Swift's Vision Framework, which allows us to apply Computer Vision algorithms to perform many different tasks on images and video. This framework is especially important when it comes to **Machine Learning**, where computers learn patterns, train on data, and predict outcomes.
 
 ### Detection
 To detect faces, we use the `VNDetectFaceRectanglesRequest()` API, which returns observations as results, or data about the faces detected. Then,  using this data, we can draw bounding boxes around the faces.
 
 # **Instructions:**
 ## - Run the code
 ## - Scroll down and edit the **borderWidth** or **borderColor** if you wish.

 */
import UIKit
import Vision
import PlaygroundSupport

if #available(iOS 11.0, *) {

let request = VNDetectFaceRectanglesRequest()
let image = UIImage(named: "friends.jpg")

    //#-hidden-code
    let imageView: UIImageView = UIImageView(image: image)
    let view = UIView(frame: imageView.frame)
    view.addSubview(imageView)

    PlaygroundPage.current.needsIndefiniteExecution = true
    PlaygroundPage.current.liveView = view
    //#-end-hidden-code

if let cgImage = image?.cgImage {
    let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
    
    try handler.perform([request])
    
    for observation in request.results as! [VNFaceObservation] {
        let rect = VNImageRectForNormalizedRect(observation.boundingBox, cgImage.width, cgImage.height)
        
        let frame = CGRect(x: rect.minX ,
                           y: view.frame.height - (rect.minY + rect.height),
                           width: rect.width, height: rect.height)
        
        
        
//#-editable-code You may edit the borderWidth or borderColor of our bounding boxes.
        DispatchQueue.main.async {
            let boundingBox = UIView(frame: frame)
            boundingBox.layer.borderColor = UIColor.red.cgColor
            boundingBox.layer.borderWidth = 5
            view.addSubview(boundingBox)
        }
//#-end-editable-code
    }
    PlaygroundPage.finishExecution(PlaygroundPage.current)
}

    
//#-hidden-code

} else {
    print("You need iOS 11 for this demo.")
}

PlaygroundPage.current.assessmentStatus = .pass(message: "Isn't it amazing how a *computer* can recognize human faces? Now you know how to code it! 😎 [Next Page](@next)")
//#-end-hidden-code


