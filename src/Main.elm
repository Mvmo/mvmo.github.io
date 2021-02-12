module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Browser exposing (element)
import Svg exposing (Svg)
import Svg.Attributes exposing (fill, viewBox, fillOpacity, d)

init: Model
init = 
    { socialNetworks = 
        [ Social "fab fa-instagram" "https://instagram.com"
        , Social "fab fa-twitter" "https://twitter.com/xmvmo"
        ] 
    }

type alias Social = 
    { icon: String
    , link: String 
    }

type alias Model = 
    { socialNetworks: List Social
    }

type Message
    = None

update: Message -> Model -> Model
update message model = model

viewSocialLink: Social -> Html Message
viewSocialLink social =
    div [] 
        [ a [ href social.link ] [ i [ class social.icon ] [] ]
        ]

viewSocialLinks: Model -> Html Message
viewSocialLinks model =
    div []
    (model.socialNetworks
        |> List.map viewSocialLink)

viewNavigation: Html Message
viewNavigation =
    nav [] 
    [ ul [] 
        [ li [] [ a [] [text "about"]]
        , li [] [ a [] [text "projects"]]
        ]
    ]

viewHeader: Html Message
viewHeader =
    header [ ]
    [ viewNavigation
    ]

viewWave: Html Message
viewWave =
    div [ class "waves" ] 
    [ div [ class "wave" ] [Svg.svg [ viewBox "0 0 1440 320" ] [ Svg.path [ fill "#0099ff", fillOpacity "1", d "M0,192L60,165.3C120,139,240,85,360,90.7C480,96,600,160,720,186.7C840,213,960,203,1080,170.7C1200,139,1320,85,1380,58.7L1440,32L1440,320L1380,320C1320,320,1200,320,1080,320C960,320,840,320,720,320C600,320,480,320,360,320C240,320,120,320,60,320L0,320Z" ] [] ]]
    , div [ class "wave" ] [Svg.svg [ viewBox "0 0 1440 320" ] [ Svg.path [ fill "#00cba9", fillOpacity "1", d "M0,0L60,32C120,64,240,128,360,170.7C480,213,600,235,720,240C840,245,960,235,1080,213.3C1200,192,1320,160,1380,144L1440,128L1440,320L1380,320C1320,320,1200,320,1080,320C960,320,840,320,720,320C600,320,480,320,360,320C240,320,120,320,60,320L0,320Z" ] [] ]]
    ]

viewMyself: Html Message
viewMyself =
    div [ id "myself" ] 
    [ div [ class "top" ] [h1 [ ] [text "Mvmo"]
    , h3 [ ] [text "Maurice Schmidt"]
    , viewWave ]
    , div [ class "bottom" ]
    [ h4 [] [ text "Developer" ] ]
    ]

view: Model -> Html Message
view model =
    div [ id "main" ]
    [ viewHeader
    , viewMyself
    , viewSocialLinks model
    ]

main: Program () Model Message
main = 
    Browser.element
        { init = \_ -> (init, Cmd.none)
        , view = view
        , update = \message model -> (update message model, Cmd.none) 
        , subscriptions = \_ -> Sub.none
        }