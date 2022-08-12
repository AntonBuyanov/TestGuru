document.addEventListener('turbolinks:load', function () {
    const bar = document.querySelector('.progress-bar')

    if (bar) {
        const questionNumber = bar.dataset.questionNumber
        const questionCount = bar.dataset.questionCount

        bar.style.width = progressTest(questionNumber, questionCount) + '%'
    }
})

function progressTest(questionNumber, questionCount) {
    return (parseFloat(questionNumber) / parseFloat(questionCount) * 100)
}
