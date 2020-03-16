import React from 'react';
import {ThemeProvider} from 'styled-components';
import './App.css';
import theme from './theme'
import Demo from './components/demo'

const App: React.FC = () => {
  return (
    <ThemeProvider theme={theme}>
      <div className="App">
        <Demo />
      </div>
    </ThemeProvider>
  );
}

export default App;
