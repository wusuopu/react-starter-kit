import styled from 'styled-components'
import { flexbox, space, color, position, layout, background, border, shadow, typography } from 'styled-system'
import { FlexboxProps, SpaceProps, ColorProps, PositionProps, LayoutProps, BackgroundProps, BorderProps, ShadowProps, TypographyProps } from 'styled-system'

type ViewProps = FlexboxProps & SpaceProps & ColorProps & PositionProps & LayoutProps & BackgroundProps & BorderProps & ShadowProps & TypographyProps;
const Box = styled.div<ViewProps>`
${flexbox};
${space};
${color};
${position};
${layout};
${background};
${border};
${shadow};
${typography};
`;
Box.displayName = 'Box'
const Flex = styled(Box).attrs({
  display: 'flex',
})<ViewProps>``;
Flex.displayName = 'Flex'

const Col = styled(Flex).attrs({
  flexDirection: 'column'
})<ViewProps>``;
Col.displayName = 'Col'

const Row = styled(Flex).attrs({
  flexDirection: 'row'
})<ViewProps>``;
Row.displayName = 'Row'

export {
  Col,
  Row,
  Flex,
  Box,
}
