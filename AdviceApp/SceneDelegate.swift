import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = scene as? UIWindowScene else { return }
    let navigationController = ViewControllerg()
    window = UIWindow(frame: .zero)
    window?.makeKeyAndVisible()
    window?.rootViewController = navigationController
    window?.windowScene = windowScene
  }
}
