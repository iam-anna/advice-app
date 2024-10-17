
protocol AdvicePresenterToView {
    func showAdvice(advice: String)
    func showError(error: Error)
}

protocol AdviceInteractorToPresenter {
    func adviceFetched(advice: Advice)
    func adviceFetchedFailed()
}

protocol AdvicePresentorToInteractor {
    var presenter: AdviceInteractorToPresenter? { get set }
    
    func fetchAdvice()
}

protocol AdviceViewToPresenter {
    var view: AdvicePresenterToView? { get set }
    var interactor: AdvicePresentorToInteractor? { get set }
//    var router: AdvicePresenterToRouter? { get set }
    
    func getAdvice()
}


//protocol AdvicePresenterToRouter {
//    static func createModule() -> UIViewController
//}
