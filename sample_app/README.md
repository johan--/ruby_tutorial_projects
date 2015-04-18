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

### Chapter 11:
* Refactor the Home page to use separate partials for the two branches of the
  if-else statement.
* Add tests for the sidebar micropost count (including proper pluralization).
  Listing 11.67 will help get you started.
* Following the template in Listing 11.68, write a test of the image uploader in
  Section 11.4. As preparation, you should add an image to the fixtures
directory (using, e.g, cp app/assets/images/rails.png test/fixtures/). (If
you’re using Git, I also recommend updating your .gitignore file as shown in
Listing 11.69.) To avoid a confusing error, you will also need to configure
CarrierWave to skip image resizing in tests by creating an initializer file as
shown in Listing 11.70. The additional assertions in Listing 11.68 check both
for a file upload field on the Home page and for a valid image attribute on the
micropost resulting from valid submission. Note the use of the special
fixture_file_upload method for uploading files as fixtures inside tests.22 Hint:
To check for a valid picture attribute, use the assigns method mentioned in
Section 10.1.4 to access the micropost in the create action after valid
submission.

### Chapter 12: 
* Write tests for the stats on the Home and profile pages. Hint: Add to the test
  in Listing 11.27. (Why don’t we have to test the stats on the Home page
separately?)
* Write a test to verify that the first page of the feed appears on the Home
  page as required. A template appears in Listing 12.49. Note the use of HTML
escaping via CGI.escapeHTML; see if you can figure out why this is necessary.
(Try removing the escaping and carefully inspect the page source for the
micropost content that doesn’t match.)
