// https://developer.mozilla.org/en-US/docs/Web/Guide/Events/Creating_and_triggering_events
document.addEventListener('turbolinks:load', function () {
    let confirmationPasswordInput = document.getElementById('user_password_confirmation');

    if (confirmationPasswordInput) {
        confirmationPasswordInput.addEventListener('input', confirmUserPassword)

        let passwordInput = document.getElementById('user_password');
        if (passwordInput) {
            passwordInput.addEventListener('input', function () {
                confirmationPasswordInput.dispatchEvent(new Event('input', {bubbles: true}))
            })
        }
    }
});

function confirmUserPassword() {
    let passwordInput = document.getElementById('user_password');

    if (!this.value || !passwordInput.value) {
        this.parentNode.querySelector('.octicon-check').classList.add('hide');
        this.parentNode.querySelector('.octicon-alert').classList.add('hide')
    } else if (this.value === passwordInput.value) {
        this.parentNode.querySelector('.octicon-check').classList.remove('hide');
        this.parentNode.querySelector('.octicon-alert').classList.add('hide')
    } else {
        this.parentNode.querySelector('.octicon-alert').classList.remove('hide');
        this.parentNode.querySelector('.octicon-check').classList.add('hide')
    }
}