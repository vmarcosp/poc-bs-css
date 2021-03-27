module Maker = ReStyled_Maker.WithoutProps

module Div = Maker.MakeElement({
  let element = #div
})

module Button = Maker.MakeElement({
  let element = #button
})
