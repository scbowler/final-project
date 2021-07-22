import React from 'react';

export default class Home extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      todos: []
    };
  }

  componentDidMount() {
    this.getTodos();
  }

  getTodos() {
    fetch('/api/todos')
      .then(res => res.json())
      .then(todos => {
        this.setState({ todos: todos });
      });
  }

  render() {
    const { todos } = this.state;

    return (
      <div className="container py-5">
        <h1 className="text-center">Things To Do</h1>

        <ul className="list-group list-group-flush">
          {
            todos.map(todo => (
              <li key={todo.todoId} className="list-group-item">
                <h5>{todo.name}</h5>
                <p>{todo.details}</p>
                <p>
                  <small className="text-black-50">Created By: {todo.firstName}</small>
                </p>
              </li>
            ))
          }
        </ul>
      </div>
    );
  }
}
