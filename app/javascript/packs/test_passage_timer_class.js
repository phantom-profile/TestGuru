export default class TestPassageTimer {
  constructor(timer) {
    this.timer = timer
    this.time = parseInt(timer.dataset.timeForTest)
    this.alertBorderNotReached = true
  }

  divInt = (val, by) => {
    return (val - val % by) / by;
  }

  parseTime = () => {
    let m = this.divInt(this.time, 60)
    let s = this.time % 60
    return [ m,  s]
  }

  eachSecondAction = () => {
    let [minutes, seconds] = this.parseTime()
    if (minutes <= 2 && this.alertBorderNotReached) {
      this.timer.classList.remove('ok-timer')
      this.timer.classList.add('alert-timer')
      this.alertBorderNotReached = false
    }
    if (this.time > 0) this.time--
    // timer nice displaying
    if (seconds < 10) seconds = '0' + seconds
    this.timer.innerText = `${minutes}:${seconds}`
  }

  start() {
    setInterval(this.eachSecondAction, 1000);
  }
}