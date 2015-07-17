import React, { Component } from 'react';

import { RouteHandler } from 'react-router';

import NotDefaultApp  from './NotDefaultApp';

const LoggedIn = React.createClass({
  contextTypes: {
    router: React.PropTypes.func
  },
  render: function () {
//    const path = this.context.router.getCurrentPath();
    var Route;
    if (false) {
      Route = <RouteHandler />;
    } else {
      Route = <NotDefaultApp />;
    }
    return (
      <div>
        {Route}
      </div>
    );
  }
});

module.exports = LoggedIn;
