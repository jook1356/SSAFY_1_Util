import React, {useEffect, useRef, useState} from "react";
import styles from './Calendar.module.css'
import { useSelector, useDispatch } from 'react-redux'
import { modifyPlanSliceActions } from '../../redux/planSlice'
import CalendarDateSelector from "./CalendarDateSelector";
import Swipe from "react-easy-swipe";
import { OverlayScrollbarsComponent } from "overlayscrollbars-react";



const Calendar = (props) => {
  const dateRangeWrapperRef = useRef()
  const monthSpaceRef = useRef()
  const monthBarRef = useRef()



  const getMonthDistance = (start, end) => {
    const startYear = start.getFullYear()
    const endYear = end.getFullYear()
    const startMonth = start.getMonth()
    const endMonth = end.getMonth()
    const startDate = start.getDate()
    const endDate = end.getDate()
    return ((endYear - startYear) * 12) - startMonth + endMonth;
  }

  const getXPointLib = (monthArray, gridWidth) => {
    const lib = {}
    monthArray.map((el, idx) => {
      const year = el.getFullYear()
      const month = el.getMonth()
      const date = el.getDate()
      const xPoint = gridWidth / date
      const key = parseInt(`${year}${month}`)
      lib[key] = Math.ceil(xPoint * 10) / 10 + 0.1
    })
    setXPointLib(() => lib)
  }


  const plans = props.plans
  const [monthDistance, setMonthDistance] = useState(getMonthDistance(props.startRange, props.endRange) + 1);
  const [monthRange, setMonthRange] = useState(Array(monthDistance).fill().map((arr, idx) => {
    return new Date(props.startRange.getFullYear(), props.startRange.getMonth() + idx + 1, 0)
  }))
  const planGridRef = Array(plans.length).fill(useRef([]), 0, plans.length)
  const containerRef = useRef()
  const [xPointLib, setXPointLib] = useState({})

  useEffect(() => {
    setMonthDistance(getMonthDistance(props.startRange, props.endRange) + 1)
    if (props.columns) {
      dateRangeWrapperRef.current.style.height = (props.columns + 1) * (planGridRef[0].current[0].clientHeight + 2) + 'px'
    }
    
  }, [props.startRange, props.endRange])

  useEffect(() => {
    setMonthRange(Array(monthDistance).fill().map((arr, idx) => {
      return new Date(props.startRange.getFullYear(), props.startRange.getMonth() + idx + 1, 0)
    }))
  }, [monthDistance])

  useEffect(() => {
    // monthSpaceRef.current.style.width = monthBarRef.current.clientWidth + 'px'
    if (monthRange) {
      getXPointLib(monthRange, planGridRef[0].current[0].clientWidth)
    }

  }, [monthRange])


  const monthGridDummy = monthRange.map((el, idx) => {
    return (
      <div key={`month-plan-bar-${idx}`}>
        <div id={`month-${props.startRange.getMonth() + idx + 1}`} className={`${styles['month-plan-bar']} ${plans.length % 2 ? styles['container-odd'] : styles['container-even']}`}>
          
          
        </div> 
      </div>
    )
  })

  // 해당 열의 월간 그리드
  const gridPerPlans = (rowIdx) => {
    const exec = monthRange.map((el, idx) => {
      return (
        <div key={`month-plan-bar-${idx}`}>
          <div ref={el => (planGridRef[rowIdx].current[idx] = el)} id={`month-${props.startRange.getMonth() + idx + 1}`} className={`${styles['month-plan-bar']} ${rowIdx % 2 ? styles['container-odd'] : styles['container-even']}`}>
          </div> 
        </div>
      )
    })
    return exec
  }
  
  
  // 월 타이틀 표시
  const monthTitleGrid = monthRange.map((el, idx) => {
    const tempDate = props.startRange
    const tempMonth = new Date(tempDate.getFullYear(), tempDate.getMonth() + idx, 1)
    return (
      <div key={`month-title-bar-${idx}`}>
        <div className={styles['month-title-bar']}>{tempMonth.getFullYear()}년 {tempMonth.getMonth() + 1}월</div>
      </div>
    )
  })


  // 목표의 개수에 따른 열 반복
  const totalPlansGrid = plans.map((el, idx) => {
    const columns = gridPerPlans(idx)
    return (
      <div ref={containerRef} className={styles['month-bar-container']} key={`month-bar-container-${idx}`}>
          {columns}
          <CalendarDateSelector idx={idx} period={plans[idx].period} startDate={plans[idx].startDate} endDate={plans[idx].endDate} planGridRef={planGridRef} xPointLib={xPointLib} monthRange={monthRange} gridStart={props.startRange} gridEnd={props.endRange} extendStartRange={props.extendStartRange} extendEndRange={props.extendEndRange} />
      </div>
    )
  })

  // const scrollHorizontalOnWheel = (event) => {
  //   const deltaX = event.deltaY * 4
  //   dateRangeWrapperRef.current.scrollBy({top:0, left:deltaX, behavior:'smooth'})
  // }


  const newPlanDummy = (
    <div className={styles['new-plan-dummy']}>
      {monthGridDummy}
    </div>
  )

  return (
      <div id="date-range" ref={dateRangeWrapperRef} onClick={() => console.log(dateRangeWrapperRef)}  className={styles['date-range-wrapper']}>
        <div className={styles['month-bar-container']}>
              {monthTitleGrid}
            </div>

            <OverlayScrollbarsComponent defer  className={styles['scroll-wrapper']}>
              <div ref={monthBarRef} className={styles['scroll-div']} >
                {totalPlansGrid}
                {props.columns? null : newPlanDummy}

                {/* <div ref={monthSpaceRef} className={styles['month-space']}>
                </div> */}
              </div>
              
              {/* 여백 */}
              
            </OverlayScrollbarsComponent>

        {/* <div className={styles['month-bar-wrapper']}>
          {totalPlansGrid}
          {props.columns? null : newPlanDummy}
          
        </div> */}
        
      </div>
  )
}

export default Calendar