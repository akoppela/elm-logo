module Basic exposing (main)

import Element
import Element.Background as Background
import ElmLogo
import Html exposing (Html)
import Html.Attributes as HtmlAttrs
import Svg
import Svg.Attributes as SvgAttrs


main : Html msg
main =
    Html.div [ HtmlAttrs.style "padding" "50px" ]
        [ Html.h1 [] [ Html.text "Html example:" ]
        , ElmLogo.html 100
        , Html.h1 [] [ Html.text "Svg example:" ]
        , Svg.svg
            [ SvgAttrs.width "100"
            , SvgAttrs.viewBox "0 0 100 100"
            ]
            [ ElmLogo.svg 100 ]
        , Html.h1 [] [ Html.text "Elm UI example:" ]
        , Element.layout [] (Element.el [ Element.alignLeft ] (ElmLogo.element 100))
        ]
