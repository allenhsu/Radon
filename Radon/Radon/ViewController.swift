//
//  ViewController.swift
//  Radon
//
//  Created by Allen Hsu on 2018/12/14.
//  Copyright © 2018 Glow, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        let allen = User(name: "Allen", job: "iOS Engineer")
        let nella = User(name: "Nella", job: "Reenigne SOi")
        
        let users = [allen, nella]
        let result = Element<NameCard>(props: NameCardProps(children: nil, user: allen))
        //print(result)
        let root = Element<NameCardList>(props: NameCardListProps(children: nil, users: users))
        
        print(Render.render(root))
    }
}

