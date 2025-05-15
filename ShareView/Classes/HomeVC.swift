//
//  HomeVC.swift
//  ShareView
//
//  Created by Nirzar Gandhi on 14/05/25.
//

import UIKit

class HomeVC: BaseVC {
    
    // MARK: - IBOutlets
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var shareBtn: UIButton!
    
    
    // MARK: - Properties
    
    
    // MARK: -
    // MARK: - View init Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        
        self.setControlsProperty()
        self.setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.tintColor = .white
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
    }
    
    fileprivate func setControlsProperty() {
        
        self.view.backgroundColor = .white
        self.view.isOpaque = false
        
        // Container
        self.container.backgroundColor = .black
        self.container.addRadiusWithBorder(radius: 10.0)
        self.container.clipsToBounds = true
        
        // Profile Image View
        self.profileImgView.backgroundColor = .white
        self.profileImgView.layer.cornerRadius = self.profileImgView.frame.width / 2.0
        self.profileImgView.layer.masksToBounds = true
        
        // Name Label
        self.nameLabel.backgroundColor = .clear
        self.nameLabel.textColor = .white
        self.nameLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        self.nameLabel.numberOfLines = 0
        self.nameLabel.textAlignment = .left
        self.nameLabel.text = ""
        
        // Desc Label
        self.descLabel.backgroundColor = .clear
        self.descLabel.textColor = .white
        self.descLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        self.descLabel.numberOfLines = 0
        self.descLabel.textAlignment = .left
        self.descLabel.text = ""
        
        // SHare Buttton
        self.shareBtn.setBackgroundColor(color: .black, forState: .normal)
        self.shareBtn.setTitleColor(.white, for: .normal)
        self.shareBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        self.shareBtn.titleLabel?.lineBreakMode = .byClipping
        self.shareBtn.layer.masksToBounds = true
        self.shareBtn.addRadiusWithBorder(radius: 10.0)
        self.shareBtn.showsTouchWhenHighlighted = false
        self.shareBtn.adjustsImageWhenHighlighted = false
        self.shareBtn.adjustsImageWhenDisabled = false
        self.shareBtn.setTitle("Share", for: .normal)
    }
}


// MARK: - Call Back
extension HomeVC {
    
    fileprivate func setData() {
        
        self.nameLabel.text = "Dummy Person"
        
        self.descLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
    }
    
    fileprivate func takeScreenShot() {
        
        DispatchQueue.main.async {
            
            if let image = self.container.getScreenshot(isPng: true) {
                self.openActivityVC(image: image)
            } else {
                self.showAlertMessage(titleStr: "Error", message: Constants.Generic.IMAGE_GENERATE_ERROR)
            }
        }
    }
}


// MARK: - Button Touch & Action
extension HomeVC {
    
    @IBAction func shareBtnTouch(_ sender: UIButton) {
        self.takeScreenShot()
    }
}
