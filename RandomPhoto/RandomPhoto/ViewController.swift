//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Viponpreet Kaur on 2022-02-07.
//

import UIKit

class ViewController: UIViewController {
    //bring in image view  every time button tapped
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        // dont want image to stretch and look weird
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Pic", for: .normal) // for normal state
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let colours: [UIColor] = [.systemRed , .systemBlue,.systemPink, .systemGreen , .systemOrange,.systemPurple, .systemYellow]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        //add to view
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        //center the image view of the main view
        imageView.center=view.center
        view.addSubview(button)
        // attaches to button
        //touchupinside is a simple tap action for that function to be called
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    @objc func didTapButton(){ //objc needed to attach to button
        getRandomPic()
        view.backgroundColor = colours.randomElement()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 30, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)

    }
    func getRandomPic(){
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else{
            return
        }
        //image view is set to a new UIImage with data from the internet
        imageView.image = UIImage(data: data)
    }


}

