export const unsafeMergeProps = (customClassName, { styled, ...domProps }) => ({
  ...domProps,
  className: customClassName,
})
