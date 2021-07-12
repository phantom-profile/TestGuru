export default class ProgressBar {
  constructor(questionRow) {
    this.questions = Array.from(questionRow.querySelectorAll('td')).slice(0, -1)
    this.currentQuestionNumber = questionRow.dataset.currentQuestion
  }

  showProgress() {
    this.questions.forEach((question) => this.isCompletedOrCurrent(question))
  }

  isCompletedOrCurrent(question) {
    if (question.dataset.questionNumber < this.currentQuestionNumber) {
       question.classList.add('completed-question')
    } else if (question.dataset.questionNumber === this.currentQuestionNumber) {
      question.classList.add('current-question')
    }
  }
}