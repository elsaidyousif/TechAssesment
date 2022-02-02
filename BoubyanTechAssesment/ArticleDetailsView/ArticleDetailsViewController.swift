//
//  ArticleDetailsViewController.swift
//  BoubyanTechAssesment
//
//  Created by elsaid yousif on 02/02/2022.
//

import UIKit
import Kingfisher

class ArticleDetailsViewController: UIViewController {

    //declarations
    var articleItem : ArticleItem?
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitleLbl: UILabel!
    @IBOutlet weak var articleDateLbl: UILabel!
    @IBOutlet weak var articleByLineLbl: UILabel!
    @IBOutlet weak var articleAbstractLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        //set view controller tilte
        self.title = "Article Details"
        //lazy load article image and load it from cache if available
        articleImage.kf.indicatorType = .activity
        //get article image from article item loaded from api
        if let article = articleItem {
            if let articleMedia = article.media {
                if articleMedia.count > 0 {
                    if let media_metadata = articleMedia[0].media_metadata {
                        if media_metadata.count > 0 {
                            if let articleImg = media_metadata[media_metadata.count - 1].url {
                                if let articleImgUrl = URL(string: articleImg) {
                                    articleImage.kf.setImage(with: articleImgUrl)
                                }
                                
                            }
                        }
                    }
                }
            }
            //dispaly title for selected artice
            if let title = article.title {
                articleTitleLbl.text = title
            }
            //dispaly title for selected artice
            if let date = article.published_date {
                articleDateLbl.text = "Published date: \(date)"
            }
            //dispaly byLine for selected article
            if let byLine = article.byline {
                articleByLineLbl.text = byLine
            }
            //dispaly abstract for selected article
            if let abstract = article.abstract {
                articleAbstractLbl.text = abstract
            }
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
