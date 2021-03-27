module Maker = ReStyled_Maker.WithProps

module Div = Maker.MakeElement({
  let element = #div
})

module Button = Maker.MakeElement({
  let element = #button
})
