open CssJs

type textProps = {visible: bool}

module Wrapper = ReStyled.Div({
  let styles = [display(#flex)]
})

module Button = ReStyled.Button({
  let styles = [textDecoration(none)]
})

module Text = ReStyled.Dynamic.Div({
  type props = textProps
  let styles = ({visible}) => [display(visible ? #flex : #none), fontSize(16->px)]
})
