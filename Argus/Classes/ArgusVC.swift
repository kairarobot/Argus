//
//  ARViewController.swift
//  ARView
//
//  Created by Kaira Villanueva on 5/22/16.
//  Copyright © 2016 Kaira. All rights reserved.
//

import Foundation
import UIKit

class ArgusVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let arImageView = UIImageView()
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidAppear(_ animated: Bool) {
        // * Call the AR VIEW
        setUpARView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func setUpARView() {
        
        arImageView.frame.size.width = self.view.frame.size.width
        arImageView.frame.size.height = self.view.frame.size.height
        
        imagePicker.delegate = self
        
        // * User is not allowed to edit image or movie
        imagePicker.allowsEditing = false
        
        // * User can access camera
        imagePicker.sourceType = .camera
        
        // * Hide camera default controls
        imagePicker.showsCameraControls = false
        
        // * Spreads out the camera view to full screen
        imagePicker.cameraViewTransform = CGAffineTransform(scaleX: 2, y: 2)
        
        // * Pop up view with camera
        present(imagePicker, animated: true, completion: nil)
        
        // * Add overlay to camera
        imagePicker.cameraOverlayView = cameraOverlay()
        
    }
    
    // * Create a camera overlay
    func cameraOverlay() -> UIView {
        
        // * Define camera overlay with frame
        let cam_overlay: UIView! = UIView(frame: CGRect(x: 0, y: 0, width: arImageView.frame.width, height: arImageView.frame.height))
        
        // * Camera overlay set background to transparent
        cam_overlay.backgroundColor = UIColor.white.withAlphaComponent(0.01)
        
        // * Duplicates behavior of the view's autoresizing mask
        cam_overlay.translatesAutoresizingMaskIntoConstraints = true
        
        // * Int bit mask lets the receiver resizes itself when its superview’s bounds change
        cam_overlay.autoresizingMask = [ .flexibleTopMargin, .flexibleBottomMargin,
                                         .flexibleLeftMargin, .flexibleRightMargin ]
        
        // * Center of the frame within the view
        cam_overlay.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        
        // * Text to display on camera overlay
        // * This is an example -- feel free to change anything
        let sampleText = UILabel(frame: CGRect(x: (arImageView.frame.width / 2) - 50, y: (arImageView.frame.height / 2) - 50, width: 100, height: 100))
        sampleText.text = "AR VIEW"
        
        // * Adds button to camera overlay
        cam_overlay.addSubview(sampleText)
        
        return cam_overlay
    }
    
    
}
