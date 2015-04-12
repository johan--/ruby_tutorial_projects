# [Jumpstart Lab Tutorial](http://tutorials.jumpstartlab.com/projects/process_artist.html)

## Further exercises
Iteration 1: A Brush

* draw a shape where we click the mouse
* have a certain shape
* have a color
* have a scalable size

Key Methods
* mouse_pressed - runs once when the mouse button is first pressed down
* mouse_dragged - runs frequently when the mouse is moved while the button is pressed
* mouse_released - runs once when the mouse button is released
* mouse_x - the current x-axis position of the mouse
* mouse_y - the current y-axis position of the mouse


Iteration 2: Brush Colors, Sizes, and Shape

When your user types f followed by three RGB values (like 0,128,0), change the
active fill color to the color they entered.

 When your user types +, increase the size of the brush by one pixel.

When your user types -, decrease the size of the brush by one pixel.

Let’s allow users to use five different shape brushes. They can switch brushes
by typing s1 for "shape 1" or s2 for "shape 2".

* A circle
* An oval which is twice as wide as it is tall
* An oval which is twice as tall as it is wide
* A square
* A rectangle which is four times as wide as it is tall
* A rectangle which is four times as tall as it is wide
* A plus sign
* A clover shape (four partially overlapping circles)
* A shape you imagine yourself


Iteration 3: Erasing

If a user types a c, clear the entire screen using the current background
color.

If the user types an e, enable the eraser. It works exactly like a brush, but
instead of drawing with the current fill color, it draws with the background
color.

If the user types an a, turn on auto-erase. When they use a brush the shapes
appear only while they’re holding down the mouse. As soon as they let go of
the mouse, clear the screen.

When they type a again, turn auto-erase off so they can draw normally.
