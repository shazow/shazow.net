+++
title = "Neither self nor this: Receivers in Go"
date = "2016-07-05 17:49:06 -0400"
+++

# Neither self nor this: Receivers in Go

When getting started with Go, there is a strong temptation to bring baggage from
your previous language. It’s a heuristic which is usually helpful, but sometimes
counter-productive and inevitably results in regret.

Go does not have classes and objects, but it does have types that we can make
many instances of. Further, we can attach methods to these types and they
kind-of start looking like the classes we’re used to. When we attach a method
to a type, the receiver is the instance of the type for which it was called.

Choosing the name of a receiver is not always a trivial task. Should we be lazy 
and name them all the same (like `this` or `self`)? Or treat them not unlike 
local variables by abbreviating the type (like `srv` to a `Server` type )? Or 
maybe something even more nuanced?

And what are the consequences? How will our code suffer if we choose one 
approach over the other? Let's explore.


## Quick refresher on Go structs

```go
type Server struct {
    ...
}

func (srv *Server) Close() error {
    ...
}

func (srv Server) Name() string {
    ...
}
```

Every time I start writing somekind of server, it starts out looking like this.  
It's a type that holds information about our server, like a `net.Listener` 
socket, and it has a `Close()` method that shuts down the server. Easy enough.

The *receiver* of the `Close()` method is the `(srv *Server)` part. This says 
that inside of the `Close()` method declaration, the scope will have a `srv` 
variable that is a reference to the instance of the `Server` that it's being 
called on.  That is:

```go
myServer := &Server{}
myServer.Close()
```

In this case, the `srv` that is referenced inside of the `myServer.Close()` is 
effectively the same variable as `myServer`. They're both references to the same 
`Server` instance.


### Facts about Go methods and receivers

While we can call a method on a type instance and get the receiver implicitly, 
it can also be called explicitly:

```go
myServer := &Server{}
Server.Name(myServer) // same as myServer.Name()
(*Server).Close(&myServer) // same as myServer.Close()
```

These functions can be passed around as references just like any other function, 
with the implicit receiver or without:

```go
withReceiver := myServer.Name
without := Server.Name
```

Receivers can be passed by reference or passed by value.

```go
func (byValue Server) Hello() { ... }
func (byReference *Server) Bye() { ... }
```

This is to illustrate that struct methods in Go are merely thin sugar over 
traditional C-style struct helper declarations. An equivalent C method might 
look like this:

```c
void server_close(server *srv) { ... }
```

Go helps by namespacing the methods and implicitly passing the receiver when 
called on an instance, but otherwise there is very little magic going on.

In other languages where `this` and `self` is a thing (Python, Ruby, JavaScript, 
and so on) it's a much more complicated situation. These are not vanilla local 
variables wearing fancy pants. The thing we might expect `this` to represent 
inside of a method could actually represent something very different once 
inheritance or metaclasses had their way. In effect, it might not make any sense 
to give contextual names like `srv` rather than `self` in Python, but it 
definitely makes sense in Go.


## Naming the receiver

As we write idiomatic Go code, it's common to use the first letter or a short 
abbreviation as the name of the receiver. If the name of the struct is `Server`, 
we'll usually see `s` or `srv` or even `server`. All of these are fine—short is 
convenient, but it's more about uniquely identifying the variable in a 
consistent way.

Why not `self` or `this`? Coming from languages like Python, or Ruby, or 
JavaScript, it's tempting to do something like:

```go
func (this *Server) Close() error {
    ...
}
```

That's one less decision to make every time we declare a struct. *All* of our 
methods could use the same receiver. Any time we see `this` in the code, we'll 
*know* that we're talking about the receiver, not some random local variable. It 
will be GREAT!.. or will it?

What if we refactor the code and `this` is no longer referring to the same thing 
as before? And are we giving up valuable semantic meaning?


### Reshaping our code

Eventually we'll need to refactor some of our code: Take a chunk of code that is 
already functional and put it in another context where it allows for more 
flexibility towards a higher-level goal.

