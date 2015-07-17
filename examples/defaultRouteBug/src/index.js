import React from 'react';
import App from './App';

import DefaultApp from './DefaultApp';

import LoggedIn from './LoggedIn';

import Router, { Route, DefaultRoute } from 'react-router';

var routes = (
  <Route path="/" handler={App}>
    <DefaultRoute handler={DefaultApp} />
    <Route handler={DefaultApp} path="hi" />
    <Route handler={LoggedIn}>
      <Route name="nestedTesting" handler={DefaultApp} path="hi" />
    </Route>
  </Route>
);

Router.run(routes, Router.HistoryLocation, function(Handler, state) {
  React.render(<Handler a="a" />, document.getElementById('root'));
})

