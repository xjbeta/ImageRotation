//
//  ViewController.swift
//  ImageRotation
//
//  Created by xjbeta on 2019/9/6.
//  Copyright © 2019 xjbeta. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var imageView: NSImageView!
    
    @IBAction func rotate(_ sender: Any) {
        imageView.rotate()
    }
    
    @IBAction func resume(_ sender: Any) {
        imageView.resumeAnimation()
    }
    
    @IBAction func pause(_ sender: Any) {
        imageView.pauseAnimation()
    }
    
    @IBAction func removeAll(_ sender: Any) {
        imageView.layer?.removeAllAnimations()
    }
    
    @IBAction func setAnchorPoint(_ sender: Any) {
        imageView.setAnchorPoint(anchorPoint: .init(x: 0.5, y: 0.5))
    }
    
    var oo: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        oo = view.observe(\.frame, options: [.initial, .new]) { (view, changes) in
            print(changes)
            // Update AnchorPoint when window resize.
            // fix rotate around the 0, 0 after window resize.
            self.imageView.setAnchorPoint(anchorPoint: .init(x: 0.5, y: 0.5))
            
        }
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    deinit {
        oo?.invalidate()
    }
    
}

