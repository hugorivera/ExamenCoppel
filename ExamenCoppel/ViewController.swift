//
//  ViewController.swift
//  ExamenCoppel
//
//  Created by Hugo Rivera on 11/11/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnNews(_ sender: Any) {
        let vcNews = NewsRouter.createModule()
        let navigationController = UINavigationController(rootViewController: vcNews)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func btnRegistration(_ sender: Any) {
        let sceneFactory = DefaultSceneFactory()
        sceneFactory.configurator = DefaultRegistrationConfigurator(sceneFactory: sceneFactory)
        let navController = UINavigationController(rootViewController: sceneFactory.makeLogicScene())
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }

}

