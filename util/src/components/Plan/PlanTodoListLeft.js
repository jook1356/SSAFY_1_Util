import React, { useEffect, useState, useRef } from "react";
import styles from "./PlanTodoListLeft.module.css";
import PlanTodoListLeftItem from "./PlanTodoListLeftItem";

const PlanTodoListLeft = (props) => {
  const todosLeftRef = useRef();
  const [newTodo, setNewTodo] = useState(false);

  const todoTitles = props.todos[props.plan.goalId]?.map((el, idx) => {
    return (
      <PlanTodoListLeftItem
        key={`todo-titles-${el.todoId}-${idx}`}
        applyTodoData={props.applyTodoData}
        getInputTodoData={props.getInputTodoData}
        todo={el}
        plan={props.plan}
      />
      // <div className={styles['todo-detail-wrapper']}>
      //     <div className={styles['todo-title-wrapper']}>
      //         <svg style={{marginRight: '6px', color: 'rgb(150, 150, 150)'}} xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-hash" viewBox="0 0 16 16">
      //             <path d="M8.39 12.648a1.32 1.32 0 0 0-.015.18c0 .305.21.508.5.508.266 0 .492-.172.555-.477l.554-2.703h1.204c.421 0 .617-.234.617-.547 0-.312-.188-.53-.617-.53h-.985l.516-2.524h1.265c.43 0 .618-.227.618-.547 0-.313-.188-.524-.618-.524h-1.046l.476-2.304a1.06 1.06 0 0 0 .016-.164.51.51 0 0 0-.516-.516.54.54 0 0 0-.539.43l-.523 2.554H7.617l.477-2.304c.008-.04.015-.118.015-.164a.512.512 0 0 0-.523-.516.539.539 0 0 0-.531.43L6.53 5.484H5.414c-.43 0-.617.22-.617.532 0 .312.187.539.617.539h.906l-.515 2.523H4.609c-.421 0-.609.219-.609.531 0 .313.188.547.61.547h.976l-.516 2.492c-.008.04-.015.125-.015.18 0 .305.21.508.5.508.265 0 .492-.172.554-.477l.555-2.703h2.242l-.515 2.492zm-1-6.109h2.266l-.515 2.563H6.859l.532-2.563z"/>
      //         </svg>
      //         {el.title}
      //     </div>
      // </div>
    );
  });

  const [newTodoTitleValue, setNewTodoTitleValue] = useState();

  const newTodoInputHandler = (event) => {
    setNewTodoTitleValue(event.target.value);
  };

  const newTodoClickShow = () => {
    setNewTodo(true);
    props.getNewTodoIdx(props.plan.goalId);
  };

  const newTodoClickHide = () => {
    if (newTodoTitleValue === "") {
      setNewTodo(false);
      props.getNewTodoIdx(-1);
    }
  };

  useEffect(() => {
    props.getInputTodoData(newTodoTitleValue, null, null, props.plan.goalId);
  }, [newTodoTitleValue]);

  const onEnterNewPlanHandler = (event) => {
    if (event.key === "Enter") {
      props.applyTodoData();
    }
  };

  useEffect(() => {
    setNewTodoTitleValue("");
  }, [props.newTodoGoalId === props.plan.goalId && newTodo]);

  const plusImg = (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      style={{
        color: "rgb(100,100,100)",
        marginLeft: "-5px",
        marginRight: "7px",
      }}
      width="24"
      height="24"
      fill="currentColor"
      className="bi bi-plus"
      viewBox="0 0 16 16"
    >
      <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
    </svg>
  );

  const newTodoDummy = (
    <div onClick={newTodoClickShow} className={styles["new-todo-wrapper"]}>
      {props.newTodoGoalId === props.plan.goalId && newTodo ? (
        <input
          type="text"
          value={newTodoTitleValue}
          onKeyPress={onEnterNewPlanHandler}
          onChange={newTodoInputHandler}
          onBlur={newTodoClickHide}
          placeholder="일정을 입력해 주세요."
          autoFocus
          className={styles["new-todo-input"]}
        />
      ) : (
        <div className={styles["new-todo"]}>{plusImg} TODO 작성</div>
      )}
    </div>
  );

  return (
    <div ref={todosLeftRef} className={styles["todos-left"]}>
      {newTodoDummy}
      {props.todos[props.plan.goalId] && todoTitles}
    </div>
  );
};

export default PlanTodoListLeft;
