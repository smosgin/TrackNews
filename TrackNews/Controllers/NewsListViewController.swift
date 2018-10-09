//
//  ViewController.swift
//  TrackNews
//
//  Created by Seth Mosgin on 10/9/18.
//  Copyright © 2018 Seth Mosgin. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage

class NewsListViewController: UITableViewController {

    let API_URL = "https://newsapi.org/v2/everything"
    let API_KEY = "4a0afd6262a747c9be7ddfa586914b87"
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var errorMessage = ""
    var newsItems = [NewsItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.rowHeight = 100
        retrieveNews(url: API_URL, parameters: ["TestKey": "TestValue"])
    }
    
    //MARK: - Perform HTTP Request
    /***************************************************************/
    
    func retrieveNews(url: String, parameters: [String: String]) {
        // If this gets called with a data task already in progress, cancel it
        dataTask?.cancel()
        
        if var urlComponents = URLComponents(string: url) {
            urlComponents.query = "q=Privacy&apiKey=\(API_KEY)"
            
            guard let url = urlComponents.url else { print("Exiting"); return }
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                defer { self.dataTask = nil }
                // 5
                if let error = error {
                    self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
                } else if let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    print(data)
                    guard let jsonData = try? JSON(data: data) else { return }
                    print(jsonData)
                    self.updateNewsData(json: jsonData)
                    // 6
//                    DispatchQueue.main.async {
//                        completion(self.tracks, self.errorMessage)
//                    }
                }
            }
            dataTask?.resume()
        }
    }
    
    //MARK: - JSON Parsing
    /***************************************************************/
    
    
    //Write the updateWeatherData method here:
    func updateNewsData(json : JSON) {
        //We could get a situation where the connection was successful but the App key was invalid
        //Doing an optional binding saves us from force unwrapping data in the json
        guard json["totalResults"].double != nil else { return }
        if let articles = json["articles"].array {//Convenience provided by SwiftyJSON
            
            print("\(articles.count) Number of articles")
            for article in articles {
                if let description = article["description"].string {
                    print(description)
                    //publishedAt, urlToImage, url, author, description, source : {id, name}, title
                    guard let title = article["title"].string else { continue }
                    
                    let item = NewsItem()
                    item.title = title
                    item.description = description
                    item.publishedDate = article["publishedAt"].stringValue
                    print(item.publishedDate)
                    item.author = article["author"].stringValue
                    item.source = article["source"]["name"].stringValue
                    item.imageURL = article["urlToImage"].stringValue
                    item.articleURL = article["url"].stringValue
                    
                    newsItems.append(item)
                } else {
                    continue
                }
            }

            // Update the UI/TableView on the main thread
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }

        } else {
            // Would be good to have a default "News Unavailable" message here to the user
        }
    }

    //MARK: - TableView Datasource Methods
    /***************************************************************/
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsItemCell", for: indexPath) as! NewsItemCell
        
        let item = newsItems[indexPath.row]
        cell.headlineLabel.text = item.title
        cell.authorLabel.text = item.author
        cell.dateLabel.text = item.publishedDate
        cell.sourceLabel.text = item.source
        cell.descriptionLabel.text = item.description
        cell.imagePreview.sd_setImage(with: URL(string: item.imageURL))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }
 
    //MARK: - Segue Methods
    /***************************************************************/
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // No need to call this method while the storyboard has the connection for the segue
        //        performSegue(withIdentifier: "goToNewsItem", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! NewsItemViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.urlString = newsItems[indexPath.row].articleURL
        }
    }
    
}
