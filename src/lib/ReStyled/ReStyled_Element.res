type htmlElement = [#div | #section | #p | #button]

@module("react")
external createElement: (htmlElement, ReactDOM.domProps) => React.element = "createElement"
