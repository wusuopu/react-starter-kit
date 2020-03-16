import React from 'react'
import { Button } from 'antd'
import { Box } from 'rebass'

const Demo = () => {
  return (
    <Box my={[1, 1, 2, 2]}>
      <h1>Demo</h1>
      <Button type="primary" size="large">test</Button>
    </Box>
  )
}

export default Demo
