//
//  DetailViewController.swift
//  colleges
//
//  Created by mohammed alhazmi on 7/6/15.
//  Copyright © 2015 mohammed alhazmi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var locationTextView: UITextField!
    @IBOutlet weak var studentTextView: UITextField!
    var imagePicker : UIImagePickerController!
    var college : College!
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        collegeTextField.text = college.name
        locationTextView.text = college.location
        studentTextView.text = String(college.student)
        imageView.image = college.image
        websiteTextField.text = college.website
    }
    
    @IBAction func cameraButtonTapped(sender: UIBarButtonItem) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            imagePicker.sourceType = .Camera
        }
        else {
            imagePicker.sourceType = .PhotoLibrary
        }
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        dismissViewControllerAnimated(true) { () -> Void in
            if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
                self.imageView.image = image
            }
        }
    }
    
    @IBAction func displayWebsiteTapped(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: college.website)!)
        
    }
    
    @IBAction func onTappedSaveButton(sender: AnyObject) {
        college.image = imageView.image!
        college.name = collegeTextField.text!
        college.location = locationTextView.text!
        college.student = Int(studentTextView.text!)!
        //college.website = websiteTextField.text!
        
        let url = websiteTextField.text!
        college.website = url
        
    }
    
}