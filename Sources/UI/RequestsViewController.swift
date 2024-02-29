//
//  RequestsViewController.swift
//  Logix-iOS
//
//  Created by Medyannik Dmitri on 01.10.2022.
//  Copyright © 2022 Logix. All rights reserved.
//

import UIKit

class RequestsViewController: LogixBaseViewController {
    
    @IBOutlet weak var collectionView: LogixCollectionView!
    var filteredRequests: [RequestModel] = []
    var filteredAnalitics: [AnalyticsModel] = []
    var type: LogType = .network {
        didSet {
            self.collectionView.reloadData()
        }
    }
    var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSearchController()
        setupNavigation()
    
        collectionView?.register(UINib(nibName: "RequestCell", bundle:LogixBundle.getBundle()), forCellWithReuseIdentifier: "RequestCell")
        collectionView?.register(UINib(nibName: "AnaliticsCell", bundle:LogixBundle.getBundle()), forCellWithReuseIdentifier: "AnaliticsCell")
        
        filteredRequests = Storage.shared.requests
        filteredAnalitics = Storage.shared.analitics
        NotificationCenter.default.addObserver(forName: newRequestNotification, object: nil, queue: nil) { [weak self] (notification) in
            DispatchQueue.main.sync { [weak self] in
                self?.filteredRequests = self?.filterRequests(text: self?.searchController?.searchBar.text) ?? []
                self?.collectionView.reloadData()
            }
        }
        
        NotificationCenter.default.addObserver(forName: newAnaliticsNotification, object: nil, queue: nil) { [weak self] (notification) in
            DispatchQueue.main.async { [weak self] in
                self?.filteredAnalitics = Storage.shared.analitics
                self?.collectionView.reloadData()
            }
        }