For example, consider moving pieces of code *between* levels abstractions or 
from higher levels of abstraction into a lower level. Imagine taking this 
snippet from a higher-level container like `Room` which holds groups of users in 
a server, and moving it up or down one level:

```go
func (this *Room) Announce() {
    srv := this.Server()
    for _, c := range srv.Clients() {
        // Send announcement to all clients about a new room
        c.Send(srv.RenderAnnouncement(this))
    }
}

// Moved between...

func (this *Server) AddRoom(room *Room) {
    for _, c := range this.Clients() {
        // Send announcement to all clients about a new room
        c.Send(this.RenderAnnouncement(room))
    }
}
```

When using `this`, there is confusion about whether we're referring to the 
server or the room as we're moving the code between.

```diff
-       c.Send(this.RenderAnnouncement(room))
+       c.Send(srv.RenderAnnouncement(this))
```

Refactoring this kind of code produce some bugs that the compiler will hopefully 
catch (or maybe not, if the interfaces happen to be compatible). Even bugs 
aside, having to edit all the little innards does make moving code around more 
tedious.

Moving across levels of abstraction is a great example of when consistently 
well-named receivers make a huge difference:

```go
func (room *Room) Announce() {
    srv := room.Server()
    for _, c := range srv.Clients() {
        // Send announcement to all clients about a new room
        c.Send(srv.RenderAnnouncement(room))
    }
}

// Moved between...

func (srv *Server) AddRoom(room *Room) {
    for _, c := range srv.Clients() {
        // Send announcement to all clients about a new room
        c.Send(srv.RenderAnnouncement(room))
    }
}
```

This is a great little pattern to keep everything working despite moving between 
layers of abstraction. Note how the inner code stays identical and all we're 
doing is sometimes adding a little extra context outside of it.

As projects mature, this kind of refactoring happens surprisingly often. We're 
talking about just one line in this example, but the same applies for larger 
chunks too.

The suggested strategy for naming Go receivers is the same strategy for naming 
normal local variables. If they're named similarly, then these code blocks can 
be moved wholesale between layers of abstraction with minimal hassle and helps 
us avoid careless bugs.

By naming receivers as `this` or `self`, we're actually making receivers 
*special* in a way that is counter-productive. Imagine naming every local 
variable with the same name, all the time, regardless of what it represents? A 
scary thought.


## Advanced naming technique

If we agree that contextually named receivers are meaningful, then maybe we can 
utilize this opportunity for an even greater advantage.

What if we named our receivers based on the interface that they're implementing 
(if any)? Let's say we add `io.Writer` and `io.Reader` interfaces to our Server:

```go
func (w *Server) Write(p []byte) (n int, err error) {
    // Send p to all clients
}

func (r *Server) Read(p []byte) (n int, err error) {
    // Receive data from all clients
}
```

Maybe we also want to add the `http.Handler` interface to provide a dashboard 
for our server.

```go
func (handler *Server) ServeHTTP(w http.ResponseWriter, r *http.Request) {
    // Render dashboard
}
```

There are a few benefits to doing it this way:

* The receivers enhance the self-documenting nature of our code. It becomes 
  clearer which interface each method is attempting to implement.

* If we were implementing these wrappers outside of the `Server` struct, we 
  would likely be using similarly named variabls for intermediate code. By 
  naming the receiver in a corresponding way, it makes it easier to move the 
  code inline without changing much.

* As we add interface-specific functionality, it's likely that we'll need to add 
  more fields to our struct to manage various related state. The code can look 
  more meaningful when a read buffer is being accessed from a `r` receiver to 
  imply that its purpose is specifically for this functionality rather than it 
  being a more general buffer for the server as a whole.


## Name of the Receiver

Carefully naming our receivers can have lots of tangible benefits, especially as 
our project grows and code gets moved around. It can make our inner method code 
much more readable without needing to be aware of which struct it's embedded 
into. It can even add an opportunity to indicate higher-level layout of our 
struct's interface implementation.

Picking a fixed name for all receivers like `self` can have negative effects 
like mixing up context when code gets moved around. It removes a decision during 
writing, but the cost creeps up when we go back to read the code or refactor it.

Go forth and give your receivers the names they deserve.
