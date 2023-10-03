

import UIKit
import STTabbar

 class CustomTabbarController: UITabBarController {
     
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tabBar = { () -> STTabbar in
               let tabBar = STTabbar()
            tabBar.centerButtonColor = UIColor(named: "BlueCustomColor")//.purple
            tabBar.buttonImage = UIImage(named: "Plus")
            
           // tabBar.buttonTitle = "FF"
            tabBar.tabbarColor = .gray
            tabBar.centerButtonActionHandler = {
                print("BITTONPRESSED")
                let vc = CreateNewPostViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
               tabBar.delegate = self
            
               return tabBar
           }()
           self.setValue(tabBar, forKey: "tabBar")
        
        let controller1 = ProfileViewController()
               controller1.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 0)
               let nav1 = UINavigationController(rootViewController: controller1)

               let controller2 = FeedViewController()
               controller2.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "doc.richtext"), tag: 1)
               let nav2 = UINavigationController(rootViewController: controller2)
        
        let conttroller3 = FafouritesPostsViewController()
        conttroller3.tabBarItem = UITabBarItem(title: "Избранные", image: UIImage(systemName: "heart"), tag: 2)
        let nav3 = UINavigationController(rootViewController: conttroller3)
        
        let controller4 = NewsViewController()//FirstViewController()
        controller4.tabBarItem = UITabBarItem(title: "Новости", image: UIImage(systemName: "newspaper"), tag: 3)
        let nav4 = UINavigationController(rootViewController: controller4)
                                               
        viewControllers = [nav1, nav2, nav3, nav4]
        
        tabBar.items?[0].titlePositionAdjustment = UIOffset(horizontal: -5.0, vertical: 0.0)
        tabBar.items?[1].titlePositionAdjustment = UIOffset(horizontal: -35.0, vertical: 0.0)
        tabBar.items?[2].titlePositionAdjustment = UIOffset(horizontal: 25.0, vertical: 0.0)
        tabBar.items?[3].titlePositionAdjustment = UIOffset(horizontal: -1.0, vertical: 0.0)
       }
  
        
        
     
               }
               
   



