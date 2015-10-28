import React, { Component } from 'react';
import { NICE, SUPER_NICE } from './colors';

class Counter extends Component {
  constructor(props) {
    super(props);
    this.state = { counter: 0 };
    this.interval = setInterval(() => this.tick(), 1000);
  }

  tick() {
    this.setState({
      counter: this.state.counter + this.props.increment
    });
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }

  render() {
    return (
      <h1 style={{ color: this.props.color }}>
        Counter ({this.props.increment}): {this.state.counter}
      </h1>
    );
  }
}

const sassLoader = require('sass-variables-loader');

const sass = `
 $silver: #bdc2ca;
 $silver2: #ddc2ca;
`;

const loadedSass = JSON.parse(sassLoader(sass).replace(/module\.exports = ([^;]+);/, (_, m) => m));

export class App extends Component {
  render() {
    return (
      <div>
        {JSON.stringify(loadedSass)}
        <br />
        {loadedSass.silver2}
        <Counter increment={1} color={NICE} />
        <Counter increment={5} color={SUPER_NICE} />
      </div>
    );
  }
}
