import React, { Component } from 'react';
import { NICE, SUPER_NICE } from './colors';

require('./App.scss');

export class App extends Component {
  render() {
    return (
      <div>
        <div className="outer">
          outer text
          <div className="inner">
            inner text
          </div>
        </div>
      </div>
    );
  }
}
