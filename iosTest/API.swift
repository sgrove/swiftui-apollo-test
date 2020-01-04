//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class DownloadsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query Downloads {
      npm {
        __typename
        downloads {
          __typename
          lastMonth {
            __typename
            count
          }
        }
      }
    }
    """

  public let operationName = "Downloads"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("npm", type: .nonNull(.object(Npm.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(npm: Npm) {
      self.init(unsafeResultMap: ["__typename": "Query", "npm": npm.resultMap])
    }

    /// The root for Npm queries
    @available(*, deprecated, message: "Beta: this field is still in beta while we work out the kinks.")
    public var npm: Npm {
      get {
        return Npm(unsafeResultMap: resultMap["npm"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "npm")
      }
    }

    public struct Npm: GraphQLSelectionSet {
      public static let possibleTypes = ["NpmQuery"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("downloads", type: .object(Download.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(downloads: Download? = nil) {
        self.init(unsafeResultMap: ["__typename": "NpmQuery", "downloads": downloads.flatMap { (value: Download) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Overall download stats in the npm ecosystem
      public var downloads: Download? {
        get {
          return (resultMap["downloads"] as? ResultMap).flatMap { Download(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "downloads")
        }
      }

      public struct Download: GraphQLSelectionSet {
        public static let possibleTypes = ["NpmOverallDownloadData"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("lastMonth", type: .object(LastMonth.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(lastMonth: LastMonth? = nil) {
          self.init(unsafeResultMap: ["__typename": "NpmOverallDownloadData", "lastMonth": lastMonth.flatMap { (value: LastMonth) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The download status for all of npm over the last month
        public var lastMonth: LastMonth? {
          get {
            return (resultMap["lastMonth"] as? ResultMap).flatMap { LastMonth(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "lastMonth")
          }
        }

        public struct LastMonth: GraphQLSelectionSet {
          public static let possibleTypes = ["NpmOverallDownloadPeriodData"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .nonNull(.scalar(Int.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(count: Int) {
            self.init(unsafeResultMap: ["__typename": "NpmOverallDownloadPeriodData", "count": count])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The download stats for all over npm for the given range. Check out explanation
          /// of how [npm download counts work](http://blog.npmjs.org/post/92574016600/numeric-precision-matters-how-npm-download-counts),
          /// including "what counts as a download?"
          public var count: Int {
            get {
              return resultMap["count"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "count")
            }
          }
        }
      }
    }
  }
}

public final class PackageQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query Package($name: String = "graphql") {
      npm {
        __typename
        package(name: $name) {
          __typename
          homepage
          id
          keywords
          name
          readme
          downloads {
            __typename
            lastMonth {
              __typename
              count
            }
          }
        }
      }
    }
    """

  public let operationName = "Package"

  public var name: String?

  public init(name: String? = nil) {
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("npm", type: .nonNull(.object(Npm.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(npm: Npm) {
      self.init(unsafeResultMap: ["__typename": "Query", "npm": npm.resultMap])
    }

    /// The root for Npm queries
    @available(*, deprecated, message: "Beta: this field is still in beta while we work out the kinks.")
    public var npm: Npm {
      get {
        return Npm(unsafeResultMap: resultMap["npm"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "npm")
      }
    }

    public struct Npm: GraphQLSelectionSet {
      public static let possibleTypes = ["NpmQuery"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("package", arguments: ["name": GraphQLVariable("name")], type: .object(Package.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(package: Package? = nil) {
        self.init(unsafeResultMap: ["__typename": "NpmQuery", "package": package.flatMap { (value: Package) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Find a npm package member by its npm name, e.g. `"fela"`
      public var package: Package? {
        get {
          return (resultMap["package"] as? ResultMap).flatMap { Package(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "package")
        }
      }

      public struct Package: GraphQLSelectionSet {
        public static let possibleTypes = ["NpmPackage"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("homepage", type: .scalar(String.self)),
          GraphQLField("id", type: .scalar(String.self)),
          GraphQLField("keywords", type: .list(.nonNull(.scalar(String.self)))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("readme", type: .scalar(String.self)),
          GraphQLField("downloads", type: .nonNull(.object(Download.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(homepage: String? = nil, id: String? = nil, keywords: [String]? = nil, name: String? = nil, readme: String? = nil, downloads: Download) {
          self.init(unsafeResultMap: ["__typename": "NpmPackage", "homepage": homepage, "id": id, "keywords": keywords, "name": name, "readme": readme, "downloads": downloads.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var homepage: String? {
          get {
            return resultMap["homepage"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "homepage")
          }
        }

        /// The package name, used as an ID in CouchDB
        public var id: String? {
          get {
            return resultMap["id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var keywords: [String]? {
          get {
            return resultMap["keywords"] as? [String]
          }
          set {
            resultMap.updateValue(newValue, forKey: "keywords")
          }
        }

        /// The package name
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// The first 64K of the README data for the most-recently published version of the package
        public var readme: String? {
          get {
            return resultMap["readme"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "readme")
          }
        }

        /// Summary download stats for a package
        public var downloads: Download {
          get {
            return Download(unsafeResultMap: resultMap["downloads"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "downloads")
          }
        }

        public struct Download: GraphQLSelectionSet {
          public static let possibleTypes = ["NpmPackageDownloadData"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastMonth", type: .object(LastMonth.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(lastMonth: LastMonth? = nil) {
            self.init(unsafeResultMap: ["__typename": "NpmPackageDownloadData", "lastMonth": lastMonth.flatMap { (value: LastMonth) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The download status for this package over the last month
          public var lastMonth: LastMonth? {
            get {
              return (resultMap["lastMonth"] as? ResultMap).flatMap { LastMonth(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "lastMonth")
            }
          }

          public struct LastMonth: GraphQLSelectionSet {
            public static let possibleTypes = ["NpmPackageDownloadPeriodData"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("count", type: .nonNull(.scalar(Int.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(count: Int) {
              self.init(unsafeResultMap: ["__typename": "NpmPackageDownloadPeriodData", "count": count])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The download stats for the given package and range. Check out explanation of
            /// how [npm download counts work](http://blog.npmjs.org/post/92574016600/numeric-precision-matters-how-npm-download-counts),
            /// including "what counts as a download?"
            public var count: Int {
              get {
                return resultMap["count"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "count")
              }
            }
          }
        }
      }
    }
  }
}

public final class GitHubQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query GitHub {
      gitHub {
        __typename
        repository(name: "graphql-js", owner: "graphql") {
          __typename
          isTemplate
        }
      }
    }
    """

  public let operationName = "GitHub"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("gitHub", type: .object(GitHub.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(gitHub: GitHub? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "gitHub": gitHub.flatMap { (value: GitHub) -> ResultMap in value.resultMap }])
    }

    public var gitHub: GitHub? {
      get {
        return (resultMap["gitHub"] as? ResultMap).flatMap { GitHub(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "gitHub")
      }
    }

    public struct GitHub: GraphQLSelectionSet {
      public static let possibleTypes = ["GitHubQuery"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("repository", arguments: ["name": "graphql-js", "owner": "graphql"], type: .object(Repository.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(repository: Repository? = nil) {
        self.init(unsafeResultMap: ["__typename": "GitHubQuery", "repository": repository.flatMap { (value: Repository) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Lookup a given repository by the owner and repository name.
      public var repository: Repository? {
        get {
          return (resultMap["repository"] as? ResultMap).flatMap { Repository(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "repository")
        }
      }

      public struct Repository: GraphQLSelectionSet {
        public static let possibleTypes = ["GitHubRepository"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("isTemplate", type: .nonNull(.scalar(Bool.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(isTemplate: Bool) {
          self.init(unsafeResultMap: ["__typename": "GitHubRepository", "isTemplate": isTemplate])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Identifies if the repository is a template that can be used to generate new repositories.
        public var isTemplate: Bool {
          get {
            return resultMap["isTemplate"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isTemplate")
          }
        }
      }
    }
  }
}

public final class SearchQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query Search($query: String!) {
      spotify {
        __typename
        search(data: {query: $query}) {
          __typename
          tracks {
            __typename
            name
            id
            album {
              __typename
              type
              name
              uri
              id
              artists {
                __typename
                name
                type
                id
                href
              }
              images {
                __typename
                height
                url
                width
              }
            }
          }
        }
      }
    }
    """

  public let operationName = "Search"

  public var query: String

  public init(query: String) {
    self.query = query
  }

  public var variables: GraphQLMap? {
    return ["query": query]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("spotify", type: .nonNull(.object(Spotify.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(spotify: Spotify) {
      self.init(unsafeResultMap: ["__typename": "Query", "spotify": spotify.resultMap])
    }

    /// The root for Spotify queries
    @available(*, deprecated, message: "Beta: this field is still in beta while we work out the kinks.")
    public var spotify: Spotify {
      get {
        return Spotify(unsafeResultMap: resultMap["spotify"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "spotify")
      }
    }

    public struct Spotify: GraphQLSelectionSet {
      public static let possibleTypes = ["SpotifyQuery"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("search", arguments: ["data": ["query": GraphQLVariable("query")]], type: .object(Search.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(search: Search? = nil) {
        self.init(unsafeResultMap: ["__typename": "SpotifyQuery", "search": search.flatMap { (value: Search) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var search: Search? {
        get {
          return (resultMap["search"] as? ResultMap).flatMap { Search(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "search")
        }
      }

      public struct Search: GraphQLSelectionSet {
        public static let possibleTypes = ["SpotifySearchResults"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("tracks", type: .list(.nonNull(.object(Track.selections)))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(tracks: [Track]? = nil) {
          self.init(unsafeResultMap: ["__typename": "SpotifySearchResults", "tracks": tracks.flatMap { (value: [Track]) -> [ResultMap] in value.map { (value: Track) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var tracks: [Track]? {
          get {
            return (resultMap["tracks"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Track] in value.map { (value: ResultMap) -> Track in Track(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Track]) -> [ResultMap] in value.map { (value: Track) -> ResultMap in value.resultMap } }, forKey: "tracks")
          }
        }

        public struct Track: GraphQLSelectionSet {
          public static let possibleTypes = ["SpotifyTrack"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("id", type: .scalar(String.self)),
            GraphQLField("album", type: .object(Album.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil, id: String? = nil, album: Album? = nil) {
            self.init(unsafeResultMap: ["__typename": "SpotifyTrack", "name": name, "id": id, "album": album.flatMap { (value: Album) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The name of the track.
          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// The [Spotify ID](/documentation/web-api/#spotify-uris-and-ids) for the track.
          public var id: String? {
            get {
              return resultMap["id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The album on which the track appears. The album object includes a link in `href` to full information about the album.
          public var album: Album? {
            get {
              return (resultMap["album"] as? ResultMap).flatMap { Album(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "album")
            }
          }

          public struct Album: GraphQLSelectionSet {
            public static let possibleTypes = ["SpotifySimplifiedAlbum"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("type", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("uri", type: .scalar(String.self)),
              GraphQLField("id", type: .scalar(String.self)),
              GraphQLField("artists", type: .list(.nonNull(.object(Artist.selections)))),
              GraphQLField("images", type: .list(.nonNull(.object(Image.selections)))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(type: String? = nil, name: String? = nil, uri: String? = nil, id: String? = nil, artists: [Artist]? = nil, images: [Image]? = nil) {
              self.init(unsafeResultMap: ["__typename": "SpotifySimplifiedAlbum", "type": type, "name": name, "uri": uri, "id": id, "artists": artists.flatMap { (value: [Artist]) -> [ResultMap] in value.map { (value: Artist) -> ResultMap in value.resultMap } }, "images": images.flatMap { (value: [Image]) -> [ResultMap] in value.map { (value: Image) -> ResultMap in value.resultMap } }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The object type: “album”
            public var type: String? {
              get {
                return resultMap["type"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "type")
              }
            }

            /// The name of the album. In case of an album takedown, the value may be an empty string.
            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// The [Spotify URI](/documentation/web-api/#spotify-uris-and-ids) for the album.
            public var uri: String? {
              get {
                return resultMap["uri"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "uri")
              }
            }

            /// The [Spotify ID](/documentation/web-api/#spotify-uris-and-ids) for the album.
            public var id: String? {
              get {
                return resultMap["id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The artists of the album. Each artist object includes a link in `href` to more detailed information about the artist.
            public var artists: [Artist]? {
              get {
                return (resultMap["artists"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Artist] in value.map { (value: ResultMap) -> Artist in Artist(unsafeResultMap: value) } }
              }
              set {
                resultMap.updateValue(newValue.flatMap { (value: [Artist]) -> [ResultMap] in value.map { (value: Artist) -> ResultMap in value.resultMap } }, forKey: "artists")
              }
            }

            /// The cover art for the album in various sizes, widest first.
            public var images: [Image]? {
              get {
                return (resultMap["images"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Image] in value.map { (value: ResultMap) -> Image in Image(unsafeResultMap: value) } }
              }
              set {
                resultMap.updateValue(newValue.flatMap { (value: [Image]) -> [ResultMap] in value.map { (value: Image) -> ResultMap in value.resultMap } }, forKey: "images")
              }
            }

            public struct Artist: GraphQLSelectionSet {
              public static let possibleTypes = ["SpotifySimplifiedArtist"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("type", type: .scalar(String.self)),
                GraphQLField("id", type: .scalar(String.self)),
                GraphQLField("href", type: .scalar(String.self)),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(name: String? = nil, type: String? = nil, id: String? = nil, href: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "SpotifySimplifiedArtist", "name": name, "type": type, "id": id, "href": href])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The name of the artist.
              public var name: String? {
                get {
                  return resultMap["name"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }

              /// The object type: 'artist'
              public var type: String? {
                get {
                  return resultMap["type"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "type")
                }
              }

              /// The Spotify ID for the artist.
              public var id: String? {
                get {
                  return resultMap["id"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              /// A link to the Web API endpoint providing full details of the artist.
              public var href: String? {
                get {
                  return resultMap["href"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "href")
                }
              }
            }

            public struct Image: GraphQLSelectionSet {
              public static let possibleTypes = ["SpotifyImage"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("height", type: .scalar(Int.self)),
                GraphQLField("url", type: .scalar(String.self)),
                GraphQLField("width", type: .scalar(Int.self)),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(height: Int? = nil, url: String? = nil, width: Int? = nil) {
                self.init(unsafeResultMap: ["__typename": "SpotifyImage", "height": height, "url": url, "width": width])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The image height in pixels. If unknown: `null` or not returned.
              public var height: Int? {
                get {
                  return resultMap["height"] as? Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "height")
                }
              }

              /// The source URL of the image.
              public var url: String? {
                get {
                  return resultMap["url"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "url")
                }
              }

              /// The image width in pixels. If unknown: `null` or not returned.
              public var width: Int? {
                get {
                  return resultMap["width"] as? Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "width")
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class PlayTrackMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation PlayTrack($trackId: String!) {
      spotify {
        __typename
        playTrack(input: {trackIds: [$trackId]}) {
          __typename
          player {
            __typename
            isPlaying
          }
        }
      }
    }
    """

  public let operationName = "PlayTrack"

  public var trackId: String

  public init(trackId: String) {
    self.trackId = trackId
  }

  public var variables: GraphQLMap? {
    return ["trackId": trackId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("spotify", type: .nonNull(.object(Spotify.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(spotify: Spotify) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "spotify": spotify.resultMap])
    }

    /// The root for Spotify mutations
    @available(*, deprecated, message: "Beta: this field is still in beta while we work out the kinks.")
    public var spotify: Spotify {
      get {
        return Spotify(unsafeResultMap: resultMap["spotify"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "spotify")
      }
    }

    public struct Spotify: GraphQLSelectionSet {
      public static let possibleTypes = ["SpotifyMutationNamespace"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("playTrack", arguments: ["input": ["trackIds": [GraphQLVariable("trackId")]]], type: .object(PlayTrack.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(playTrack: PlayTrack? = nil) {
        self.init(unsafeResultMap: ["__typename": "SpotifyMutationNamespace", "playTrack": playTrack.flatMap { (value: PlayTrack) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var playTrack: PlayTrack? {
        get {
          return (resultMap["playTrack"] as? ResultMap).flatMap { PlayTrack(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "playTrack")
        }
      }

      public struct PlayTrack: GraphQLSelectionSet {
        public static let possibleTypes = ["SpotifyStartPlayerTrackResponsePayload"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("player", type: .object(Player.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(player: Player? = nil) {
          self.init(unsafeResultMap: ["__typename": "SpotifyStartPlayerTrackResponsePayload", "player": player.flatMap { (value: Player) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var player: Player? {
          get {
            return (resultMap["player"] as? ResultMap).flatMap { Player(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "player")
          }
        }

        public struct Player: GraphQLSelectionSet {
          public static let possibleTypes = ["SpotifyPlayer"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("isPlaying", type: .scalar(Bool.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(isPlaying: Bool? = nil) {
            self.init(unsafeResultMap: ["__typename": "SpotifyPlayer", "isPlaying": isPlaying])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// If something is currently playing.
          public var isPlaying: Bool? {
            get {
              return resultMap["isPlaying"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isPlaying")
            }
          }
        }
      }
    }
  }
}

public final class SpotifyMeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query SpotifyMe {
      spotify {
        __typename
        me {
          __typename
          email
          displayName
          id
          player {
            __typename
            isPlaying
            item {
              __typename
              durationMs
              id
              name
              uri
              album {
                __typename
                images {
                  __typename
                  url
                }
                artists {
                  __typename
                  name
                  id
                }
                name
              }
            }
            device {
              __typename
              id
              name
              type
              volumePercent
            }
            progressMs
          }
          images {
            __typename
            height
            url
            width
          }
        }
      }
    }
    """

  public let operationName = "SpotifyMe"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("spotify", type: .nonNull(.object(Spotify.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(spotify: Spotify) {
      self.init(unsafeResultMap: ["__typename": "Query", "spotify": spotify.resultMap])
    }

    /// The root for Spotify queries
    @available(*, deprecated, message: "Beta: this field is still in beta while we work out the kinks.")
    public var spotify: Spotify {
      get {
        return Spotify(unsafeResultMap: resultMap["spotify"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "spotify")
      }
    }

    public struct Spotify: GraphQLSelectionSet {
      public static let possibleTypes = ["SpotifyQuery"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("me", type: .object(Me.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(me: Me? = nil) {
        self.init(unsafeResultMap: ["__typename": "SpotifyQuery", "me": me.flatMap { (value: Me) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var me: Me? {
        get {
          return (resultMap["me"] as? ResultMap).flatMap { Me(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "me")
        }
      }

      public struct Me: GraphQLSelectionSet {
        public static let possibleTypes = ["SpotifyCurrentUserProfile"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("displayName", type: .scalar(String.self)),
          GraphQLField("id", type: .scalar(String.self)),
          GraphQLField("player", type: .object(Player.selections)),
          GraphQLField("images", type: .list(.nonNull(.object(Image.selections)))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(email: String? = nil, displayName: String? = nil, id: String? = nil, player: Player? = nil, images: [Image]? = nil) {
          self.init(unsafeResultMap: ["__typename": "SpotifyCurrentUserProfile", "email": email, "displayName": displayName, "id": id, "player": player.flatMap { (value: Player) -> ResultMap in value.resultMap }, "images": images.flatMap { (value: [Image]) -> [ResultMap] in value.map { (value: Image) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The user’s email address, as entered by the user when creating their account.
        /// _**Important!** This email address is unverified; there is no proof that it
        /// actually belongs to the user._ _This field is only available when the current
        /// user has granted access to the [user-read-email](/documentation/general/guides/authorization-guide/#list-of-scopes) scope._
        public var email: String? {
          get {
            return resultMap["email"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        /// The name displayed on the user’s profile. `null` if not available.
        public var displayName: String? {
          get {
            return resultMap["displayName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "displayName")
          }
        }

        /// The [Spotify user ID](/documentation/web-api/#spotify-uris-and-ids) for the user.
        public var id: String? {
          get {
            return resultMap["id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var player: Player? {
          get {
            return (resultMap["player"] as? ResultMap).flatMap { Player(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "player")
          }
        }

        /// The user’s profile image.
        public var images: [Image]? {
          get {
            return (resultMap["images"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Image] in value.map { (value: ResultMap) -> Image in Image(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Image]) -> [ResultMap] in value.map { (value: Image) -> ResultMap in value.resultMap } }, forKey: "images")
          }
        }

        public struct Player: GraphQLSelectionSet {
          public static let possibleTypes = ["SpotifyPlayer"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("isPlaying", type: .scalar(Bool.self)),
            GraphQLField("item", type: .object(Item.selections)),
            GraphQLField("device", type: .object(Device.selections)),
            GraphQLField("progressMs", type: .scalar(Int.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(isPlaying: Bool? = nil, item: Item? = nil, device: Device? = nil, progressMs: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "SpotifyPlayer", "isPlaying": isPlaying, "item": item.flatMap { (value: Item) -> ResultMap in value.resultMap }, "device": device.flatMap { (value: Device) -> ResultMap in value.resultMap }, "progressMs": progressMs])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// If something is currently playing.
          public var isPlaying: Bool? {
            get {
              return resultMap["isPlaying"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isPlaying")
            }
          }

          /// The currently playing track. Can be `null` (e.g. If private session is enabled this will be `null`).
          public var item: Item? {
            get {
              return (resultMap["item"] as? ResultMap).flatMap { Item(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "item")
            }
          }

          /// The device that is currently active
          public var device: Device? {
            get {
              return (resultMap["device"] as? ResultMap).flatMap { Device(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "device")
            }
          }

          /// Progress into the currently playing track. Can be `null` (e.g. If private session is enabled this will be `null`).
          public var progressMs: Int? {
            get {
              return resultMap["progressMs"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "progressMs")
            }
          }

          public struct Item: GraphQLSelectionSet {
            public static let possibleTypes = ["SpotifyTrack"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("durationMs", type: .scalar(Int.self)),
              GraphQLField("id", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("uri", type: .scalar(String.self)),
              GraphQLField("album", type: .object(Album.selections)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(durationMs: Int? = nil, id: String? = nil, name: String? = nil, uri: String? = nil, album: Album? = nil) {
              self.init(unsafeResultMap: ["__typename": "SpotifyTrack", "durationMs": durationMs, "id": id, "name": name, "uri": uri, "album": album.flatMap { (value: Album) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The track length in milliseconds.
            public var durationMs: Int? {
              get {
                return resultMap["durationMs"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "durationMs")
              }
            }

            /// The [Spotify ID](/documentation/web-api/#spotify-uris-and-ids) for the track.
            public var id: String? {
              get {
                return resultMap["id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The name of the track.
            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// The [Spotify URI](/documentation/web-api/#spotify-uris-and-ids) for the track.
            public var uri: String? {
              get {
                return resultMap["uri"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "uri")
              }
            }

            /// The album on which the track appears. The album object includes a link in `href` to full information about the album.
            public var album: Album? {
              get {
                return (resultMap["album"] as? ResultMap).flatMap { Album(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "album")
              }
            }

            public struct Album: GraphQLSelectionSet {
              public static let possibleTypes = ["SpotifySimplifiedAlbum"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("images", type: .list(.nonNull(.object(Image.selections)))),
                GraphQLField("artists", type: .list(.nonNull(.object(Artist.selections)))),
                GraphQLField("name", type: .scalar(String.self)),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(images: [Image]? = nil, artists: [Artist]? = nil, name: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "SpotifySimplifiedAlbum", "images": images.flatMap { (value: [Image]) -> [ResultMap] in value.map { (value: Image) -> ResultMap in value.resultMap } }, "artists": artists.flatMap { (value: [Artist]) -> [ResultMap] in value.map { (value: Artist) -> ResultMap in value.resultMap } }, "name": name])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The cover art for the album in various sizes, widest first.
              public var images: [Image]? {
                get {
                  return (resultMap["images"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Image] in value.map { (value: ResultMap) -> Image in Image(unsafeResultMap: value) } }
                }
                set {
                  resultMap.updateValue(newValue.flatMap { (value: [Image]) -> [ResultMap] in value.map { (value: Image) -> ResultMap in value.resultMap } }, forKey: "images")
                }
              }

              /// The artists of the album. Each artist object includes a link in `href` to more detailed information about the artist.
              public var artists: [Artist]? {
                get {
                  return (resultMap["artists"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Artist] in value.map { (value: ResultMap) -> Artist in Artist(unsafeResultMap: value) } }
                }
                set {
                  resultMap.updateValue(newValue.flatMap { (value: [Artist]) -> [ResultMap] in value.map { (value: Artist) -> ResultMap in value.resultMap } }, forKey: "artists")
                }
              }

              /// The name of the album. In case of an album takedown, the value may be an empty string.
              public var name: String? {
                get {
                  return resultMap["name"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }

              public struct Image: GraphQLSelectionSet {
                public static let possibleTypes = ["SpotifyImage"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("url", type: .scalar(String.self)),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(url: String? = nil) {
                  self.init(unsafeResultMap: ["__typename": "SpotifyImage", "url": url])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The source URL of the image.
                public var url: String? {
                  get {
                    return resultMap["url"] as? String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "url")
                  }
                }
              }

              public struct Artist: GraphQLSelectionSet {
                public static let possibleTypes = ["SpotifySimplifiedArtist"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("name", type: .scalar(String.self)),
                  GraphQLField("id", type: .scalar(String.self)),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(name: String? = nil, id: String? = nil) {
                  self.init(unsafeResultMap: ["__typename": "SpotifySimplifiedArtist", "name": name, "id": id])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The name of the artist.
                public var name: String? {
                  get {
                    return resultMap["name"] as? String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "name")
                  }
                }

                /// The Spotify ID for the artist.
                public var id: String? {
                  get {
                    return resultMap["id"] as? String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "id")
                  }
                }
              }
            }
          }

          public struct Device: GraphQLSelectionSet {
            public static let possibleTypes = ["SpotifyDevice"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("type", type: .scalar(String.self)),
              GraphQLField("volumePercent", type: .scalar(Int.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String? = nil, name: String? = nil, type: String? = nil, volumePercent: Int? = nil) {
              self.init(unsafeResultMap: ["__typename": "SpotifyDevice", "id": id, "name": name, "type": type, "volumePercent": volumePercent])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The device ID. This may be `null`.
            public var id: String? {
              get {
                return resultMap["id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The name of the device.
            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// Device type, such as “computer”, “smartphone” or “speaker”.
            public var type: String? {
              get {
                return resultMap["type"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "type")
              }
            }

            /// The current volume in percent. This may be null.
            public var volumePercent: Int? {
              get {
                return resultMap["volumePercent"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "volumePercent")
              }
            }
          }
        }

        public struct Image: GraphQLSelectionSet {
          public static let possibleTypes = ["SpotifyImage"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("height", type: .scalar(Int.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("width", type: .scalar(Int.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(height: Int? = nil, url: String? = nil, width: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "SpotifyImage", "height": height, "url": url, "width": width])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The image height in pixels. If unknown: `null` or not returned.
          public var height: Int? {
            get {
              return resultMap["height"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "height")
            }
          }

          /// The source URL of the image.
          public var url: String? {
            get {
              return resultMap["url"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }

          /// The image width in pixels. If unknown: `null` or not returned.
          public var width: Int? {
            get {
              return resultMap["width"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "width")
            }
          }
        }
      }
    }
  }
}
