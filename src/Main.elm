module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)

import Browser exposing (element)

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
        [ a [href social.link] [ i [class social.icon] [] ]
        ]

viewSocialLinks: Model -> Html Message
viewSocialLinks model =
    div []
    (model.socialNetworks
        |> List.map viewSocialLink)

view: Model -> Html Message
view model =
    div [] [
        viewSocialLinks model
    ]

main: Program () Model Message
main = 
    Browser.element
        { init = \_ -> (init, Cmd.none)
        , view = view
        , update = \message model -> (update message model, Cmd.none) 
        , subscriptions = \_ -> Sub.none
        }