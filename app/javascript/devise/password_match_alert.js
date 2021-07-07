document.addEventListener('turbolinks:load', function () {
    let passwordFields = document.querySelectorAll('.match-password')
    if (passwordFields) {
        for (let i = 0; i < passwordFields.length; i++) {
            passwordFields[i].addEventListener(
                'input',
                () => passwordMatchMessage(passwordFields)
            )
        }
    }
})

function passwordMatchMessage(fields) {

    // fields with passwords
    let password = fields[0]
    let passwordConfirm = fields[1]

    // hidden messages
    let notMatch = passwordConfirm.parentNode.querySelector('.alert')
    let match = passwordConfirm.parentNode.querySelector('.notice')

    if (password.value !== passwordConfirm.value) {
        notMatch.classList.remove('hide')
        match.classList.add('hide')
    } else {
        match.classList.remove('hide')
        notMatch.classList.add('hide')
    }
}