import React from 'react';
import App from './App';

import DefaultApp from './DefaultApp';

import Router, { Route, DefaultRoute } from 'react-router';

var routes = (
    <Route path="/" handler={App}>
        <DefaultRoute handler={DefaultApp} />
    </Route>
);

Router.run(routes, function(Handler) {
    React.render(<Handler />, document.body);
})

