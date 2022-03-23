//
//  ViewController.swift
//  WhatFlower
//
//  Created by Yelim Kim on 24/2/22.
//

import UIKit
import CoreML
import Vision
import Alamofire
import SwiftyJSON
import SDWebImage
import ColorThiefSwift

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    let imagePicker = UIImagePickerController()
    let wikipediaURl = "https://en.wikipedia.org/w/api.php"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let userPickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
//            imageView.image = userPickedImage
            
            guard let ciimage = CIImage(image: userPickedImage) else {
                fatalError("failed to convert UIImage to CIImage")
            }

            detect(image: ciimage)

        }

        imagePicker.dismiss(animated: true, completion: nil)

    }

    func detect(image: CIImage) {

        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else {
            fatalError("Loading CoreML Model failed")
        }

        let request = VNCoreMLRequest(model: model) { request, error in
            guard let results = request.results?.first as? VNClassificationObservation else {
                fatalError("Model failed to process Image")
            }
//            if let firstResult = results.first {
            self.navigationItem.title = results.identifier.capitalized
//                if firstResult.identifier.contains("hotdog") {
//                    self.navigationItem.title = "Hotdog!!!!!"
//                } else {
//                    self.navigationItem.title = "Not Hotdog!!!!"
//                }
//            }
            
            self.requestInfo(flowerName: results.identifier)
        }

        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }

    }

    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }

    func requestInfo(flowerName: String){
        let parameters : [String:String] = [
          "format" : "json",
          "action" : "query",
          "prop" : "extracts|pageimages",
          "exintro" : "",
          "explaintext" : "",
          "titles" : flowerName,
          "indexpageids" : "",
          "redirects" : "1",
          "pithumbsize": "500"
          ]
        Alamofire.request(wikipediaURl, method: .get, parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess {
                print("Got the wikipedia info")
                print(response)
                let flowerJSON: JSON = JSON(response.result.value!)
                let pageId = flowerJSON["query"]["pageids"][0].stringValue
                let flowerDescription = flowerJSON["query"]["pages"][pageId]["extract"].stringValue
                let flowerImageURL = flowerJSON["query"]["pages"][pageId]["thumbnail"]["source"].stringValue
                
                self.label.text = flowerDescription
                print(flowerImageURL)
                self.imageView.sd_setImage(with: URL(string: flowerImageURL)) { image, error, cache, url in
                    if let currentImage = self.imageView.image {
                        guard let dominantColor = ColorThief.getColor(from: currentImage) else {
                            fatalError("can't get dominant color")
                        }
                        
                        DispatchQueue.main.async {
                            self.navigationController?.navigationBar.isTranslucent = true
                            self.navigationController?.navigationBar.barTintColor = dominantColor.makeUIColor()
                        }
                    } else {
                        self.label.text = "Could not get information on flower from Wikipedia"
                    }
                    
                    
                }

                
            }
        }
    }
}

