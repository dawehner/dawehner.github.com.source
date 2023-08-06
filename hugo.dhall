{ baseurl = "https://daniel.town/"
, languageCode = "en-us"
, title = "Daniel Wehner's blog"
, theme = "hugo-natrium-theme"
, preserveTaxonomyNames = True
, rssLimit = 42
, paginate = 20
, pygmentsCodefences = True
, pygmentsStyle = "native"
, RSSLink = "feed.xml"
, taxonomies = { category = "categories", tag = "tags" }
, permalinks =
  { post = "/:slug"
  , book = "/books/:slug"
  , boardgame = "/boardgame/:slug"
  , link = "/:slug"
  , page = "/:slug/"
  , shader = "/shaders/:slug"
  }
, menu.main
  =
  [ { name = "About", url = "/about/", weight = -110 }
  , { name = "Projects", url = "/projects", weight = -100 }
  , { name = "Boardgames", url = "/boardgame", weight = -100 }
  , { name = "Media", url = "/media", weight = -100 }
  ]
, params =
  { description = ""
  , BooksSection = [ "books" ]
  , logo = { url = "logo.png", width = 50, height = 50, alt = "Logo" }
  , mainSections = [ "post", "book", "link", "boardgame", "shader" ]
  }
, outputs.home = [ "RSS", "HTML" ]
, outputFormats.RSS = { mediatype = "application/rss", baseName = "feed" }
, markup.goldmark.renderer.unsafe = True
}
