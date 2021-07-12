import ProgressBar from "./progress_bar_class";

document.addEventListener('turbolinks:load', function () {
  let questionRow = document.querySelector('.progress-bar-row')
  if (questionRow) {
    let progressBar = new ProgressBar(questionRow)
    progressBar.showProgress()
  }
})
