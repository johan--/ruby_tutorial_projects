# Ruby on Rails Tutorial: sample application

This is the sample application for the
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).

## Possible improvements

### Chapter 9:
* Write a test to make sure that friendly forwarding only forwards to the given
  URL the first time. On subsequent login attempts, the forwarding URL should
revert to the default (i.e., the profile page). Hint: Add to the test in Listing
9.26 by checking for the right value of session[:forwarding_url].

### Chapter 12: 
* Write tests for the stats on the Home and profile pages. Hint: Add to the test
  in Listing 11.27. (Why don’t we have to test the stats on the Home page
separately?)
