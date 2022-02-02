//
//  ViewController.swift
//  BoubyanTechAssesment
//
//  Created by elsaid yousif on 01/02/2022.
//

import UIKit
import Kingfisher
import SwiftMessages

class ArticlesListViewController: UIViewController {
    //Declarations
    var ArticlesList: [ArticleItem] = []
    private let viewModel = ArticleListViewModel()
    var spinnerView: UIView?
    @IBOutlet weak var ArticlesTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "NY Most Viewed Articles"
        setupBinders()
        //show loading indicator while calling api
        self.showLoadingIndicator()
        viewModel.getArticlesList()
    }
    
    private func setupBinders() {
        //listen for articles list changed
        viewModel.ArticlesList.bind { [weak self] articlesRes in
            if let articlesResFromAPI = articlesRes {
                if let results = articlesResFromAPI.results {
                    self?.ArticlesList = results
                    if results.count > 0 {
                        self?.ArticlesTV.reloadData()
                        self?.hideLoadingIndicator()
                    }
                }
            }
        }
        //listen for any error while callin api
        viewModel.callingApiError.bind { [weak self] error in
            if let err = error {
                if err {
                    self?.showErrorMessage(message: "Something went wrong, please try again later")
                    self?.hideLoadingIndicator()
                }
            }
        }
    }
    //show loading indicator function
    func showLoadingIndicator() {
        self.view.isUserInteractionEnabled = false
        spinnerView = UIViewController.displaySpinner(onView: self.view)
    }
    //hide loading indicator function
    func hideLoadingIndicator() {
        self.view.isUserInteractionEnabled = true
        if let sv = spinnerView{
            UIViewController.removeSpinner(spinner: sv)
        }
    }
}

extension ArticlesListViewController: UITableViewDelegate, UITableViewDataSource {
    //articles table view rows count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArticlesList.count
    }
    //set articles rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ArticlesTV.dequeueReusableCell(withIdentifier: "ArticlesCell", for: indexPath) as! ArticlesListTableViewCell
        cell.ArticleImage.kf.indicatorType = .activity
        if let articleMedia = ArticlesList[indexPath.row].media {
            if articleMedia.count > 0 {
                if let media_metadata = articleMedia[0].media_metadata {
                    if media_metadata.count > 0 {
                        if let articleImg = media_metadata[media_metadata.count - 1].url {
                            if let articleImgUrl = URL(string: articleImg) {
                                cell.ArticleImage.kf.setImage(with: articleImgUrl)
                            }
                            
                        }
                    }
                }
            }
        }
        if let articelTitle = ArticlesList[indexPath.row].title {
            cell.ArticleTitleLbl.text = articelTitle
        }
        else{
            cell.ArticleTitleLbl.text = ""
        }
        if let articleByLine = ArticlesList[indexPath.row].byline {
                cell.ArticleByLineLbl.text = articleByLine
        }
        else{
            cell.ArticleByLineLbl.text = ""
        }
        return cell
    }
    //height for each row in table
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    //if user select articel, open its details
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let articleDetailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ArticleDetailsVCtrl") as? ArticleDetailsViewController {
            articleDetailsViewController.articleItem = ArticlesList[indexPath.row]
            if let navigator = navigationController {
                navigator.pushViewController(articleDetailsViewController, animated: true)
            }
        }
    }
    
}
