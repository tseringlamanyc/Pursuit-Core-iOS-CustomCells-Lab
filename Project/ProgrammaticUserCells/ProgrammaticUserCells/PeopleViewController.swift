import UIKit

class PeopleViewController: UIViewController {
    
    private let peopleView = PeopleView()
    
    private var users = [User]() {
        didSet {
            DispatchQueue.main.async {
            self.peopleView.collectionView.reloadData()
            }
        }
    }
    
    override func loadView() {
        view = peopleView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        peopleView.collectionView.dataSource = self
        peopleView.collectionView.delegate = self
        peopleView.collectionView.register(UINib(nibName: "PeopleCell", bundle: nil), forCellWithReuseIdentifier: "peopleCell")
        loadUsers()
    }
    
    func loadUsers() {
        guard let fileURL = Bundle.main.url(forResource: "randomUserSampleResponse", withExtension: "json") else {
            fatalError()
        }
        do {
           let data = try Data(contentsOf: fileURL)
           let things = User.getUsers(from: data)
            users = things
        } catch {
            print("nope")
        }
    }
    
//    func loadPeople() {
//        UsersFetchingService.manager.getUsers { [weak self] (result) in
//            switch result {
//            case .failure(_):
//                print("error")
//            case .success(let data):
//                self?.users = data
//            }
//        }
//    }
    
}

extension PeopleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "peopleCell", for: indexPath) as? PeopleCell else {
            fatalError()
        }
        let aUser = users[indexPath.row]
        cell.configureCell(user: aUser)
        cell.backgroundColor = .systemGray
        return cell
    }
    
    
}

extension PeopleViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxSize.width * 0.95
        return CGSize(width: itemWidth, height: 120)
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
}

