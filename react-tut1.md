Work through this - https://facebook.github.io/react/docs/tutorial.html

Components:
* CommentBox - contains the comment
* CommentList - list of comments
* CommentForm - 
* Comment - the actual comment

1. Define a simple div commentbox component and render this

All React class names start with an uppercase

Use ReactDOM.createElement to do this and render the root component

2. Create two new elements using React.createClass (one for listing comments and one for the create comment form)

Render these within the commentbox

3.  Create a Comment component which will receive data passed from the parent

Available as properties on the child component using thisprops

These properties are passed fom the JSX template:

	<Comment author="Pete Hunt">This is one comment</Comment>

4. Add remarkable which allows us to render HTML from MD

5. Get data into the CommentList

	data={this.props.data}
	<CommentBox data={data}/>

	var commentNodes = this.props.data.map(function(comment) {
      return (
        <Comment author={comment.author} key={comment.id}>
          {comment.text}
        </Comment>
      );
    });

6. Reactive State

	getInitialState:
	componentDidMount: 
	render:

Set a poll interval in the initial state.  Use $.ajax to load the results from the server.

7. Create a CommentForm component

You can set the initial state and handle the event changes using standard onChange events

e.g. handlesubmit, handleTextChange
