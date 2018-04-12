import PlantModal from './PlantModal.js'

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
        this.harvestColorization(parseInt(week))
      } else {
        this.engine()
      }
    })
    this.table.addEventListener('click', (e) => {
      let week = e.target.dataset.week
      let plantShow = new PlantModal(document.getElementById('plantation-modal'))
      if (week >= this.plantation[0] && week <= this.plantation[1]) {
        this.setPlanification(parseInt(week))
      }
      plantShow.fill('PLANT', 'FROM', 'TO')
      plantShow.show()
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
  setPlanification(week) {
    let path = document.location.pathname
    let plant_id = parseInt(path.substring(path.lastIndexOf("/") + 1))

    let xhr = new XMLHttpRequest()
    let params = `planification[plant_id]=${plant_id}&planification[seed_week]=${week}`

    xhr.open("POST", "/planifications.json", true)
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
    xhr.setRequestHeader("X-CSRF-Token", document.querySelector('meta[name="csrf-token"]').content)

    xhr.onreadystatechange = () => {
      if (xhr.readyState == 4 && xhr.status == 200) {
        console.log(JSON.parse(xhr.responseText));
      }
    }

    xhr.send(params);
  }
}

export default new Grow
