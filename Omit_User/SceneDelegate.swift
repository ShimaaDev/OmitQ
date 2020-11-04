//
//  SceneDelegate.swift
//  Omit_User
//
//  Created by shimaa alwaney on 5/6/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        // check if uid saved in userdefaults
        if let id = Helper.getid()
        {
            let sb = UIStoryboard(name: "Main" ,bundle:nil)
            var vc:UIViewController
            
            if Helper.getid() != 0 {
                //skip Auth screen
                //Go to home screen
                vc = sb.instantiateViewController(withIdentifier: "home")
                window?.rootViewController = vc
                print( "user ID: \(id)")
            }else{
                print( "Faild user ID: \(id)")

                  vc = sb.instantiateInitialViewController()!
            }
            window!.rootViewController = vc
                 UIView.transition(with: window!, duration: 0.7, options: .transitionCurlUp, animations: nil, completion: nil)
        }
        
        // save token when login with facebook
        if let token = Helper.gettoken()
        {
            print( "user Token: \(token)")
            //skip Auth screen
            //Go to home screen
            
            let tab = UIStoryboard(name: "Main" ,bundle:nil).instantiateViewController(withIdentifier: "home")
            window?.rootViewController = tab
        }
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    //facebook signin func
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
            return
        }
        // calling  application func with params
        ApplicationDelegate.shared.application(
            UIApplication.shared,
            open: url,
            sourceApplication: nil,
            annotation: [UIApplication.OpenURLOptionsKey.annotation])
        
        
    }
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}



