module Basic exposing (main)

import Element as E
import Element.Background as Background
import ElmLogo
import Html as H exposing (Html)
import Html.Attributes as HtmlA
import Svg
import Svg.Attributes as SvgA


main : Html msg
main =
    H.div [ HtmlA.style "padding" "50px" ]
        [ H.h1 [] [ H.text "Html example:" ]
        , ElmLogo.html 100
        , H.h1 [] [ H.text "Svg example:" ]
        , Svg.svg
            [ SvgA.width "100"
            , SvgA.viewBox "0 0 100 100"
            ]
            [ ElmLogo.svg 100 ]
        , H.h1 [] [ H.text "Style Elements example:" ]
        , E.layout [] (E.el [ E.alignLeft ] (ElmLogo.element 100))
        ]
