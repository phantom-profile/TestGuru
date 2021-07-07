document.addEventListener('turbolinks:load', function () {
  let passwordFields = document.querySelectorAll('.match-password')
  if (passwordFields) {
    passwordFields.forEach(function (field) {
      field.addEventListener(
        'input',
        function () {
          let matchMessage = new PasswordMatchMessage(passwordFields)
          matchMessage.displayMessage()
        }
      )
    })
  }
})

class PasswordMatchMessage {
  constructor(fields) {
    this.password = fields[0]
    this.passwordConfirmation = fields[1]

    this.match = this.passwordConfirmation.parentNode.querySelector('.notice')
    this.notMatch = this.passwordConfirmation.parentNode.querySelector('.alert')
  }

  displayMessage() {
    console.log(this.notMatch, this.match)
    if (this.password.value !== this.passwordConfirmation.value) {
      this.notMatch.classList.remove('hide')
      this.match.classList.add('hide')
    } else {
      this.match.classList.remove('hide')
      this.notMatch.classList.add('hide')
    }
  }
}