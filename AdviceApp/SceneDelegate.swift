import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      guard let windowScene = scene as? UIWindowScene else { return }
    
      var view = AdviceViewController()
      var presenter: AdviceViewToPresenter & AdviceInteractorToPresenter = AdvicePresenter()
      var interactor: AdvicePresentorToInteractor = AdviceInteractor()

      view.presenter = presenter
      presenter.view = view
//              presenter.router = router
      presenter.interactor = interactor
      interactor.presenter = presenter

    window = UIWindow(frame: .zero)
    window?.makeKeyAndVisible()
    window?.rootViewController = view
    window?.windowScene = windowScene
  }
}
