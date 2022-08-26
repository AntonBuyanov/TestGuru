document.addEventListener('turbolinks:load', () => {
    const timer = document.querySelector('.countdown')

    if (timer) {
        let timeFinish = new Date(timer.dataset.timer)

        setInterval(function() {
            let timeNow = Date.now()
            let timeDifference = timeFinish - timeNow


            let minutes = Math.floor((timeDifference / (1000 * 60)) % 60)
            let seconds = Math.floor((timeDifference % (1000 * 60)) / 1000)

            minutes = minutes < 10 ? "0" + minutes : minutes
            seconds = seconds < 10 ? "0" + seconds : seconds

            if (timeNow < timeFinish) {
                timer.innerHTML = "Осталось времени: " + minutes + ":" + seconds
            }
            else {
                document.querySelector('form').submit()
            }
        }, 1000)
    }
})

