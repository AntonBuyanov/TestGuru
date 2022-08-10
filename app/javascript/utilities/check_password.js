document.addEventListener('turbolinks:load', () => {
    var password = document.getElementById('user_password')
    var passwordConfirmation = document.getElementById('user_password_confirmation')

    var correctIcon = document.querySelector('.octicon-check')
    var incorrectIcon = document.querySelector('.octicon-x')

    var passwordCheck = () => {
        if (passwordConfirmation.value === '') {
            correctIcon.classList.add('hide')
            incorrectIcon.classList.add('hide')
        } else if (passwordConfirmation.value === password.value) {
            correctIcon.classList.remove('hide')
            incorrectIcon.classList.add('hide')
        } else {
            correctIcon.classList.add('hide')
            incorrectIcon.classList.remove('hide')
        }
    }

    if (password && passwordConfirmation) {
        passwordConfirmation.addEventListener('input', () => passwordCheck())
        password.addEventListener('input', () => passwordCheck())
    }
})
