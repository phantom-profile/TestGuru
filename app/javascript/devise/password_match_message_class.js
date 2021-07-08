export default class PasswordMatchMessage {

  constructor(fields) {

    this.password = fields[0]
    this.passwordConfirmation = fields[1]

    this.match = this.passwordConfirmation.parentNode.querySelector('.notice')
    this.notMatch = this.passwordConfirmation.parentNode.querySelector('.alert')
  }

  catchEvents(fields) {
    this.password.addEventListener('input', () => this.displayMessage(fields))
    this.passwordConfirmation.addEventListener('input', () => this.displayMessage(fields))
  }

  displayMessage(fields) {
    this.password = fields[0]
    this.passwordConfirmation = fields[1]

    if (this.password.value !== this.passwordConfirmation.value) {
      this.notMatch.classList.remove('hide')
      this.match.classList.add('hide')
    } else {
      this.match.classList.remove('hide')
      this.notMatch.classList.add('hide')
    }
  }
}
