class Modal {
  constructor(el) {
    this.body = document.body
    this.backdrop
    this.target = el
    this.events()
  }
  show() {
    this.target.classList.add('show')
    this.body.classList.add('modal-open')
    this.backdrop = document.createElement('div')
    this.backdrop.classList = 'modal-backdrop fade'
    this.body.appendChild(this.backdrop)
    setTimeout(() => {
      this.backdrop.classList.add('show')
    }, 200);
  }
  hide() {
    this.target.classList.remove('show')
    this.body.classList.remove('modal-open')
    this.backdrop.classList.remove('show')
    setTimeout(() => {
      this.backdrop.remove()
    }, 200);
  }
  events() {
    let close = this.target.getElementsByClassName('close-action')
    for (let i = 0; i < close.length; i++) {
      close[i].addEventListener('click', () => {
        this.hide()
      })
    }
  }
}

export default Modal
