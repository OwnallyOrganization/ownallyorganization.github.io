module Window exposing (Device(..), Window, classifyDevice, init, onResize, toHeight, toWidth)

import Browser.Events
import Element exposing (Attribute)


type Window
    = Window
        { width : Int
        , height : Int
        }


type alias WithDimension flags =
    { flags
        | width : Int
        , height : Int
    }


type alias WithWindow model =
    { model | window : Window }


type Device
    = PhonePortrait
    | PhoneLandscape
    | TabletPortrait
    | TabletLandscape
    | Desktop
    | BigDesktop


init : (Window -> ( WithWindow model, Cmd msg )) -> WithDimension flags -> ( WithWindow model, Cmd msg )
init initWindow { width, height } =
    Window
        { width = width
        , height = height
        }
        |> initWindow


onResize : (Window -> msg) -> Sub msg
onResize fromWindowToMsg =
    let
        fromDimensionToMsg : Int -> Int -> msg
        fromDimensionToMsg width height =
            Window
                { width = width
                , height = height
                }
                |> fromWindowToMsg
    in
    Browser.Events.onResize fromDimensionToMsg


toWidth : Window -> Attribute msg
toWidth _ =
    Element.width Element.fill


toHeight : Window -> Attribute msg
toHeight (Window { height }) =
    Element.height <| Element.px <| height - 60


classifyDevice : Window -> Device
classifyDevice (Window window) =
    let
        device : Element.Device
        device =
            Element.classifyDevice window
    in
    case ( device.class, device.orientation ) of
        ( Element.Phone, Element.Portrait ) ->
            PhonePortrait

        ( Element.Phone, Element.Landscape ) ->
            PhoneLandscape

        ( Element.Tablet, Element.Portrait ) ->
            TabletPortrait

        ( Element.Tablet, Element.Landscape ) ->
            TabletLandscape

        ( Element.Desktop, _ ) ->
            Desktop

        ( Element.BigDesktop, _ ) ->
            BigDesktop
