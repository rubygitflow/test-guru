document.addEventListener('turbolinks:load', function () {
    let controls = document.querySelectorAll('.form-inline-link');

    if (controls.length) {
        for (let i = 0; i < controls.length; i++) {
            controls[i].addEventListener('click', formInlineLinkHandler)
        }
    }

    let errors = document.querySelector('.resource-errors');

    if (errors) {
        let resourceId = errors.dataset.resourceId;
        let cancelCap = errors.dataset.cancelCap;
        let editCap = errors.dataset.editCap;
        formInlineHandler(resourceId, cancelCap, editCap)
    }
});

function formInlineLinkHandler(event) {
    event.preventDefault();

    let testId = this.dataset.testId;
    let cancelCap = this.dataset.cancelCap;
    let editCap = this.dataset.editCap;
    formInlineHandler(testId, cancelCap, editCap)
}

function formInlineHandler(testId, cancelCap, editCap) {
    let link = document.querySelector(`.form-inline-link[data-test-id="${testId}"]`);
    let testTitle = document.querySelector(`.test-title[data-test-id="${testId}"]`);
    let formInline = document.querySelector(`.form-inline[data-test-id="${testId}"]`);

    if (formInline.classList.contains('hide')) {
        testTitle.classList.add('hide');
        formInline.classList.remove('hide');
        link.textContent = `${cancelCap}`
    } else {
        testTitle.classList.remove('hide');
        formInline.classList.add('hide');
        link.textContent = `${editCap}`
    }
}