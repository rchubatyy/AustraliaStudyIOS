//
//  HomeViewController.swift
//  AustraliaStudy
//
//  Created by user157559 on 1/12/20.
//  Copyright © 2020 Australia Study. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var logoAS: UIImageView!
    @IBOutlet var items: [UIImageView]!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureASLogo()
        for item in items{
            let tap = UITapGestureRecognizer(target: self, action: #selector(goToScreen))
            item.addGestureRecognizer(tap)
        }
  
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool){
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func goToScreen(sender: UITapGestureRecognizer){
        guard let pos = sender.view?.tag else { return }
        performSegue(withIdentifier: SEGUES[pos-1], sender: nil)
    }
    
    fileprivate func configureASLogo(){
        let logo = CIImage(image: logoAS.image!)
        let brightnessFilter = CIFilter(name: "CIColorControls")
        brightnessFilter?.setValue(logo, forKey: kCIInputImageKey)
        brightnessFilter?.setValue(1, forKey: kCIInputBrightnessKey)
        if let ciimage = brightnessFilter?.outputImage {
            let newLogo = ciimage
            logoAS.image = UIImage(ciImage: newLogo)
        }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
