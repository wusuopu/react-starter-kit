import React from 'react';
import { storiesOf } from '@storybook/react';
import Demo from '.'

storiesOf('Demo', module)
  .add('demo1', () => (
    <Demo />
  ));
