//= require application
//= require_self
//= require_tree ./components
//= require_tree ./models
//= require_tree ./routes
//= require_tree ./unit
//= require_tree ./views

// Set the application.
App = SettingUpEmberRails;

// Set up Ember testing.
App.rootElement = '#ember-testing';
App.setupForTesting();
App.injectTestHelpers();
