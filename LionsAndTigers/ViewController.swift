//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Jacob Perez on 1/26/15.
//  Copyright (c) 2015 Jacob Perez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    // create an empty tiger array
    var myTigers:[Tiger] = []
    
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
        //  this adds myTiger and it's properties into the array myTigers
        self.myTigers.append(myTiger)
        
        println ("My tiger's name is \(myTiger.name), it's age is \(myTiger.age), it's breed is \(myTiger.breed) and its image is \(myTiger.image)")
        
        myImageView.image = myTiger.image
        nameLabel.text = myTiger.name
        ageLabel.text = "\(myTiger.age)"
        breedLabel.text = myTiger.breed
        randomFactLabel.text = myTiger.randomFact()
        
        //  three more instances of the tigers
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named:"IndochineseTiger.jpg")
        
        secondTiger.age = myTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named:"MalayanTiger.jpg")
        
        thirdTiger.age = myTiger.ageInTigerYearsFromAge(thirdTiger.age)
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named:"SiberianTiger.jpg")
        
        fourthTiger.age = myTiger.ageInTigerYearsFromAge(fourthTiger.age)
        
        // += shorthand adds the remaining tiger instances to the array
        self.myTigers += [secondTiger, thirdTiger, fourthTiger]
        
        myTiger.chuffANumberOfTimes(15, isLoud:false)
        secondTiger.chuffANumberOfTimes(1)
        thirdTiger.chuffANumberOfTimes(1)
        fourthTiger.chuffANumberOfTimes(1)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        
        var randomIndex:Int
        
        // DO loop below will run until the two are NOT equal
        do {
            randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        } while currentIndex == randomIndex
        
        self.currentIndex = randomIndex
        
        println(myTigers)
        
        //     GENERATING A RANDOM NUMBER BUT SOMETIMES REPEATS A NUMBER
        //let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        
        let tiger = myTigers[randomIndex]
//        myImageView.image = tiger.image
//        nameLabel.text = tiger.name
//        ageLabel.text = "\(tiger.age)"
//        breedLabel.text = tiger.breed
        
        // Creates a transition between each tiger instance
        UIView.transitionWithView(self.view, duration: 0.5, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            self.myImageView.image = tiger.image
            self.nameLabel.text = tiger.name
            self.ageLabel.text = "\(tiger.age)"
            self.breedLabel.text = tiger.breed
            self.randomFactLabel.text = tiger.randomFact()
            
            }, completion: { (finished: Bool) ->() in })
        
        
   
    
    }

}

