27th July 2014
--------------
Looks like random terrian generation will be quite useful here to expand the
viewable window area. Think about building something that will generate this.

26th July 2014
--------------
So this is an attempt to externalise my thoughts about build what is currently
known as 'Praxis'. Praxis is a massively multiplayer online game
featuring an isometric interface, division of the game world into 'zones' and
a combination of turnbased and realtime gameplay. It's likely to change.

I'm currently working towards developing a very stripped down version which will
be used on my homepage as a portfolio piece. This stripped down version should
feature:

* A single 'zone'.
* Keyboard / mouse based scrolling of the view window.
* Avatars for each user connected to the site.
* Dynamic lighting.
* Some sort of windowing system to access content.

## Today I'm going to be working on:

* Capturing keyboard input.
* Getting the display window to work correctly.
* Mouse based scrolling.

## Random thoughts:

* I have this data structure for dealing with grids (and later 3d lattices)
which is being shared through the code. I still don't feel it's quite right yet.

## Outcome from today

Didn't get to nail any of the scrolling but after a lot of refactoring code
around the grid data object I seem to have a 'window' which can be scrolled
around.