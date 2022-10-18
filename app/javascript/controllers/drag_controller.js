import { Controller } from 'stimulus'
import Sortable from 'sortablejs'

export default class extends Controller {
  static targets = [ 'list' ]

  listTargetConnected() {
    this.listTargets.forEach(this.initializeSortable.bind(this))
  }

  initializeSortable(target) {
    new Sortable(target, {
      group: 'hiring-stage',
      animation: 100,
      sort: false
    })
  }
}