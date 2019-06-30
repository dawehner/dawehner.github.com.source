module Main exposing (main)

import Browser
import Element as E
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Html
import Html.Attributes
import Json.Decode as JD
import Palette as P


type alias Model =
    Result JD.Error (List Podcast)


type alias Podcast =
    { title : String
    , url : String
    }


decodePodcasts : JD.Decoder (List Podcast)
decodePodcasts =
    JD.list
        (JD.map2 Podcast
            (JD.field "text" JD.string)
            (JD.field "xmlurl" JD.string)
        )


init : JD.Value -> ( Model, Cmd () )
init flags =
    ( JD.decodeValue decodePodcasts flags
    , Cmd.none
    )


update : () -> Model -> ( Model, Cmd () )
update msg model =
    ( model, Cmd.none )


viewPodcasts : List Podcast -> E.Element msg
viewPodcasts podcasts =
    E.column
        [ E.spacing 10
        , E.padding 10
        ]
    <|
        List.map
            (\podcast ->
                E.link
                    [ Font.color P.color.link
                    ]
                    { url = podcast.url
                    , label = E.text podcast.title
                    }
            )
            podcasts


view : Model -> Html.Html ()
view model =
    E.layout
        [ E.width E.fill
        , E.height E.fill
        , E.inFront
            (E.el
                [ E.width E.fill
                , E.alignBottom
                , E.height (E.px 50)
                , Background.color (E.rgb 1.0 1.0 1.0)
                , Border.color (E.rgb 0.5 0.5 0.5)
                , Border.solid
                , Border.widthEach
                    { top = 1
                    , bottom = 0
                    , left = 0
                    , right = 0
                    }
                ]
                (E.row [ E.padding 10, E.centerY, Font.color P.color.extraLink, E.spacing 10 ]
                    [ E.newTabLink
                        []
                        { url = "https://github.com/dawehner/dawehner.github.com/tree/master/podcasts"
                        , label = E.text "➾ Powered by elm"
                        }
                    , E.newTabLink
                        []
                        { url = "//dawehner.github.io"
                        , label = E.text "➾ back to blog"
                        }
                    ]
                )
            )
        ]
        (E.el
            [ E.paddingEach
                { bottom = 50
                , top = 20
                , left = 20
                , right = 20
                }
            ]
            (case model of
                Err err ->
                    JD.errorToString err |> E.text

                Ok podcasts ->
                    E.column []
                        [ E.paragraph
                            []
                            [ E.text "A list of my favourite podcasts"
                            ]
                        , viewPodcasts
                            podcasts
                        ]
            )
        )


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = always Sub.none
        , view = view
        }
