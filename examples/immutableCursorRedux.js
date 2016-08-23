'use strict'; // eslint-disable-line

/**
 * @file Abstract immutable/contrib/cursor to use redux actions.
 * @author Patrick.John.Wheeler@gmail.com
 */

var Immutable = require('immutable');
var Cursor = require('immutable/contrib/cursor');

var __ = require('lodash');

function setIn(keyPath, value) {
  return {
    type: 'setIn',
    keyPath: keyPath,
    value: value,
  };
};

function deleteIn(keyPath, value) {
  return {
    type: 'deleteIn',
    keyPath: keyPath,
  };
};

function cursorReducer(state, action) {
  switch (action.type) {
    case 'setIn':
      return state.setIn(action.keyPath, action.value);
    case 'deleteIn':
      return state.deleteIn(action.keyPath);
    default:
      return state
  };
};

const Redux = require('redux');
const createStore = Redux.createStore;


var data = Immutable.fromJS({ a: { b: { c: 1 } } });
var imStore = createStore(cursorReducer, data);

/*
let unsubscribe = imStore.subscribe((...args) => {
  console.log('store subscribe');
  console.log(args);
  console.log(imStore.getState());
})
*/


var cursor = Cursor.from(imStore.getState(), (newData, oldData, keyPath, nothing) => {
/*
  console.log('newData', newData);
  console.log('oldData', oldData);
  console.log('keyPath', keyPath);
  console.log('nothing', nothing);
*/
  var newValue = newData.getIn(keyPath);
  if(__.isUndefined(newValue)){
    imStore.dispatch(deleteIn(keyPath));
  } else {
    imStore.dispatch(setIn(keyPath, newValue));
  }
});


console.log(cursor.getIn(['a', 'b', 'c'])); // 1
cursor = cursor.updateIn(['a', 'b', 'c'], x => x + 1);
console.log(cursor.getIn(['a', 'b', 'c'])); // 2

console.log(imStore.getState().getIn(['a', 'b', 'c'])); // 2
