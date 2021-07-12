import TestPassageTimer from "./test_passage_timer_class";

document.addEventListener('turbolinks:load', function () {
  let timerField = document.querySelector('.test-passage-timer')
  if (timerField) {
    let testPassageTimer = new TestPassageTimer(timerField)
    testPassageTimer.start()
  }
})
