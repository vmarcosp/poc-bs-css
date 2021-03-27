open Toggle_Styled

@react.component
let make = () => {
  let (visible, setVisible) = React.useState(_ => false)

  <Wrapper>
    <Text styled={{visible: visible}}> {"rescript + bs-css"->React.string} </Text>
    <Button onClick={_ => setVisible(_ => !visible)}> {"Toggle"->React.string} </Button>
  </Wrapper>
}
