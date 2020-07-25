let DefaultField =
      { Type =
          { label : Text
          , name : Text
          , widget : Text
          , default : Text
          , required : Bool
          }
      , default = { required = True, default = "" }
      }

let Collection
    : Type
    = { name : Text
      , label : Text
      , folder : Text
      , create : Bool
      , slug : Text
      , fields : List DefaultField.Type
      }

in  { backend =
        { name = "github"
        , repo = "dawehner/dawehner.github.com.source"
        , branch = "master"
        , site_domain = "daniel.town"
        }
    , publish_mode = "editorial_workflow"
    , media_folder = "static/img/uploads"
    , public_folder = "/img/uploads"
    , collections =
      [ { name = "post"
        , label = "Post"
        , folder = "content/post"
        , create = True
        , slug = "{{year}}-{{month}}-{{day}}-{{slug}}"
        , fields =
          [ DefaultField::{
            , label = "Layout"
            , name = "layout"
            , widget = "hidden"
            , default = "post"
            }
          , DefaultField::{ label = "Title", name = "title", widget = "string" }
          , DefaultField::{
            , label = "Publish Date"
            , name = "date"
            , widget = "datetime"
            }
          , DefaultField::{
            , label = "Featured Image"
            , name = "thumbnail"
            , widget = "image"
            , required = False
            }
          , DefaultField::{ label = "Body", name = "body", widget = "markdown" }
          ]
        }
      , { name = "link"
        , label = "Link"
        , folder = "content/link"
        , create = True
        , slug = "{{year}}-{{month}}-{{day}}-{{slug}}"
        , fields =
          [ DefaultField::{
            , label = "Layout"
            , name = "layout"
            , widget = "hidden"
            , default = "post"
            }
          , DefaultField::{ label = "Title", name = "title", widget = "string" }
          , DefaultField::{
            , label = "Publish Date"
            , name = "date"
            , widget = "datetime"
            }
          , DefaultField::{
            , label = "Link URL"
            , name = "link_url"
            , widget = "string"
            }
          , DefaultField::{
            , label = "Notes"
            , name = "body"
            , widget = "markdown"
            }
          ]
        }
      , { name = "book"
        , label = "Book"
        , folder = "content/media"
        , create = True
        , slug = "{{year}}-{{slug}}"
        , fields =
          [ DefaultField::{
            , label = "Layout"
            , name = "layout"
            , widget = "hidden"
            , default = "book"
            }
          , DefaultField::{ label = "Title", name = "title", widget = "string" }
          , DefaultField::{
            , label = "Publish Date"
            , name = "date"
            , widget = "datetime"
            }
          , DefaultField::{
            , label = "Featured Image"
            , name = "thumbnail"
            , widget = "image"
            , required = False
            }
          , DefaultField::{ label = "Body", name = "body", widget = "markdown" }
          ]
        }
      , { name = "shader"
        , label = "Shader"
        , folder = "content/shader"
        , create = True
        , slug = "{{year}}-{{slug}}"
        , fields =
          [ DefaultField::{
            , label = "Layout"
            , name = "layout"
            , widget = "hidden"
            , default = "shader"
            }
          , DefaultField::{ label = "Title", name = "title", widget = "string" }
          , DefaultField::{
            , label = "Publish Date"
            , name = "date"
            , widget = "datetime"
            }
          , DefaultField::{
            , label = "Body"
            , name = "body"
            , widget = "markdown"
            , default =
                ''
                {{< shader >}}

                {{< /shader >}}

                ''
            }
          ]
        }
      ]
    }
