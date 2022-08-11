document.addEventListener('turbolinks:load', () => {
    const password = document.getElementById('user_password')
    const passwordConfirmation = document.getElementById('user_password_confirmation')

    const correctIcon = document.querySelector('.octicon-check')
    const incorrectIcon = document.querySelector('.octicon-x')

    const passwordCheck = () => {
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
