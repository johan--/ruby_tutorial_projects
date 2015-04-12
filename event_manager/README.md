# [Jumpstart Lab Tutorial](http://tutorials.jumpstartlab.com/projects/eventmanager.html)

## Further exercises
Iteration: Time Targeting

The boss is already thinking about the next conference: "Next year I want to make better use of our Google and Facebook advertising. Find out which hours of the day the most people registered so we can run more ads during those hours." Interesting!

Using the registration date and time we want to find out what are the peak registration hours.

Ruby has a Date library which contains classes for Date and DateTime.

DateTime#strptime is a method that allows us to parse date-time strings and convert them into Ruby objects.

DateTime#strftime is a good reference on the characters necessary to match the specified date-time format.

Use Date#hour to find out the hour of the day.



Iteration: Day of the Week Targeting

The big boss gets excited about the results from your hourly tabulations. It looks like there are some hours that are clearly more important than others. But now, tantalized, she wants to know "What days of the week did most people register?"

Use Date#wday to find out the day of the week.
