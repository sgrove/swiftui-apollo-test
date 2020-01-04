//
//  ContentView.swift
//  iosTest
//
//  Created by Sean Grove on 12/29/19.
//  Copyright © 2019 Sean Grove. All rights reserved.
//

import SwiftUI
import UIKit
import Apollo
import RemoteImage

// Apollo Client initialization.
// More about it here: https://www.back4app.com/docs/ios/swift-graphql
let apollo: ApolloClient = {
    let configuration = URLSessionConfiguration.default
    
    configuration.httpAdditionalHeaders = ["authorization": "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6ImdYdjUwQzdKZy14VDB3UFZBVlFwLThDNHpJTSJ9.eyJpc3MiOiJPbmVHcmFwaCIsImF1ZCI6Imh0dHBzOi8vc2VydmUub25lZ3JhcGguY29tL2Rhc2hib2FyZC9hcHAvMGIzM2U4MzAtN2NkZS00YjkwLWFkN2UtMmEzOWM1N2MwZTExIiwiaWF0IjoxNTc3NjkwOTcyLCJleHAiOjE1Nzg5MDA1NzIsImh0dHBzOi8vb25lZ3JhcGguY29tL2p3dC9jbGFpbXMiOnsiYWNjZXNzX3Rva2VuIjoiWEVqVzZERGZzVjctODVjQmVaV2d6eHVscVpSTXkyUHVUNGR6ZzB2QlpGayJ9LCJodHRwczovL29uZWdyYXBoLmNvbS9qd3QvcHJlZmxpZ2h0LXF1ZXJ5Ijp7ImlzcyI6Ik9uZUdyYXBoIiwiYXVkIjoiaHR0cHM6Ly9zZXJ2ZS5vbmVncmFwaC5jb20vZGFzaGJvYXJkL2FwcC8wYjMzZTgzMC03Y2RlLTRiOTAtYWQ3ZS0yYTM5YzU3YzBlMTEiLCJpYXQiOjE1Nzc2OTA5NzIsImV4cCI6MTU3ODkwMDU3MiwiaHR0cHM6Ly9vbmVncmFwaC5jb20vand0L2NsYWltcyI6eyJhY2Nlc3NfdG9rZW4iOiJYRWpXNkREZnNWNy04NWNCZVpXZ3p4dWxxWlJNeTJQdVQ0ZHpnMHZCWkZrIn19fQ.jNV1QF63k72AWXkzQF47SHFUvc6YT-Zg4qdP9rcfXHtKraeMrWiGcih0rpZrOQCLf4eWJ9jX6U-8rZ2O0F1nSGYr8hCvzlYohWl88kc7NZa-NrQVXbmd5NkDAPenxNTowcRtdjS41YIUKf-dPmFtCbQFTt1e0iZJK-akIvMIxryWn0ybBJUb77unYzNspqwIRVQwO6cYiaFpFl3EYkQxWgOSl0F1S8tHXRx6bH0B2fFWTpo9JSL9rQZQGL_9WHO2mtnsbNLYW68hmpB-EFC05DFqUZsenDsWhb2l2EPc09jOpclKuVULghan9OzAD_s-yegQzTcEjXlHR_EDLnRPEw"]
    
    let url = URL(string: "https://serve.onegraph.com/dynamic?app_id=0b33e830-7cde-4b90-ad7e-2a39c57c0e11&show_metrics=true&show_api_requests=false")!
    
    let urlSession = URLSession(configuration: configuration)
    
    
    return ApolloClient(
        networkTransport: HTTPNetworkTransport(
            url: url,
            session: urlSession
        )
        
    )
}()

let url = URL(string: "https://images.unsplash.com/photo-1524419986249-348e8fa6ad4a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80")!


struct TempView: View {
    @State private var packageName = "graphql"
    @State private var downloads = 0
    
    var body: some View {
        VStack{
            TextField("Package", text: $packageName)
            Text(String(self.downloads) + " downloads of " + self.packageName + " last month")
            
            Button(action: {
                apollo.fetch(query: PackageQuery(name: self.packageName)) {
                    result in guard let data = try? result.get().data else {
                        print("Hit some error, probably");
                        return
                        
                    };
                    self.downloads = data.npm.package?.downloads.lastMonth?.count ?? 0
                }
            }) {
                Text("Query me, please")
            }
            
            RemoteImage(type: .url(url), errorView: { error in
                Text(error.localizedDescription)
            }, imageView: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }, loadingView: {
                Text("Loading ...")
            })
        }
    }
};


struct TempView_Previews: PreviewProvider {
    static var previews: some View {
        TempView()
    }
}

struct PlayerView: View {
    let me : SpotifyMeQuery.Data.Spotify.Me;
    
