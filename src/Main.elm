module Main exposing (main)

import Browser
import Element exposing (Color, Element)
import Element.Background as Background
import Element.Font as Font
import Html exposing (Html)
import Image
import Window exposing (Window)



-- MAIN


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- MODEL


type alias Model =
    { window : Window }



-- INIT


type alias Flags =
    { width : Int
    , height : Int
    }


init : Flags -> ( Model, Cmd Msg )
init =
    Window.init initWindow


initWindow : Window -> ( Model, Cmd Msg )
initWindow window =
    ( { window = window }, Cmd.none )



-- MSG


type Msg
    = ChangeWindow Window



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeWindow window ->
            ( { model | window = window }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Window.onResize ChangeWindow



-- VIEW


view : Model -> Html Msg
view model =
    Element.layout [] <| viewElement model


viewElement : Model -> Element Msg
viewElement model =
    Element.column
        [ Element.width Element.fill ]
        [ headerSpace
        , viewBanner model.window

        --, viewFeatures model.window
        --, viewPeople model.window
        --, viewContact model.window
        --, viewFooter
        ]


headerSpace : Element Msg
headerSpace =
    Element.el
        [ Element.width Element.fill
        , Element.height <| Element.px 60
        ]
        Element.none


viewBanner : Window -> Element Msg
viewBanner window =
    Element.el
        [ Window.toWidth window
        , Window.toHeight window
        , Image.toBackground Image.house
        , Element.padding 20
        , Element.behindContent viewLighter
        ]
        viewHeadline


viewHeadline : Element Msg
viewHeadline =
    Element.column
        [ Element.width Element.fill
        , Element.centerY
        , Element.spacing 10
        ]
        [ viewOwnYourHome
        , viewSubtitle
        ]


viewOwnYourHome : Element Msg
viewOwnYourHome =
    Element.paragraph
        [ Font.size 48
        , Font.bold
        , Font.family
            [ Font.typeface "Helvetica"
            , Font.sansSerif
            ]
        ]
        [ Element.text "Own your home at your terms" ]


viewSubtitle : Element Msg
viewSubtitle =
    Element.paragraph
        [ Font.size 24
        , Font.family
            [ Font.typeface "Helvetica"
            , Font.sansSerif
            ]
        ]
        [ Element.text "Lower monthly payments + No loans and interest" ]


viewLighter : Element Msg
viewLighter =
    Element.el
        [ Element.width Element.fill
        , Element.height Element.fill
        , Background.color transparentWhite
        ]
        Element.none


transparentWhite : Color
transparentWhite =
    Element.fromRgb255
        { red = 255
        , green = 255
        , blue = 255
        , alpha = 0.5
        }
