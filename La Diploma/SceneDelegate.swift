

import UIKit
import STTabbar

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let scene = (scene as? UIWindowScene) else { return }
     window = UIWindow(windowScene: scene)
        let nvc = UINavigationController(rootViewController: CustomViewController())
        window?.rootViewController = nvc//createTabBarController()
        window?.makeKeyAndVisible()

    }
    
  private func createProfileViewController() -> UINavigationController {
        let profileViewController = CustomViewController()//ProfileViewController() // AuthViewController()
        profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 0)
        return UINavigationController(rootViewController: profileViewController)
    }

   private func createFeedViewController() -> UINavigationController {
        let feedViewController = FeedViewController()
        feedViewController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "doc.richtext"), tag: 1)
        return UINavigationController(rootViewController: feedViewController)
    }
    
   private func createFavPostsViewController() -> UINavigationController {
        let favPostsVC = FafouritesPostsViewController()
        favPostsVC.tabBarItem = UITabBarItem(title: "Избранные", image: UIImage(systemName: "heart"), tag: 2)
        return UINavigationController(rootViewController: favPostsVC)
    }
    
   private func createTabBarController() -> UITabBarController {
    
       let tabBarController = UITabBarController()
//       let tabBarController: UITabBarController = {
//           let tbc = UITabBarController()
//           let x = STTabbar()
//           x.backgroundColor = .purple
//           if let myTabbar = tbc.tabBar as? STTabbar {
//               myTabbar.backgroundColor = .red
//               myTabbar.centerButtonColor = .blue
//               myTabbar.centerButtonHeight = 50
//               myTabbar.padding = 15
//           }
//
//           return tbc
//       }()
       
       
       
       UITabBar.appearance().backgroundColor = .systemGray4
        tabBarController.viewControllers = [createProfileViewController(), createFeedViewController(),createFavPostsViewController()]
      
        return tabBarController
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
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

        // Save changes in the application's managed object context when the application transitions to the background.
//        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

