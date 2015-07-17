import React, { Component } from 'react';

import { RouteHandler } from 'react-router';

import NotDefaultApp  from './NotDefaultApp';

const LoggedIn = React.createClass({
  render: function () {
    var Route;
    if (false) {
      Route = <RouteHandler />;
    } else {
      Route = <NotDefaultApp />;
    }
    return (
      <div>
        <p>In LoggedIn</p>
        <RouteHandler />
      </div>
    );
  }
});

module.exports = LoggedIn;
