export default class RowWithForm {

  constructor(row) {
    this.link = row.querySelector('.form-inline-link')
    this.testTitle = row.querySelector('.test-title')
    this.formInline = row.querySelector('.form-inline')
  }

  addListenerToLink() {
    this.link.addEventListener('click', (event) => this.formInlineLinkHandler(event))
  }

  formInlineLinkHandler(event) {
    event.preventDefault()
    this.formInlineHandler()
  }

  formInlineHandler() {
    if (this.formInline.classList.contains('hide')) {
      this.testTitle.classList.add('hide')
      this.formInline.classList.remove('hide')
      this.link.textContent = 'cancel'
    } else {
      this.testTitle.classList.remove('hide')
      this.formInline.classList.add('hide')
      this.link.textContent = 'edit'
    }
  }
}