        // Handling keyboard notifications
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)),
                    name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { (context) in
            //Place code here to perform animations during the rotation.
            
        }) { (completionContext) in
            //Code here will execute after the rotation has finished.
            (self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout)?.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 76)
            self.collectionView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupNavigation() {
        //let shareButtonImage = UIImage(named: "square.and.arrow.up")
        //let moreButtonImage = UIImage(named: "ellipsis.circle")
        //let homeButtonImage = UIImage(named: "arrow_left")
        
        //let moreButton = UIBarButtonItem(image: shareButtonImage, style: .plain, target: self, action: #selector(openActionSheet(_:)))
        //let typeButton = UIBarButtonItem(image: moreButtonImage,  style: .plain, target: self, action: #selector(didTapTypeButton(_:)))
        //let doneButton = UIBarButtonItem(image: homeButtonImage, style: .done, target: self, action: #selector(done))
        let moreButton = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(openActionSheet(_:)))
        let typeButton = UIBarButtonItem(title: "Type",  style: .plain, target: self, action: #selector(didTapTypeButton(_:)))
        let doneButton = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(done))
        navigationItem.rightBarButtonItems = [moreButton, typeButton]
        navigationItem.leftBarButtonItem = doneButton
    }
    
    //  MARK: - Search
    func addSearchController(){
        searchController = UISearchController(searchResultsController: nil)
        searchController?.searchResultsUpdater = self
        if #available(iOS 9.1, *) {
            searchController?.obscuresBackgroundDuringPresentation = false
        } else {
            // Fallback
        }
        searchController?.searchBar.placeholder = "Search URL"
        if let filter = Storage.defaultFilter {
            searchController?.searchBar.text = filter
        }
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        } else {
            navigationItem.titleView = searchController?.searchBar
        }
        definesPresentationContext = true
    }
    
    func filterRequests(text: String?) -> [RequestModel]{
        guard text != nil && text != "" else {
            return Storage.shared.requests
        }
        
        return Storage.shared.requests.filter { (request) -> Bool in
            return request.url.range(of: text!, options: .caseInsensitive) != nil ? true : false
        }
    }
    
    // MARK: - Actions
    @objc func didTapTypeButton(_ sender: UIBarButtonItem){
        let ac = UIAlertController()
        ac.addAction(UIAlertAction(title: "Network logs", style: .default) { [weak self] (action) in
            self?.type = .network
        })
        ac.addAction(UIAlertAction(title: "Analytics logs", style: .default) { [weak self] (action) in
            self?.type = .analitics
        })
        ac.addAction(UIAlertAction(title: "Close", style: .cancel) { (action) in
        })
        if UIDevice.current.userInterfaceIdiom == .pad {
            ac.popoverPresentationController?.barButtonItem = sender
        }
        present(ac, animated: true, completion: nil)
    }
    
    @objc func openActionSheet(_ sender: UIBarButtonItem){
        let ac = UIAlertController()
        ac.addAction(UIAlertAction(title: "Clear", style: .default) { [weak self] (action) in
            self?.clearRequests()
        })
        ac.addAction(UIAlertAction(title: "Share", style: .default) { [weak self] (action) in
            self?.shareContent(sender)
        })
        ac.addAction(UIAlertAction(title: "Share as cURL", style: .default) { [weak self] (action) in
            self?.shareContent(sender, requestExportOption: .curl)
        })
        ac.addAction(UIAlertAction(title: "Share as Postman Collection", style: .default) { [weak self] (action) in
            self?.shareContent(sender, requestExportOption: .postman)
        })
        ac.addAction(UIAlertAction(title: "Close", style: .cancel) { (action) in
        })
        if UIDevice.current.userInterfaceIdiom == .pad {
            ac.popoverPresentationController?.barButtonItem = sender
        }
        present(ac, animated: true, completion: nil)
    }
    
    func clearRequests() {
        Storage.shared.clearData()
        filteredRequests = Storage.shared.requests
        filteredAnalitics = Storage.shared.analitics
        collectionView.reloadData()
    }
    
    func shareContent(_ sender: UIBarButtonItem, requestExportOption: RequestResponseExportOption = .flat){
        //TODO: - добавить шаринг аналитики
        ShareUtils.shareRequests(presentingViewController: self, sender: sender, requests: filteredRequests, requestExportOption: requestExportOption)
    }
    
    // MARK: - Navigation
    @objc func done(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func openRequestDetailVC(request: RequestModel){
        let storyboard = UIStoryboard(name: "Flow", bundle: LogixBundle.getBundle())
        if let requestDetailVC = storyboard.instantiateViewController(withIdentifier: "RequestDetailViewController") as? RequestDetailViewController{
            requestDetailVC.request = request
            self.show(requestDetailVC, sender: self)
        }
    }
    
    func openAnaliticsDetailVC(with analytics: AnalyticsModel){
        let storyboard = UIStoryboard(name: "Flow", bundle: LogixBundle.getBundle())
        if let requestDetailVC = storyboard.instantiateViewController(withIdentifier: "AnaliticsDetailViewController") as? AnalyticsDetailViewController{
            requestDetailVC.analytics = analytics
            self.show(requestDetailVC, sender: self)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: newRequestNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: newAnaliticsNotification, object: nil)
    }

    // MARK: - Keyboard management
    @objc
    func keyboardWillShow(_ notification: NSNotification) {
        let userInfo = notification.userInfo
        guard let keyboardFrame = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }

        let contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardFrame.height, right: 0.0)
        collectionView.contentInset = contentInset
        collectionView.scrollIndicatorInsets = contentInset
    }

    @objc
    func keyboardWillHide(_ notification: NSNotification) {
        collectionView.contentInset = .zero
        collectionView.scrollIndicatorInsets = .zero
    }

}

extension RequestsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch type {
        case .network:
            return filteredRequests.count
        case .analitics:
            return filteredAnalitics.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch type {
        case .network:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RequestCell", for: indexPath) as! RequestCell
            cell.populate(request: filteredRequests[indexPath.item])
            return cell
        case .analitics:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnaliticsCell", for: indexPath) as! AnaliticsCell
            cell.populate(event: filteredAnalitics[indexPath.item])
            return cell
        }
    }
}

extension RequestsViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch type {
        case .network:
            openRequestDetailVC(request: filteredRequests[indexPath.item])
        case .analitics:
            openAnaliticsDetailVC(with: filteredAnalitics[indexPath.item])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 76)
    }
}

// MARK: - UISearchResultsUpdating Delegate
extension RequestsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        //TODO: - добавить аналитику
        filteredRequests = filterRequests(text: searchController.searchBar.text)
        collectionView.reloadData()
    }
}
