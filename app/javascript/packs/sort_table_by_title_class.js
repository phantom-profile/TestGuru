export default class SortTableByTitle {

  constructor(table) {
    this.table = table
    this.rows = Array.from(this.table.querySelectorAll('tr')).slice(1)

    this.arrowUpClasses = this.table.querySelector('.octicon-arrow-up').classList
    this.arrowDownClasses = this.table.querySelector('.octicon-arrow-down').classList
  }

  catchEvents(control_button) {
    control_button.addEventListener('click', () => this.makeSort())
  }

  compareRowsAsc(row1, row2) {
    return row1.cells[0].innerHTML < row2.cells[0].innerHTML ? 1 : -1
  }

  compareRowsDesc(row1, row2) {
    return row1.cells[0].innerHTML > row2.cells[0].innerHTML ? 1 : -1
  }

  makeSort() {
    if (this.arrowUpClasses.contains('hide')) {
      this.rows.sort(this.compareRowsAsc)
      this.arrowUpClasses.remove('hide')
      this.arrowDownClasses.add('hide')
    } else {
      this.rows.sort(this.compareRowsDesc)
      this.arrowUpClasses.add('hide')
      this.arrowDownClasses.remove('hide')
    }
    this.table.tBodies[0].append(...this.rows)
  }
}