Pomodoro Simple Timer
=====================

This project achieves very simple timer, used specifically to help you
concentrate using [Pomodoro Technique](http://en.wikipedia.org/wiki/Pomodoro_Technique).

It comes with a simple GUI written with qt-bindings. 
Also, the whole application is designed in a hexagonal fashion.

Refactoring considerations:
---------------------------

* I think that EventMachine to make simple 1-second ticking is a huge overkill.
  Is there a sensible and performant way to make this ticking possible?
