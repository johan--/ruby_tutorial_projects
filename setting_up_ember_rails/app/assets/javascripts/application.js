// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require_tree

// for more details see: http://emberjs.com/guides/application/
MyApp = Ember.Application.create();

// Set the application.
App = MyApp;

// Set up ember-qunit
emq.globalize();
App.Resolver = Ember.DefaultResolver.extend({namespace: App});
setResolver(App.Resolver.create());

// Set up Ember testing.
App.rootElement = '#ember-testing';
App.setupForTesting();
App.injectTestHelpers();
