import PasswordMatchMessage from './password_match_message_class'

document.addEventListener('turbolinks:load', function () {
  let passwordFields = document.querySelectorAll('.match-password')
  if (passwordFields.length) {
    let passwordMessage = new PasswordMatchMessage(passwordFields)
    passwordMessage.catchEvents(passwordFields)
  }
})
