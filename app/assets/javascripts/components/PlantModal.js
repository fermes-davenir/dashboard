import Modal from './Modal'

class PlantModal extends Modal {
  constructor(el) {
    super(el)
  }
  fill(plant, from, to) {
    this.target.querySelector('[data-plant]').innerHTML = plant
    this.target.querySelector('[data-from]').innerHTML = from
    this.target.querySelector('[data-to]').innerHTML = to
  }
}

export default PlantModal
