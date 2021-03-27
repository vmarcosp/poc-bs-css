module DynamicProps = ReStyled_DynamicProps
module Props = ReStyled_Props
module Element = ReStyled_Element
module Option = Belt.Option

@module("./MergeProps.js")
external unsafeMergeProps: (string, 'a) => ReactDOM.domProps = "unsafeMergeProps"

module WithProps = {
  module type ElementMaker = {
    let element: Element.htmlElement
  }

  module type StylesMaker = {
    type props
    let styles: props => array<Css_Js_Core.rule>
  }

  module MakeElement = (ElementMaker: ElementMaker, StylesMaker: StylesMaker) => {
    let makeProps = DynamicProps.makeProps
    let make = (props: DynamicProps.makeProps<StylesMaker.props>) => {
      let styledClass = CssJs.style(. StylesMaker.styles(props->DynamicProps.styledGet))
      let customClassName = DynamicProps.classNameGet(props)->Option.getWithDefault("")
      let className = j`$styledClass $customClassName`

      Element.createElement(ElementMaker.element, unsafeMergeProps(className, props))
    }
  }
}

module WithoutProps = {
  module type ElementMaker = {
    let element: Element.htmlElement
  }

  module type StylesMaker = {
    let styles: array<Css_Js_Core.rule>
  }

  module MakeElement = (ElementMaker: ElementMaker, StylesMaker: StylesMaker) => {
    let makeProps = Props.makeProps
    let make = (props: Props.makeProps) => {
      let styledClass = CssJs.style(. StylesMaker.styles)
      let customClassName = Props.classNameGet(props)->Option.getWithDefault("")
      let className = j`$styledClass $customClassName`

      Element.createElement(ElementMaker.element, unsafeMergeProps(className, props))
    }
  }
}
