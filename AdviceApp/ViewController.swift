import UIKit

class ViewController: UIViewController {
    let label: UILabel = {
        let label = UILabel()
        label.text = "Tap the buttom for advice!"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Get advice", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupLayout()
        button.addTarget(self, action: #selector(getAdvice), for: .touchUpInside)
    }

    func setupLayout() {
        view.addSubview(label)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func getAdvice() {
        let urlString = "https://api.adviceslip.com/advice"
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let advice = try JSONDecoder().decode(Advice.self, from: data)
                
                DispatchQueue.main.async {
                    self.label.text = advice.slip.advice
                }
            } catch {
                print("Erro ao fazer parse")
            }
        }
        task.resume()
    }
}

struct Slip: Decodable {
    let id: Int
    let advice: String
}

struct Advice: Decodable {
    let slip: Slip
}
