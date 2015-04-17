# Ruby on Rails Tutorial: sample application

This is the sample application for the
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).

## Possible improvements

### Chapter 6: 
* Add a test for the email downcasing from Listing 6.31, as shown in
Listing 6.41. This test uses the reload method for reloading a value from the
database and the assert_equal method for testing equality. To verify that
Listing 6.41 tests the right thing, comment out the before_save line to get to
red, then uncomment it to get to green. 
* By running the test suite, verify that
the before_save callback can be written using the “bang” method email.downcase!
to modify the email attribute directly, as shown in Listing 6.42. 
* As noted in
Section 6.2.4, the email regex in Listing 6.21 allows invalid email addresses
with consecutive dots in the domain name, i.e., addresses of the form
foo@bar..com. Add this address to the list of invalid addresses in Listing 6.19
to get a failing test, and then use the more complicated regex shown in Listing
6.43 to get the test to pass.

### Chapter 7:
* Verify that the code in Listing 7.31 allows the gravatar_for helper defined in
  Section 7.1.4 to take an optional size parameter, allowing code like
gravatar_for user, size: 50 in the view. (We’ll put this improved helper to use
in Section 9.3.1.)
* Write a test for the error messages implemented in Listing 7.18. How detailed
  you want to make your tests is up to you; a suggested template appears in
Listing 7.32.
* Write a test for the flash implemented in Section 7.4.2. How detailed you want
  to make your tests is up to you; a suggested ultra-minimalist template appears
in Listing 7.33, which you should complete by replacing FILL_IN with the
appropriate code. (Even testing for the right key, much less the text, is likely
to be brittle, so I prefer only to test that the flash isn’t nil.)
* As noted in Section 7.4.2, the flash HTML in Listing 7.25 is ugly. Verify by
  running the test suite that the cleaner code in Listing 7.34, which uses the
Rails content_tag helper, also works.

### Chapter 8:
* In Listing 8.32, we defined the new token and digest class methods by
  explicitly prefixing them with User. This works fine and, because they are
actually called using User.new_token and User.digest, it is probably the
clearest way to define them. But there are two perhaps more idiomatically
correct ways to define class methods, one slightly confusing and one extremely
confusing. By running the test suite, verify that the implementations in Listing
8.59 (slightly confusing) and Listing 8.60 (extremely confusing) are correct.
(Note that, in the context of Listing 8.59 and Listing 8.60, self is the User
class, whereas the other uses of self in the User model refer to a user object
instance. This is part of what makes them confusing.)

* As indicated in Section 8.4.6, as the application is currently designed
  there’s no way to access the virtual remember_token attribute in the
integration test in Listing 8.51. It is possible, though, using a special test
method called assigns. Inside a test, you can access instance variables defined
in the controller by using assigns with the corresponding symbol. For example,
if the create action defines an @user variable, we can access it in the test
using assigns(:user). Right now, the Sessions controller create action defines a
normal (non-instance) variable called user, but if we change it to an instance
variable we can test that cookies correctly contains the user’s remember token.
By filling in the missing elements in Listing 8.61 and Listing 8.62 (indicated
with question marks ? and FILL_IN), complete this improved test of the “remember
me” checkbox.

### Chapter 9:
* Write a test to make sure that friendly forwarding only forwards to the given
  URL the first time. On subsequent login attempts, the forwarding URL should
revert to the default (i.e., the profile page). Hint: Add to the test in Listing
9.26 by checking for the right value of session[:forwarding_url].
* Write an integration test for all the layout links, including the proper
  behavior for logged-in and non-logged-in users. Hint: Add to the test in
Listing 5.25 using the log_in_as helper.
* By issuing a PATCH request directly to the update method as shown in Listing
  9.59, verify that the admin attribute isn’t editable through the web. To be
sure your test is covering the right thing, your first step should be to add
admin to the list of permitted parameters in user_params so that the initial
test is red.
* Remove the duplicated form code by refactoring the new.html.erb and
  edit.html.erb views to use the partial in Listing 9.60. Note that you will
have to pass the form variable f explicitly as a local variable, as shown in
Listing 9.61.

### Chapter 10:
* Write an integration test for the expired password reset branch in Listing
  10.52 by filling in the template shown in Listing 10.57. (This code introduces
response.body, which returns the full HTML body of the page.) There are many
ways to test for the result of an expiration, but the method suggested by
Listing 10.57 is to (case-insensitively) check that the response body includes
the word “expired”.
* Right now all users are displayed on the user index page at /users and are
  visible via the URL /users/:id, but it makes sense to show users only if they
are activated. Arrange for this behavior by filling in the template shown in
Listing 10.58.9 (This uses the Active Record where method, which we’ll learn
more about in Section 11.3.3.) Extra credit: Write integration tests for both
/users and /users/:id.
* In Listing 10.42, both the activate and create_reset_digest methods make two
  calls to update_attribute, each of which requires a separate database
transaction. By filling in the template shown in Listing 10.59, replace each
pair of update_attribute calls with a single call to update_columns, which hits
the database only once. After making the changes, verify that the test suite is
still green.

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
