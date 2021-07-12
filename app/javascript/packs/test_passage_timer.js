import TestPassageTimer from "./test_passage_timer_class";

document.addEventListener('turbolinks:load', function () {
  let timerField = window['test-passage-timer']
  if (timerField) {
    const testPassageTimer = new TestPassageTimer(timerField)
    testPassageTimer.start()
  }
})
