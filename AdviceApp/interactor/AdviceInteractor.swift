import Foundation

class AdviceInteractor: AdvicePresentorToInteractor {
    var presenter: AdviceInteractorToPresenter?
    
    func fetchAdvice() {
        let urlString = "https://api.adviceslip.com/advice"
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let advice = try JSONDecoder().decode(Advice.self, from: data)
                
                self.presenter?.adviceFetched(advice: advice)
//                self.view?.showAdvice(advice: advice.slip.advice)
            } catch {
                self.presenter?.adviceFetchedFailed()
            }
        }
        task.resume()
    }
}
