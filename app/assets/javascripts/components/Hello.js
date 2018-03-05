class Hello {
  constructor () {
    this.message = 'Hello !'
    this.say()
  }
  say () {
    console.log(this.message)
  }
}

export default new Hello
