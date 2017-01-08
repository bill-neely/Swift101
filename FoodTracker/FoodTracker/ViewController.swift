//
//  ViewController.swift
//  FoodTracker
//
//  Created by Bill Neely on 1/6/17.
//  Copyright © 2017 Food Demo Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Handle the text field's user input through delegate callbacks
        nameTextField.delegate = self
    }
    
    // MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //Hide the keyboard
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library 
        let imagePickerController = UIImagePickerController()
        
        // only allow photos to be picked, not taken
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure the ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representations of the image, You want to use the orignal.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as?
            UIImage else {
                fatalError("Expected a dictionary containing the iamge but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image
        photoImageView.image = selectedImage
        
        // Dismiss the picker
        dismiss(animated: true, completion: nil)        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismis the pciker if the user canceled
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
}

