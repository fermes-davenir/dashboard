class Grow {
  constructor() {
    this.table = document.getElementById('grow')
    this.weeks = 52
    this.duration
    this.plantation
    this.table != null ? this.generator() : null
  }
  generator() {
    this.events()
    this.engine()
  }
  engine() {
    this.duration = parseInt(this.table.dataset.harvest)
    this.plantation = this.table.dataset.plant.split('-').map(x => parseInt(x))
    let tds = this.table.getElementsByTagName('td')
    for(let j = 0; j < tds.length; j++) {
      tds[j].classList = ''
    }
    for(let i = this.plantation[0]; i <= this.plantation[1]; i++) {
      tds[(i-1)%this.weeks].classList = 'plant'
      tds[(i-1+this.duration)%this.weeks].classList = 'harvest'
    }
  }
  events() {
    this.table.addEventListener('mouseover', (e) => {
      let week = e.target.dataset.week
      if (week >= this.plantation[0] && week <= this.plantation[1]) {
        this.harvestColorization(parseInt(e.target.dataset.week))
      } else {
        this.engine()
      }
    })
    this.table.addEventListener('mouseleave', () => {
      this.engine()
    })
  }
  harvestColorization(from) {
    let tds = this.table.getElementsByTagName('td')
    for (let i = 0; i < tds.length; i++) {
      if (from > (from+this.duration)%this.weeks) {
        // Winter is coming
        if (i >= from%this.weeks || i < (from+this.duration)%this.weeks) {
          tds[i%this.weeks].classList = 'duration'
        } else {
          tds[i].classList = ''
        }
      } else {
        // Same year
        if (i >= from%this.weeks && i < (from+this.duration)%this.weeks) {
          tds[i%this.weeks].classList = 'duration'
        } else {
          tds[i].classList = ''
        }
      }
    }
    tds[(from-1)%this.weeks].classList = 'plant'
    tds[(from+this.duration-1)%this.weeks].classList = 'harvest'
  }
}

let grow = new Grow
