//
//  ViewController.swift
//  CountryInfo
//
//  Created by Mariola Hullings on 7/19/23.
//

import UIKit


//ViewController needs to conform to ProductSelectionDelegate

class ViewController: UIViewController, ProductSelectionDelegate {
    
    
    let ImageView = UIImageView()
    let titleLabel = UILabel()
    let chooseButton = UIButton()
    let descriptionTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func didSelectCountry(name: String, imageName: String, description: String?, gifName: String?) {
        titleLabel.text = name
        if let gifName = gifName {
              ImageView.image = getGif(named: gifName)
          } else {
              ImageView.image = UIImage(named: imageName)
          }
        ImageView.contentMode = .scaleAspectFit
        descriptionTextView.text = description
        
    }
    
    @objc func presentProductSelectionVC(){
        let destinationVC = ProductSelectionVC()
        destinationVC.delegate = self
        
        destinationVC.modalPresentationStyle = .pageSheet
        destinationVC.sheetPresentationController?.detents = [.medium()]
        destinationVC.sheetPresentationController?.prefersGrabberVisible = true
        present(destinationVC, animated: true)
    }
    
    func getGif(named imageName: String) -> UIImage? {
        guard let path = Bundle.main.path(forResource: imageName, ofType: "gif") else { return nil }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            guard let source = CGImageSourceCreateWithData(data as CFData, nil) else { return nil }
            var images: [UIImage] = []
            let imageCount = CGImageSourceGetCount(source)
            for i in 0 ..< imageCount {
                if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                    let image = UIImage(cgImage: cgImage)
                    
                    images.append(image)
                }
            }
            return UIImage.animatedImage(with: images, duration: 7.0)
        } catch {
            return nil
        }
    }
    
    func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(ImageView)
        view.addSubview(descriptionTextView)
        view.addSubview(chooseButton)
        view.backgroundColor = .white
        
        ImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        chooseButton.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        
//        productImageView.image = UIImage(named: "globe")
        if let image = getGif(named: "RotatingEarth") {
            ImageView.image = image
        } else {
            print("Failed to load gif")
        }
        
        ImageView.contentMode = .scaleAspectFit

        titleLabel.text = "Embark on a Journey of Surprising Country Facts!"
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 25, weight: .bold)
        titleLabel.textColor = .darkGray
        titleLabel.numberOfLines = 0
        
        descriptionTextView.text = ""
        descriptionTextView.textAlignment = .natural
        descriptionTextView.font = .systemFont(ofSize: 15, weight: .regular)
        descriptionTextView.textColor = .darkGray
        descriptionTextView.backgroundColor = .white
        
        chooseButton.configuration = .tinted()
        chooseButton.configuration?.baseBackgroundColor = .green
        chooseButton.configuration?.baseForegroundColor = .black
        chooseButton.configuration?.title = "Choose A Country"
        chooseButton.configuration?.image = UIImage(systemName: "mappin.and.ellipse")
        chooseButton.configuration?.imagePadding = 10
        chooseButton.addTarget(self, action: #selector(presentProductSelectionVC), for: .touchUpInside)
        
        let padding: CGFloat = 20
        let imagePadding: CGFloat = 50
        
        NSLayoutConstraint.activate([
            ImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250),
            ImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ImageView.heightAnchor.constraint(equalToConstant: 225),
            ImageView.widthAnchor.constraint(equalToConstant: 350),
            ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: imagePadding),
            ImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -imagePadding),
            
            
            titleLabel.topAnchor.constraint(equalTo: ImageView.bottomAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: ImageView.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            descriptionTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            descriptionTextView.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            descriptionTextView.bottomAnchor.constraint(equalTo: chooseButton.topAnchor, constant: -padding),
            
            chooseButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            chooseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chooseButton.heightAnchor.constraint(equalToConstant: 50),
            chooseButton.widthAnchor.constraint(equalToConstant: 260)
            
        ])
    }
    
}