    var body: some View {
        let profile = me.images?.first.map { image in
            RemoteImage(type: .url(URL(string: String(image.url ?? ""))!
                ), errorView: { error in
                    Text(error.localizedDescription)
            }, imageView: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40, alignment: .trailing)
            }, loadingView: {
                Text("Loading ...")
            }).frame(width: 20, height: 20, alignment: .leading)
                .mask(Circle())
        }
        
        let playerData : SpotifyMeQuery.Data.Spotify.Me.Player? =
            me.player;
        
        let player = playerData.map { (player: SpotifyMeQuery.Data.Spotify.Me.Player)
            in
            //            let artistName : String? = player.item?.artists?.first?.name
            //            print("Here we go!");
            
            HStack(alignment: .top) {
                RemoteImage(type: .url(URL(string: String(player.item?.album?.images?.first?.url ?? ""))!
                    ), errorView: { error in
                        Text(error.localizedDescription)
                }, imageView: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }, loadingView: {
                    Text("Loading ...")
                }).frame(width: 100, height: 100, alignment: .leading).cornerRadius(4)
                VStack(alignment: .leading) {
                    Text(player.item?.name ?? "name")
                    //                    Text("By " (Optional.none ?? "artist"))
                    //                      Text("on " (player.item?.album?.name ?? "album"))
                }
                
            }
        }
        
        return
            VStack(alignment: .leading) {
                
                player
                
        }
    }
};


struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Placeholder")
    }
}


struct ProfileView: View {
    let me : SpotifyMeQuery.Data.Spotify.Me;
    
    var body: some View {
        let profile = me.images?.first.map { image in
            RemoteImage(type: .url(URL(string: String(image.url ?? ""))!
                ), errorView: { error in
                    Text(error.localizedDescription)
            }, imageView: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40, alignment: .trailing)
            }, loadingView: {
                Text("Loading ...")
            }).frame(width: 40, height: 40, alignment: .leading)
                .mask(Circle())
        }
        
        return VStack {
            HStack(alignment: .top){
                Spacer()
                VStack(alignment: .trailing) {
                    Text(me.displayName ?? "name")
                }
                profile
            }
            
        }
    }
};


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Text("ProfilePlaceholder")
    }
}


struct SearchView: View {
    @State private var query = "you and i"
    @State private var results : [SearchQuery.Data.Spotify.Search.Track]? = Optional.none
    
    var body: some View {
        let list = self.results.map { (results : [SearchQuery.Data.Spotify.Search.Track]) in
            List(results, id: \.id) { (result: SearchQuery.Data.Spotify.Search.Track) in
                
                return HStack {
                    //                    Text(String(result.album?.images?.first?.url ?? ""))
                    RemoteImage(type: .url(URL(string: String(result.album?.images?.first?.url ?? ""))!
                        ), errorView: { error in
                            Text(error.localizedDescription)
                    }, imageView: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }, loadingView: {
                        Text("Loading ...")
                    }).frame(width: 100, height: 100, alignment: .leading).cornerRadius(4)
                    VStack {
                        Text(result.name ?? "Track name")
                        Text("by " + (result.album?.artists?.first?.name ?? "Unknown"))
                    }}.onTapGesture {
                        //                    print("Playing track " + (result.id ?? ""))
                        let trackId = (result.id ?? "")
                        
                        apollo.perform(mutation: PlayTrackMutation(trackId: trackId)) { results in
                            print("Playing track " + (result.id ?? ""))
                        }
                        
                        return
                }
            }
        }
        
        return VStack {
            
            HStack{
                TextField("Query", text: $query)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .border(Color.black)
                    .cornerRadius(6)
                
                Button(action: {
                    apollo.fetch(query: SearchQuery(query: self.query)) {
                        result in guard let data = try? result.get().data else {
                            print("Hit some error, probably");
                            return
                            
                        };
                        self.results = ( data.spotify.search?.tracks)
                    }
                    
                    print("Made a fetch")
                }) {
                    Text("Search ")
                }
            }
            list
            
        }.onAppear {
            apollo.fetch(query: SearchQuery(query: self.query)) {
                result in guard let data = try? result.get().data else {
                    print("Hit some error, probably");
                    return
                    
                };
                self.results = ( data.spotify.search?.tracks)
            }
            
            print("Made a fetch")
        }
    }
};


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct ContentView: View {
    @State private var me : SpotifyMeQuery.Data.Spotify.Me? = Optional.none;
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        let refresh = {() -> Void in
        apollo.fetch(query: SpotifyMeQuery()) {
            result in guard let data = try? result.get().data else {
                print("Hit some error, probably");
                return
                
            };
            self.me = ( data.spotify.me )
        }
        }
        
        return VStack{
            me.map {
                ProfileView(me: $0).layoutPriority(0.0)
            }
            SearchView().layoutPriority(2.0)
            me.map {
                PlayerView(me: $0).layoutPriority(0.0)
            }
        }.onAppear {
            refresh()
            print("Made a fetch")
            }.onReceive(timer) { _ in
                refresh()
            }
            
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
