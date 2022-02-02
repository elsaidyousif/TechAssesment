//
//  ArticleDetailsViewModel.swift
//  BoubyanTechAssesment
//
//  Created by elsaid yousif on 02/02/2022.
//

import Foundation
import Moya
//article view model
final class ArticleListViewModel {
    //declare observable object to hold articles api respons
    var ArticlesList: ObservableObject<ArticlesApiRes?> = ObservableObject(nil)
    //declare observable for error to check if call done with error or not
    var callingApiError: ObservableObject<Bool?> = ObservableObject(nil)
    //call api to get articles list
    func getArticlesList() {
        let provider = MoyaProvider<ArticlesApi>(plugins: [NetworkLoggerPlugin()])
        provider.request(.getArticlessData(period: 7) , completion: { result in
                   switch result {
                   case let .success(ResponseData):
                       do {
                        let articlesRes = try JSONDecoder().decode(ArticlesApiRes.self, from: ResponseData.data)
                           self.callingApiError.value = false
                           self.ArticlesList.value = articlesRes
                       } catch {
                           print(error)
                           self.callingApiError.value = true
                           self.ArticlesList.value = nil
                       }
                       
                       break
                   case .failure(_):
                       self.callingApiError.value = true
                       self.ArticlesList.value = nil
                       break
                   }
                   
               })
    }
    
}
