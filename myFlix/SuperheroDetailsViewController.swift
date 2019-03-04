//
//  SuperheroDetailsViewController.swift
//  myFlix
//
//  Created by Jiade Lin on 3/3/19.
//  Copyright © 2019 Jiade Lin. All rights reserved.
//

import UIKit
import AlamofireImage
class SuperheroDetailsViewController: UIViewController {
    
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var synopsisLable: UILabel!
    var trailerUrl: URL!
    var movie: [String:Any]!
    var movies = [[String:Any]]()
    var smovie: [String:Any]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLable.text = movie["title"] as? String
        synopsisLable.text = movie["overview"] as? String
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        posterView.af_setImage(withURL: posterUrl!)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        backdropView.af_setImage(withURL: backdropUrl!)
        
        let id = movie["id"] as! Int
        let url = URL(string: "https://api.themoviedb.org/3/movie/" + String(id) + "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                self.movies = dataDictionary["results"] as! [[String:Any]]
                let smovie = self.movies[0]
                let key = smovie["key"] as! String
                self.trailerUrl = URL(string: "https://www.youtube.com/watch?v=" + key)
                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data
                
            }
        }
        task.resume()
        
        
        
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let trailerViewController = segue.destination as! trailerViewController
        trailerViewController.url = trailerUrl
      
        
    }
    @IBAction func enter(_ sender: Any) {
        
        
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
