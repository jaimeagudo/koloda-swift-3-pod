//
//  ViewController.swift
//  Koloda
//
//  Created by Eugene Andreyev on 4/23/15.
//  Copyright (c) 2015 Eugene Andreyev. All rights reserved.
//

import UIKit
import Koloda

private var numberOfCards: UInt = 5

class SwipeVC: UIViewController {
    
    @IBOutlet weak var kolodaView: KolodaView!
    
    fileprivate var dataSource: Array<UIImage> = {
        var array: Array<UIImage> = []
        for index in 0..<numberOfCards {
            array.append(UIImage(named: "Card_like_\(index + 1)")!)
        }
        
        return array
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
        
        self.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
    }
    
    
    //MARK: IBActions
    @IBAction func leftButtonTapped() {
        kolodaView?.swipe(SwipeResultDirection.left)
    }
    
    @IBAction func rightButtonTapped() {
        kolodaView?.swipe(SwipeResultDirection.right)
    }
    
    @IBAction func undoButtonTapped() {
        kolodaView?.revertAction()
    }
}

//MARK: KolodaViewDelegate
extension SwipeVC: KolodaViewDelegate {
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        dataSource.insert(UIImage(named: "Card_like_6")!, at: kolodaView.currentCardIndex - 1)
        let position = kolodaView.currentCardIndex
        kolodaView.insertCardAtIndexRange(position..<position, animated: true)
    }
    
    //    @abstract This method is called when one of cards is tapped.
    func koloda(_ koloda: KolodaView, didSelectCardAtIndex index: UInt) {
        UIApplication.shared.openURL(URL(string: "http://yalantis.com/")!)
    }
}

//MARK: KolodaViewDataSource
extension SwipeVC: KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return Int(dataSource.count)
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return UIImageView(image: dataSource[Int(index)])
    }
    
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("OverlayView",
            owner: self, options: nil)?[0] as? OverlayView
    }
}

