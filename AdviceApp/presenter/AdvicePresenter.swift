import Foundation

class AdvicePresenter: AdviceViewToPresenter {
    var interactor: AdvicePresentorToInteractor?
//    var router: AdvicePresenterToRouter?
    var view: AdvicePresenterToView?

    func getAdvice() {
        interactor?.fetchAdvice()
    }
}

extension AdvicePresenter: AdviceInteractorToPresenter {
    func adviceFetched(advice: Advice) {
        view?.showAdvice(advice: advice.slip.advice)
    }
    
    func adviceFetchedFailed() {
        print("erro!!!")
    }
    
    
}
