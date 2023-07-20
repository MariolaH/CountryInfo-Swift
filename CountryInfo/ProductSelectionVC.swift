//
//  ProductSelectionVC.swift
//  CountryInfo
//
//  Created by Mariola Hullings on 7/19/23.
//

import UIKit

//this file is the boss

//list of commands - protocol ie. job description
protocol ProductSelectionDelegate {
    func didSelectCountry(name: String, imageName: String, description: String?, gifName: String?)
}

class ProductSelectionVC: UIViewController {
    
    let CanadaButton = UIButton()
    let CroatiaButton = UIButton()
    let EnglandButton = UIButton()
    let HomeButton = UIButton()
    
//    job position
    var delegate: ProductSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func CanadaButtonTapped() {
        delegate?.didSelectCountry(name: "Canada", imageName: "CanadianFlag", description: "Canada is home to the longest street in the world. \n\nThe longest coastline in the world is in Canada. \n\nA bear from Canada inspired Winnie the Pooh. \n\nCanada has 20% of the world's fresh water. \n\nThere are over 55,000 different species of insects in Canada.\n\nCanadians consume more macaroni and cheese that any other nation.\n\n“Hawaiian” pizza was actually invented by an Ontario man.\n\nThe lowest temperature ever recorded in Canada was -81.4F (-63C).", gifName: nil)
        dismiss(animated: true)
    }
    
    @objc func CroatiaButtonTapped() {
        delegate?.didSelectCountry(name: "Croatia", imageName: "CroatiaFlag", description: "Croatia's town of Hum is the smallest town in the world. \n\nCroatia has the highest number of UNESCO intangible goods in Europe.\n\nTheir old currency is named after a rodent.\n\nThe origins of Dalmatians stem from Croatia.\n\nHome to the world's biggest truffle.\n\nGame of Thrones was filmed in Croatia.\n\nCroatia has 1246 islands, isles and imlets to sail through.", gifName: nil)
        dismiss(animated: true)
    }
    
    @objc func EnglandButtonTapped() {
        delegate?.didSelectCountry(name: "England", imageName: "EnglandFlag", description: "There is A Difference Between the UK and Great Britain. \n\nStonehenge Is Older Than the Pyramids.\n\nThe Queen of England Created a New Dog Breed.\n\nLondon Bridge is No Longer in London.\n\nAll the Swans Are Royal.\n\nThe country's currency is the British pound sterling (£).\n\nStonehenge, a prehistoric monument located in Wiltshire, England, is one of the most famous landmarks in the world.\n\nThe Beatles, one of the most influential rock bands of all time, originated in Liverpool, England.", gifName: nil)
        dismiss(animated: true)
    }
    
    @objc func HomeButtonTapped() {
        delegate?.didSelectCountry(name: "Embark on a Journey of Surprising Country Facts!", imageName: "RotatingEarth", description: nil, gifName: "RotatingEarth")
        dismiss(animated: true)
    }
    
    
    func setupUI() {
        view.addSubview(CanadaButton)
        view.addSubview(CroatiaButton)
        view.addSubview(EnglandButton)
        view.addSubview(HomeButton)
        view.backgroundColor = .white
        
        CanadaButton.translatesAutoresizingMaskIntoConstraints = false
        CroatiaButton.translatesAutoresizingMaskIntoConstraints = false
        EnglandButton.translatesAutoresizingMaskIntoConstraints = false
        HomeButton.translatesAutoresizingMaskIntoConstraints = false
        
        CanadaButton.configuration = .tinted()
        CanadaButton.configuration?.title = "Canada"
        CanadaButton.configuration?.image = UIImage(systemName: "snowflake")
        CanadaButton.configuration?.imagePadding = 8
        CanadaButton.configuration?.baseForegroundColor = .black
        CanadaButton.configuration?.baseBackgroundColor = .red
        CanadaButton.addTarget(self, action: #selector(CanadaButtonTapped), for: .touchUpInside)
        
        CroatiaButton.configuration = .tinted()
        CroatiaButton.configuration?.title = "Croatia"
        CroatiaButton.configuration?.image = UIImage(systemName: "beach.umbrella")
        CroatiaButton.configuration?.imagePadding = 8
        CroatiaButton.configuration?.baseForegroundColor = .black
        CroatiaButton.configuration?.baseBackgroundColor = .systemBlue
        CroatiaButton.addTarget(self, action: #selector(CroatiaButtonTapped), for: .touchUpInside)
        
        EnglandButton.configuration = .tinted()
        EnglandButton.configuration?.title = "England"
        EnglandButton.configuration?.image = UIImage(systemName: "cup.and.saucer")
        EnglandButton.configuration?.imagePadding = 8
        EnglandButton.configuration?.baseForegroundColor = .black
        EnglandButton.configuration?.baseBackgroundColor = .systemGray2
        EnglandButton.addTarget(self, action: #selector(EnglandButtonTapped), for: .touchUpInside)
        
        HomeButton.configuration = .tinted()
        HomeButton.configuration?.title = "Home"
        HomeButton.configuration?.image = UIImage(systemName: "house")
        HomeButton.configuration?.imagePadding = 8
        HomeButton.configuration?.baseForegroundColor = .black
        HomeButton.configuration?.baseBackgroundColor = .systemGreen
        HomeButton.addTarget(self, action: #selector(HomeButtonTapped), for: .touchUpInside)
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            CroatiaButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -padding),
            CroatiaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            CroatiaButton.heightAnchor.constraint(equalToConstant: 50),
            CroatiaButton.widthAnchor.constraint(equalToConstant: 280),
            

            CanadaButton.bottomAnchor.constraint(equalTo: CroatiaButton.topAnchor, constant: -padding),
            CanadaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            CanadaButton.heightAnchor.constraint(equalToConstant: 50),
            CanadaButton.widthAnchor.constraint(equalToConstant: 280),
            
            EnglandButton.topAnchor.constraint(equalTo: CroatiaButton.bottomAnchor, constant: padding),
            EnglandButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            EnglandButton.heightAnchor.constraint(equalToConstant: 50),
            EnglandButton.widthAnchor.constraint(equalToConstant: 280),
            
            HomeButton.topAnchor.constraint(equalTo: EnglandButton.bottomAnchor, constant: padding),
            HomeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            HomeButton.heightAnchor.constraint(equalToConstant: 50),
            HomeButton.widthAnchor.constraint(equalToConstant: 280)
            
        ])
    }
}


