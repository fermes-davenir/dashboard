import Modal from './Modal'

class PlanificationDelete {
  constructor() {
    this.container = document.getElementById('dashboard')
    if (this.container) {
      this.events()
    }
  }
  events() {
    let planifications = this.container.getElementsByClassName('planification')
    for (let i = 0; i < planifications.length; i++) {
      let deleteIcon = planifications[i].getElementsByClassName('delete-icon')[0]
      if (deleteIcon != null) {
        deleteIcon.addEventListener('click', () => {
          let id = planifications[i].dataset.id
          this.getPlanification(id)
        })
      }
    }
  }
  popup(id, content) {
    let plantDelete = new Modal(document.getElementById('dashboard-modal'))
    let text = `Voulez-vous vraiment supprimer : ${content.name} de la semaine ${content.seed_week}
      (du ${content.seed_date[0]} au ${content.seed_date[1]})
      à la semaine ${content.harvest_week}
      (du ${content.harvest_date[0]} au ${content.harvest_date[1]})`
    plantDelete.fill(`Supprimer ${content.name}`, text)
    plantDelete.show()
    plantDelete.target.getElementsByClassName('delete-action')[0].addEventListener('click', () => {
      this.delete(id)
    })
  }
  getPlanification(id) {
    let xhr = new XMLHttpRequest()

    xhr.open("GET", `/planifications/${id}.json`, true)
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
    xhr.setRequestHeader("X-CSRF-Token", document.querySelector('meta[name="csrf-token"]').content)
    xhr.onreadystatechange = () => {
      if (xhr.readyState == 4 && xhr.status == 200) {
        this.popup(id, JSON.parse(xhr.responseText))
      }
    }
    xhr.send()
  }
  delete(id) {
    let xhr = new XMLHttpRequest()

    xhr.open("DELETE", `/planifications/${id}`, true)
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
    xhr.setRequestHeader("X-CSRF-Token", document.querySelector('meta[name="csrf-token"]').content)
    xhr.onreadystatechange = () => {
      if (xhr.readyState == 4 && xhr.status == 200) {
        location.reload()
      } else {
        console.log(xhr.responseText)
      }
    }
    xhr.send()
  }
}

export default new PlanificationDelete
